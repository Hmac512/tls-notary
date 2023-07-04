# How to run

The pagesigner requires the notary server to be running

## Notary server

`make init-notary`
`make build-notary`
`make run-notary` - Should start the notary server

In another terminal tab/window

## Pagesigner

`make init-page-signer`
`make test-page-signer`
`make test-verify path=<path to saved session>`
