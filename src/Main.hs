{-# LANGUAGE OverloadedStrings #-}

module Main where

import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import Control.Monad
import System.IO
import System.IO.NoBufferingWorkaround

import Vocab

main = do
    initGetCharNoBuffering
    hSetBuffering stdout NoBuffering
    hSetEcho stdin False
    putStr "God Says: "
    forever $ getCharNoBuffering >> randomWord >>= \x -> TIO.putStr $ T.append x " "
