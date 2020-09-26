Select
======

Postgres version:
```postgres
mydb=> SELECT version();
```

Current date:
```postgres
mydb=> SELECT current_date;
```

Sum:
```postgres
mydb=> SELECT 2 + 2;
```

Describe (schema):
```postgres
mydb=> SELECT column_name, data_type, column_default FROM information_schema.columns WHERE TABLE_NAME = 'products';
