Util
====

Run sql batch:
```postgres
mydb=> \i basics.sql

```
Descrive a table:
```postgres
mydv=> SELECT column_name, data_type, column_default FROM information_schema.columns WHERE TABLE_NAME = 'products';
```