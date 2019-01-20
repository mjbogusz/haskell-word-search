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

lettersLeftMap :: [String] -> [[Bool]] -> [String]
lettersLeftMap [] [] = []
lettersLeftMap (mapline:map) (flagsline:flags) =
  [lettersLeftMapLine mapline flagsline] ++ (lettersLeftMap map flags)

lettersLeftMapLine :: String -> [Bool] -> String
lettersLeftMapLine [] [] = [];
lettersLeftMapLine (letter:mapline) (flag:flagsline) =
  if flag == True
    then "X" ++ (lettersLeftMapLine mapline flagsline)
    else [letter] ++ (lettersLeftMapLine mapline flagsline)

printLetterMap :: [String] -> [[Bool]] -> IO ()
printLetterMap [] _ = do
  return ()
printLetterMap (t:ts) (b:bs) = do
  print (filterMapLine t b)
  printLetterMap ts bs
  return ()

filterMapLine :: String -> [Bool] -> String
filterMapLine [] _ = ""
filterMapLine (t:ts) (b:bs) =
  if b
    then " " ++ (filterMapLine ts bs)
    else [t] ++ (filterMapLine ts bs)
