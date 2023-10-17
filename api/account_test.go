package api

import (
	// mockdb "bank/db/mock"
	db "bank/db/sqlc"
	"bank/util"
	// "fmt"
	// "github.com/golang/mock/gomock"
	// "github.com/stretchr/testify/require"
	// "net/http"
	// "net/http/httptest"
	"testing"
)

func TestGetAccountAPI(t *testing.T) {
	// account := randomAccount()

	// ctrl := gomock.NewController(t)
	// defer ctrl.Finish()

	// store := mockdb.NewMockStore(ctrl)

	// // build stubs
	// store.EXPECT().
	// 	GetAccount(gomock.Any(), gomock.Eq(account.ID)).
	// 	Times(1).
	// 	Return(account, nil)

	// // start test server and send request
	// server := NewTestServer(t, store)
	// recorder := httptest.NewRecorder()

	// url := fmt.Sprintf("/accounts/%d", account.ID)
	// request, err := http.NewRequest(http.MethodGet, url, nil)
	// require.NoError(t, err)

	// server.router.ServeHTTP(recorder, request)
	// // check response
	// require.Equal(t, http.StatusOK, recorder.Code)

}

func randomAccount() db.Account {
	return db.Account{
		ID:       util.RandomInt(1, 1000),
		Owner:    util.RundomOwner(),
		Balance:  util.RandomMoney(),
		Currency: util.RandomCurrency(),
	}
}
