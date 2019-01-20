{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Puzzle where

import GHC.Generics

data Puzzle = Puzzle {
  sizeX :: Int,
  sizeY :: Int,
  wordsCount :: Int,
  mapData :: [String],
  wordList :: [String],
  solution :: String
} deriving (Show, Generic)
