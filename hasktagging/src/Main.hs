{-# LANGUAGE LambdaCase      #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
module Main where

import           Control.Exception   (bracket, finally)
import           Data.Bool           (bool)
import           Data.Maybe          (fromMaybe)
import qualified Data.Text           as T
import qualified Data.Text.IO        as T
import           Options.Applicative
import           System.Directory    (renameFile)
import           System.Exit         (ExitCode (..), exitWith)
import           System.IO           (hClose, openTempFile)
import           System.Process
import qualified Data.Map.Strict as Map



data Command
  = Command { file     :: Maybe FilePath
            , excludes :: Maybe [String]
            , options  :: Maybe String
            , append   :: Bool
            , filepath :: FilePath }
  deriving (Show)

parser :: Parser Command
parser = Command
  <$> optional (option str (long "file" <> short 'f'))
  <*> optional (some (option str (long "exclude")))
  <*> optional (option str (long "options"))
  <*> switch (long "append")
  <*> argument str mempty

data Process
  = Process { executable :: FilePath
            , arguments  :: [String]
            } deriving Show

toTags :: Maybe FilePath -> FilePath
toTags = fromMaybe "tags"


buildProcess :: Command -> Process
buildProcess Command{..} =
  Process { executable = "hasktags"
          , arguments = filter (not . null) ["-c", "-f", toTags file, shouldAppend, "-R", filepath] }
  where
    shouldAppend = bool "" "--append" append

cleanFile :: FilePath -> IO ()
cleanFile target = bracket open close go
  where
    open = openTempFile "." "tags"
    close (temp, handle) = renameFile temp target `finally` hClose handle
    go (_, handle) = do
      newContents <- T.unlines . clean . T.lines <$> T.readFile target
      T.hPutStr handle newContents
    clean = Map.elems . foldMap (\ln -> Map.singleton (take 2 (T.splitOn "\t" ln)) ln) . reverse


main :: IO ()
main = do
  args <- execParser cmdline
  let p@Process{..} = buildProcess args
  print p
  readProcessWithExitCode executable arguments "" >>= \case
    (f@(ExitFailure _), _, err) -> putStr err >> exitWith f
    (_, out, _) -> putStr out
  cleanFile (toTags (file args))
  where
    cmdline = info (helper <*> parser) mempty
