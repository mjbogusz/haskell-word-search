{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Puzzle where

import GHC.Generics

data Puzzle =
    Puzzle {
        sizeX :: Int,
        sizeY :: Int,
        words :: Int,
        map :: [String],
        wordsList :: [String],
        solution :: String
} deriving (Show, Generic)
