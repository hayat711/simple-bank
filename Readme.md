
- Create simple_bank database:
    ```bash
      make createdb
    ```


- Read db migration up all version:
    ```bash
      make migrateup
    ```

- Read db migration up 1 version:
    ```bash
      make migrateup1
    ```

- Run db migration down all versions:
    ```bash
      make migratedown
    ```
  ...

### How to generate code 
- generate SQL CRUD with sqlc:
    ```bash
      make sqlc
    ```

- Generate DB mock with gomock:
    ```bash
      make mock
    ```

- Generate a new db migration:
    ```bash
      migrate create -ext sql -dir db/migration -seq <migration_name>
    ```
  
  
  
