# How to run

The pagesigner requires the notary server to be running

## Notary server

```
make init-notary
make build-notary
make run-notary # Should start the notary server
```

In another terminal tab/window

## Pagesigner

```
make init-page-signer
make test-page-signer
make test-verify path=<path to saved session>
```

```
make test-verify path=/Users/boltzmann/Rubicon/backup-tls-notary/pagesigner-cli/saved_sessions/www.google.com-JtY1Jc
cd pagesigner-cli && ./test-verify.sh /Users/boltzmann/Rubicon/backup-tls-notary/pagesigner-cli/saved_sessions/www.google.com-JtY1Jc/proof.pgsg
undefined
*.google.com www.google.com
The imported session was verified and saved in  /Users/boltzmann/Rubicon/backup-tls-notary/pagesigner-cli/saved_sessions/www.google.com-Ct5au9_imported
```
