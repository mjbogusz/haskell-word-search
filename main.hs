import System.Environment
import Data.List
-- import System.FilePath

import Input
import Puzzle
import Common

import HorizontalSearch
import VerticalSearch
import DiagonalSearch
import LettersLeft

main :: IO ()
main = do
  args <- getArgs;
  p <- readInputFile (head args);
  let flags = prepareFlags (sizeX p) (sizeY p);

  -- horizontal search
  let newFlagsH = horizontalSearch (wordList p) (mapData p) flags;
  -- vertical search
  let newFlagsV = verticalSearch (wordList p) (mapData p) flags;
  -- diagonal search
  let newFlagsD1 = diagonalSearch (wordList p) (mapData p) (sizeX p) (sizeY p) flags;
  let newFlagsD2 = diagonalSearch2 (wordList p) (mapData p) (sizeX p) (sizeY p) flags;

  -- merge flags
  let finalFlags = mor (mor newFlagsD1 newFlagsD2) (mor newFlagsH newFlagsV);
  -- filter letters
  let lettersleft = lettersLeft (mapData p) finalFlags;

  -- output
  -- printFlags finalFlags;
  -- printLetterMap (mapData p) finalFlags;
  print lettersleft;
