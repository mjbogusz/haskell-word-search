module LettersLeft where

import Data.List

lettersLeft :: [String] -> [[Bool]] -> [Char]
lettersLeft [] _ = []
lettersLeft (mapline:map) (flagsline:flags) =
  (lettersLeftLine mapline flagsline) ++ (lettersLeft map flags)

lettersLeftLine :: String -> [Bool] -> [Char]
lettersLeftLine [] _ = "";
lettersLeftLine (letter:mapline) (flag:flagsline) =
  if flag
    then "" ++ (lettersLeftLine mapline flagsline)
    else [letter] ++ (lettersLeftLine mapline flagsline)
