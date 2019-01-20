import System.Environment
import Data.List
-- import System.FilePath

import Input
import Puzzle
import Common
import HorizontalSearch

main :: IO ()
main = do
  args <- getArgs;
  p <- readInputFile (head args);
  let flags = prepareFlags (sizeX p) (sizeY p);
  let newFlags = horizontalSearch (wordList p) (mapData p) flags;
  print newFlags;
  let newFlags2 = rotateRight (horizontalSearch (wordList p) (rotateLeft (mapData p)) (rotateLeft flags));
  print newFlags2;
  let newFlags3 = mand newFlags newFlags2;
  print newFlags3;
