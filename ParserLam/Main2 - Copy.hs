module Main where

import ParserLam2
import LamExp2

--main = getContents >>= print.calc.lexer
--main = getContents >>= print.interpret.typeCheck.calc.lexer
main = do 
		putStr "Input Expression =   "
		readFile "input.txt" >>= print.calc.lexer

		putStrLn " -- "

		putStr "Inferred Type =   "
		getContents >>= print.typeof [('f',FuncType Boole Boole)] .calc.lexer

		putStrLn " -- "

		putStr "Evaluated Expression =   "
		readFile "input.txt" >>= print.interpret.calc.lexer