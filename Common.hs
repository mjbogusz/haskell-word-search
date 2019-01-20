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

mand :: [[Bool]] -> [[Bool]] -> [[Bool]]
mand x y = zipWith (zipWith (&&)) x y

mor :: [[Bool]] -> [[Bool]] -> [[Bool]]
mor x y = zipWith (zipWith (||)) x y

printFlags :: [[Bool]] -> IO ()
printFlags [] = do
  return ()
printFlags (t:ts) = do
  print (map flags2char t)
  printFlags ts
  return ()

flags2char :: Bool -> Char
flags2char t =
  if t
  then 'X'
  else ' '
