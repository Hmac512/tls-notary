.PHONY: help
help:
	@echo "Setup signer"
	@echo ""
	@echo	"Usage:"
	@echo "make init-notary:                              --- initalizes and builds go notary server"
	@echo "make build-notary:                             --- builds go notary server"
	@echo "make run-notary:                               --- runs go notary server"
	@echo "make init-page-signer:                         --- install npm deps for pagesigner"
	@echo "make test-page-signer:                         --- runs page signer for google (requries notary server to be running)"
	@echo "make test-verify path=/path/to/session:        --- verifies a tls notary session"



.PHONY: init-notary
init-notary:
	rm -f server/src/go.mod
	cd server/src && \
	go mod init notary && \
	go get github.com/bwesterb/go-ristretto@b51b4774df9150ea7d7616f76e77f745a464bbe3 && \
	go get github.com/roasbeef/go-go-gadget-paillier@14f1f86b60008ece97b6233ed246373e555fc79f && \
	go get golang.org/x/crypto/blake2b && \
	go get golang.org/x/crypto/salsa20/salsa

.PHONY: build-notary
build-notary:
	cd server/src && go build -o notary

.PHONY: run-notary
run-notary:
	cd server/src && ./notary --no-sandbox


.PHONY: init-page-signer
init-page-signer:
	cd pagesigner-cli && npm ci

.PHONY: test-page-signer
test-page-signer:
	cd pagesigner-cli && ./test-notarize.sh

.PHONY: test-verify
test-verify:
	cd pagesigner-cli && ./test-verify.sh $(path)/proof.pgsg
