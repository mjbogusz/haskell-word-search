module LetersLeft where

import Data.List

letersLeft :: [String] -> [[Bool]] -> [String]
letersLeft [] [] = []
letersLeft (mapline:map) (flagsline:flags) = [letersLeftLine mapline flagsline] ++ (letersLeft map flags)

letersLeftLine :: String -> [Bool] -> String
letersLeftLine [] [] = [];
letersLeftLine (leter:mapline) (flag:flagsline) = (if flag == True
                                                  then "X"
                                                  else [leter])
                                              ++ letersLeftLine mapline flagsline