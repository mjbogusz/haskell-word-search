module DiagonalSearch where

import HorizontalSearch

diagonalSearch :: [String] -> [String] -> Int -> Int -> [[Bool]] -> [[Bool]]
diagonalSearch words map mapSizeX mapSizeY flags =
  dmirror (unrotate45 (horizontalSearch words (rotate45 (dmirror map) mapSizeX mapSizeY) (rotate45 (dmirror flags) mapSizeX mapSizeY)) mapSizeX)

diagonalSearch2 :: [String] -> [String] -> Int -> Int -> [[Bool]] -> [[Bool]]
diagonalSearch2 words map mapSizeX mapSizeY flags =
  flip' (unrotate45 (horizontalSearch words (rotate45 (flip' map) mapSizeX mapSizeY) (rotate45 (flip' flags) mapSizeX mapSizeY)) mapSizeX)

rotate45 :: [[a]] -> Int -> Int -> [[a]]
rotate45 mat matSizeX matSizeY =
  addRows mat 0 (matSizeX + matSizeY - 1) matSizeX matSizeY []

addRows :: [[a]] -> Int -> Int -> Int -> Int -> [[a]] -> [[a]]
addRows [] _ _ _ _ newMat = newMat
addRows mat rowNumber maxRows matSizeX matSizeY newMat =
  if rowNumber >= maxRows
    then newMat
    else addRows mat (rowNumber + 1) maxRows matSizeX matSizeY (newMat ++ [addRow mat rowNumber 0 matSizeX matSizeY []])

addRow :: [[a]] -> Int -> Int -> Int -> Int -> [a] -> [a]
addRow [] _ _ _ _ newList = newList
addRow (matRow:mat) rowNumber elemNumber matSizeX matSizeY newList =
  if elemNumber >= matSizeY
    then newList
  else if elemNumber > rowNumber
    then newList
  else if (rowNumber - elemNumber) >= matSizeX
    then addRow mat rowNumber (elemNumber + 1) matSizeX matSizeY newList
    -- then newList
  else addRow mat rowNumber (elemNumber + 1) matSizeX matSizeY (newList ++ [matRow !! (rowNumber - elemNumber)])

unrotate45 :: [[a]] -> Int -> [[a]]
unrotate45 [] _ = []
unrotate45 t x =
  [unrotate45A t x 0] ++ unrotate45 (unrotate45B t x 0) x

--unrotate45A takes first x vertical elements from the map
unrotate45A :: [[a]]  -> Int -> Int -> [a]
unrotate45A [] _ _ = []
unrotate45A (t:ts) x i =
  if (i < x) && ((length t) > 0)
    then [head t] ++ (unrotate45A ts x (i + 1))
    else []

-- unrotate45B reduces the map by taking out first x vertical elements
unrotate45B :: [[a]] -> Int -> Int -> [[a]]
unrotate45B [] _ _ = []
unrotate45B (t:ts) x i =
  if i < x
    then if (length (tail t) > 0)
      then (tail t) : (unrotate45B ts x (i + 1))
      else unrotate45B ts x (i + 1)
    else t : (unrotate45B ts x (i + 1))

-- diagonal mirror
-- eg ["abcd", "efgh", "ijkl"] -> ["lkji","hgfe","dcba"]
dmirror :: [[a]] -> [[a]]
dmirror [] = []
dmirror t =
  reverse (flip' t)

flip' :: [[a]] -> [[a]]
flip' [] = []
flip' (row:rows) =
  [reverse row] ++ (flip' rows)
