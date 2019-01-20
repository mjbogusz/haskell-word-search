import System.Environment
import Data.List
-- import System.FilePath

import Input
import Puzzle
import Common
import HorizontalSearch
import LetersLeft

main :: IO ()
main = do
  args <- getArgs;
  p <- readInputFile (head args);
  let flags = prepareFlags (sizeX p) (sizeY p);
  let newFlags = horizontalSearch (wordList p) (mapData p) flags;
--  print newFlags;
  let newFlags2 = rotateRight (horizontalSearch (wordList p) (rotateLeft (mapData p)) (rotateLeft flags));
--  print newFlags2;
  let newFlags4 = diagonals (horizontalSearch (wordList p) (diagonals2 (mapData p)) (diagonals2 flags));
  print newFlags4;
  let newFlags3 = mor newFlags newFlags2;
  print newFlags3;
  let letersleft = letersLeft (mapData p) newFlags3;
  print letersleft;
