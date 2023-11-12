package token

import "time"

// make an interface for managing tokens

type Maker interface {
	CreateToken(username string, duration time.Duration) (string, *Payload, error)

	VerifyToken(token string) (*Payload, error)
}
