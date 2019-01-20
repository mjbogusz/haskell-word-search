module HorizontalSearch where

import Data.List
import Data.Maybe

import Common

horizontalSearch :: [String] -> [String] -> [[Bool]] -> [[Bool]]
horizontalSearch [] _ flags = flags
horizontalSearch (word:words) map flags =
  mergeFlags (horizontalSearchWord word map) (horizontalSearch words map flags)

horizontalSearchWord :: String -> [String] -> [[Bool]]
horizontalSearchWord _ [] = []
horizontalSearchWord word (mapline:map) =
  (lineSearchWord word mapline) : (horizontalSearchWord word map)

lineSearchWord :: String -> String -> [Bool]
lineSearchWord word line =
  if (findSubstring word line) == Nothing
  then boolList [] (length line) False
  else bf ++ mf ++ af
    where
      i = fromJust (findSubstring word line)
      bf = boolList [] i False
      mf = boolList [] (length word) True
      af = boolList [] ((length line) - (length word) - i) False

boolList :: [Bool] -> Int -> Bool -> [Bool]
boolList [] 0 _ = []
boolList xs 0 _ = xs
boolList xs i b =
  xs ++ [b] ++ (boolList xs (i-1) b)

findSubstring :: Eq a => [a] -> [a] -> Maybe Int
findSubstring pat str = findIndex (isPrefixOf pat) (tails str)
