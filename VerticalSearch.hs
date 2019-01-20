module VerticalSearch where

import Data.List
import HorizontalSearch

verticalSearch :: [String] -> [String] -> [[Bool]] -> [[Bool]]
verticalSearch words map flags =
  rotateRight (horizontalSearch words (rotateLeft map) (rotateLeft flags));

rotateLeft :: [[a]] -> [[a]]
rotateLeft = reverse . transpose

rotateRight :: [[a]] -> [[a]]
rotateRight = transpose . reverse
