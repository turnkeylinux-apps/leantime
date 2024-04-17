Leantime - Project Management System
====================================

Leantime_ is a lean, open source project management system for
startups and innovators. It's written in PHP, Javascript; backed by a MySQL
(MariaDB) database. Designed to help you manage your projects from ideation
to delivery.

Features:

- Task management using kanban boards, table and calendar views
- Idea boards & idea kanban boards
- Research boards using the Lean Canvas
- Milestone management using Gantt charts
- Timesheet management
- Retrospectives
- Project dashboards & Reports
- Multiple user roles (client, team member, client manager, manager, admin)
- Two-Factor Authentication
- Integrations with Mattermost, Slack & Zulip
- Export timesheets, tasks and milestones to CSV
- Available in English, Spanish, Russian, Dutch

Leantime includes all the standard features in `TurnKey Core`_, and on
top of that:

- Leantime installed from upstream source code to /var/www/leantime

  **Security note**: Updates to Leantime may require supervision so they
  **ARE NOT** automated.

  To update Leantime, please see `Leantime's notes`_. If you have troubles,
  please post in `our forums`_ (`sign up for a new account`_ if you don't
  have one - include your questions there too if you want).

- SSL support out of the box.
- `Adminer`_ administration frontend for MySQL (MariaDB) (listening on port
  12322 - uses SSL).
- `Postfix`_ MTA (bound to localhost) to allow sending of email.
- Webmin modules for configuring Apache2, PHP, MySQL and Postfix.

Credentials *(passwords set at first boot)*
-------------------------------------------

-  Webmin, SSH, MySQL: username **root**

-  Adminer: username **adminer**

- Leantime: username is email - set at firstboot

.. _Leantime: https://leantime.io/
.. _TurnKey Core: https://www.turnkeylinux.org/core
.. _Leantime's notes: https://github.com/leantime/leantime/?tab=readme-ov-file#-update
.. _our forums: https://www.turnkeylinux.org/forum/support
.. _sign up for a new account: https://www.turnkeylinux.org/user/register
.. _Adminer: https://www.adminer.org/
.. _Postfix: https://www.postfix.org/
