Leantime 
==============================

Leantime_ is a lean open source project management system for
startups and innovators written in PHP, Javascript with MySQL.
Designed to help you manage your projects from ideation to delivery.

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
.. _Adminer: https://www.adminer.org/
.. _Postfix: https://www.postfix.org/
