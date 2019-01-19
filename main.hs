import System.Environment

import Input
import System.FilePath

main :: IO ()
main = do
    args <- getArgs;
    p <- readInputFile (head args);
    print p;
