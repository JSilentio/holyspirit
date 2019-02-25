{-# LANGUAGE TemplateHaskell #-}

module Vocab(randomWord) where

import System.Random
import Data.Vector as V
import Data.Text as T
import Data.FileEmbed
import Control.Monad

vocabFile :: T.Text
vocabFile = $(embedStringFile "data/vocab.txt")
    
vocab = V.fromList $ T.words vocabFile

randomWord = (vocab V.!) <$> randomRIO (1, V.length vocab)