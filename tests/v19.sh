#!/bin/bash
set -euo pipefail

result=${TKL_TEST_RESULT:?}
password=${TKL_TEST_APP_PASS:?}
work=/run/tkl-v19-tests/leantime
base=https://www.example.com
admin_email=admin@example.invalid
curl_args=(-kfsS --resolve www.example.com:443:127.0.0.1)
mkdir -p "$work"

systemctl --quiet is-active apache2.service mariadb.service
grep -q '\[40leantime\] successfully completed' /var/log/inithooks.log
curl "${curl_args[@]}" -c "$work/cookies" "$base/auth/login" \
    >"$work/login-page.html"
grep -Eqi 'login|password' "$work/login-page.html"
csrf=$(sed -n 's/.*name="_token"[^>]*value="\([^"]*\)".*/\1/p' \
    "$work/login-page.html" | head -1)
test -n "$csrf"

curl "${curl_args[@]}" -b "$work/cookies" -c "$work/cookies" \
    -D "$work/login.headers" -o "$work/login-response.html" \
    --data-urlencode "_token=$csrf" \
    --data-urlencode "username=$admin_email" \
    --data-urlencode "password=$password" \
    --data-urlencode redirectUrl=/dashboard/home \
    "$base/auth/login"
curl "${curl_args[@]}" -b "$work/cookies" "$base/dashboard/home" \
    >"$work/dashboard.html"
grep -Eqi 'dashboard|project|leantime' "$work/dashboard.html"
! grep -q 'name="password"' "$work/dashboard.html"

runuser -u www-data -- test ! -w /var/www/leantime/public/index.php
runuser -u www-data -- test ! -w /var/www/leantime/vendor/autoload.php
runuser -u www-data -- test ! -w /var/www/leantime/config/configuration.php
runuser -u www-data -- touch /var/www/leantime/storage/.tkl-v19-write-test
runuser -u www-data -- rm /var/www/leantime/storage/.tkl-v19-write-test
runuser -u www-data -- touch /var/www/leantime/userfiles/.tkl-v19-write-test
runuser -u www-data -- rm /var/www/leantime/userfiles/.tkl-v19-write-test

mysql -N leantime -e "SELECT username FROM zp_user WHERE id=1" \
    | grep -Fxq "$admin_email"
systemctl restart mariadb.service apache2.service
curl "${curl_args[@]}" -b "$work/cookies" "$base/dashboard/home" \
    >"$work/dashboard-after-restart.html"
grep -Eqi 'dashboard|project|leantime' "$work/dashboard-after-restart.html"
! grep -q 'name="password"' "$work/dashboard-after-restart.html"

! grep -F -- "$password" /var/log/inithooks.log

cat >"$result" <<EOF
package_source=official Leantime v3.9.8 release archive pinned by SHA-256
installed_version=3.9.8
runtime_checks=Apache and MariaDB services, firstboot completion, HTTPS admin login, dashboard session across restart, database identity, ownership boundaries, password log hygiene
updater_command=supervised official Leantime release replacement procedure
updater_result=installed version unchanged during QA
updater_channel=official Leantime stable releases
integrity_evidence=release archive pinned to 7977f0477efec844b667676345ab06b0697a1cd1352aa698999af018c2c99d52
EOF
