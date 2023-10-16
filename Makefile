migrateup:
	 migrate -path db/migration -database "postgresql://postgres:hayatdb12@localhost:5432/simple_bank" -verbose up
migratedown:
	 migrate -path db/migration -database "postgresql://postgres:hayatdb12@localhost:5432/simple_bank" -verbose down

migratedown1:
	 migrate -path db/migration -database "postgresql://postgres:hayatdb12@localhost:5432/simple_bank" -verbose down 1

migrateup1:
	 migrate -path db/migration -database "postgresql://postgres:hayatdb12@localhost:5432/simple_bank" -verbose up 1

sqlc:
	sqlc generate -f sqlc.yamal

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	 mockgen -package mockdb -destination db/mock/store.go bank/db/sqlc Store

.PHONY: migratedown migrateup sqlc test server mock



