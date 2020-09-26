Postgres
========

### Installation 

(Archlinux):
```bash
sudo pacman -S postgresql
```

### Initial configuration

Switch to the PostgreSQL user (if you have sudo and are in sudoers):
```bash
sudo -iu postgres
```

Before PostgreSQL can function correctly, the database cluster must be initialized:
```bash
[postgres]$ initdb -D /var/lib/postgres/data
```

Return to the regular user:
```bash
[postgres]$ exit
```

Start the service:
```bash
sudo systemctl start postgresql
```

### Create your first database/user

If you create a PostgreSQL user with the same name as your Linux username, it allows you to access the PostgreSQL database shell without having to specify a user to login (which makes it quite convenient).
The -u (user) option causes sudo to run the specified command as a user other than root:
```bash
sudo -iu postgres
createuser --interactive
```

With password:
```bash
sudo -iu postgres
createuser --interactive --pwprompt
```

Create a new database over which the above user has read/write privileges using the createdb command (execute this command from your login shell if the database user has the same name as your Linux user, otherwise add -O database_username to the following command).

If you did not grant your new user database creation privileges, add -U postgres to the following command.
```bash
createdb my_database_name
```

To remove db.
```bash
dropdb my_database_name
```

### Access the database shell
Become the postgres user. Start the primary database shell, psql, where you can do all your creation of databases/tables, deletion, set permissions, and run raw SQL commands. Use the -d option to connect to the database you created (without specifying a database, psql will try to access a database that matches your username).
```bash
[postgres]$ psql -d my_database_name
```

### Some helpful commands:

Which user and database in use:
```psql
=# \conninfo
```

Get help:
```psql
=# \help
```

Connect to a particular database:
```psql
=# \c <database>
```

List all users and their permission levels:
```psql
=# \du
```

Show summary information about all tables in the current database:
```psql
=# \dt
```

Exit/quit the psql shell:
```psql
=# \q or CTRL+d
```

There are of course many more meta-commands, but these should help you get started. To see all meta-commands run:
```psql
=# \?
```

Expanded display on (format by line):
```psql
=# \x on
```