{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Input (
    readInputFile,
) where

import Data.Aeson
import qualified Data.ByteString.Lazy as B
import GHC.Generics

import Puzzle
instance FromJSON Puzzle
instance ToJSON Puzzle

getJSON :: FilePath -> IO B.ByteString
getJSON f = B.readFile f

readInputFile :: FilePath -> IO Puzzle
readInputFile x =
    do {
        d <- (eitherDecode <$> (getJSON x)) :: IO (Either String Puzzle);
        case d of
            Left err -> error err
            Right ps -> return ps
    }
