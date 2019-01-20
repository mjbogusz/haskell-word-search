# Haskell word search


## Dependencies

### Aeson
Debian/Ubuntu:
* `sudo apt install libghc-aeson-dev`

Manual:
* `cabal update`
* `cabal install aeson`

## Build
`ghc --make main.hs`

## Running
`./main <input json file>`

e.g.
`./main tests/puzzle1.json`
