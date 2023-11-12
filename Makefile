migrateup:
	# migrate -path db/migration -database "postgresql://root:hayatdb12@postgres:5432/simple_bank" -verbose up
	 migrate -path db/migration -database "postgresql://postgres:hayatdb12@localhost:5432/simple_bank" -verbose up

migratedown:
	# migrate -path db/migration -database "postgresql://root:hayatdb12@postgres:5432/simple_bank" -verbose down
	 migrate -path db/migration -database "postgresql://postgres:hayatdb12@localhost:5432/simple_bank" -verbose down

migratedown1:
	# migrate -path db/migration -database "postgresql://root:hayatdb12@postgres:5432/simple_bank" -verbose down 1
	 migrate -path db/migration -database "postgresql://postgres:hayatdb12@localhost:5432/simple_bank" -verbose down 1


migrateup1:
	# migrate -path db/migration -database "postgresql://root:hayatdb12@postgres:5432/simple_bank" -verbose up 1
	 migrate -path db/migration -database "postgresql://postgres:hayatdb12@localhost:5432/simple_bank" -verbose up 1


sqlc:
	sqlc generate -f sqlc.yamal

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	 mockgen -package mockdb -destination db/mock/store.go bank/db/sqlc Store

proto:
	rm -f pb/*.go
	rm -f doc/swagger/*.sagger.json
	protoc --proto_path=proto --go_out=pb --go_opt=paths=source_relative --go-grpc_out=pb --go-grpc_opt=paths=source_relative --grpc-gateway_out=pb --grpc-gateway_opt=paths=source_relative \
	--openapiv2_out=doc/swagger --openapiv2_opt=allow_merge=true,merge_file_name=simple_bank   proto/*.proto
	statik -src=./doc/swagger -dest=./doc

evans:
	evans -r repl
.PHONY: migratedown migrateup sqlc test server mock proto evans




