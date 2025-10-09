module Main where

import System.FilePath.Glob (glob)
import Test.DocTest (doctest)

main :: IO ()
main = do
  sources <- glob "src/**/*.hs"
  doctest $
    [ "-isrc"
    , "-XTemplateHaskell"
    , "-XCPP"
    , "-package=JuicyPixels"
    , "-package=bytestring"
    , "-package=containers"
    , "-package=vector"
    , "-package=filepath"
    ] ++ sources
