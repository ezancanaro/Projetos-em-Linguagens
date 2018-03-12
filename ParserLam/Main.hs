module Main where

import ParserLam
import LamExp

main = getContents >>= print.interpret.calc.lexer