module Common where

import Data.List

---

mergeFlags :: [[Bool]] -> [[Bool]] -> [[Bool]]
mergeFlags flags [] = flags
mergeFlags [] newFlags = newFlags
mergeFlags (f1:flags) (f2:newFlags) =
  (mergeFlagsRow f1 f2) : (mergeFlags flags newFlags)

mergeFlagsRow :: [Bool] -> [Bool] -> [Bool]
mergeFlagsRow flags [] = flags
mergeFlagsRow [] newFlags = newFlags
mergeFlagsRow (f1:flags) (f2:newFlags) =
  (f1 || f2) : (mergeFlagsRow flags newFlags)

---

prepareFlags :: Int -> Int -> [[Bool]]
prepareFlags x y = prepareFlagsColumn x y []

prepareFlagsColumn :: Int -> Int -> [[Bool]] -> [[Bool]]
prepareFlagsColumn x y ys = do {
  if (length ys) < y
    then prepareFlagsColumn x y (ys ++ [prepareFlagsRow x []])
    else ys
  }

prepareFlagsRow :: Int -> [Bool] -> [Bool]
prepareFlagsRow x xs =
  if (length xs) < x
    then prepareFlagsRow x (xs ++ [False])
    else xs

rotateLeft :: [[a]] -> [[a]]
rotateLeft = reverse . transpose

rotateRight :: [[a]] -> [[a]]
rotateRight = transpose . reverse

mand :: [[Bool]] -> [[Bool]] -> [[Bool]]
mand x y = zipWith (zipWith (&&)) x y

mor :: [[Bool]] -> [[Bool]] -> [[Bool]]
mor x y = zipWith (zipWith (||)) x y

diagonals :: [[a]] -> [[a]]
diagonals = tail . go [] where
    -- it is critical for some applications that we start producing answers
    -- before inspecting es_
    go b es_ = [h | h:_ <- b] : case es_ of
        []   -> transpose ts
        e:es -> go (e:ts) es
        where ts = [t | _:t <- b]

-- te diagonale w drugiej dolnej połowie powinny być poprzedzone miejscami pustymi, tak, zeby było wyrównnie do oryginalnej szerokości 
diagonals2 = map concat
          . transpose
          . zipWith (\ns xs -> ns ++ map (:[]) xs)
                    (iterate ([]:) [])
