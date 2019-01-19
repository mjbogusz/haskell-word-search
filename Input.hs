module Input (
    readInputFile,
) where

import Data.Aeson

readInputFile :: String -> [xs]
readInputFile "" = []
