
{
module ParserLam where
import Data.Char
}

%name calc
%tokentype { Token }
%error { parseError }

%token
    var                { TokenVar $$ }
    lam                { TokenLam }
    '.'                { TokenDot }
    '('                { TokenOB }
    ')'                { TokenCB }
    LamTrue                { TokenTrue }
    LamFalse              { TokenFalse }

%%

LamExp    : lam var '.' Factor               { Abs $2 $4 }
        | LamExp Factor                        { App $1 $2 }
        | Factor                                { Factor $1 }

Factor        : var                                { Var $1 }
        | '(' LamExp ')'                        { Brk $2 }
        | LamTrue                                  { LamTrue }
        | LamFalse                                 { LamFalse }
{

parseError :: [Token] -> a
parseError _ = error "ERRO: Sequencia de caracteres invalida para analise."

-- Definição da sintaxe abstrata na linguagem: simple-typed lambda calculus

data LamExp        = Abs Char Factor                -- abstracao
                | App LamExp Factor                -- aplicacao
                | Factor Factor
                deriving (Show, Eq)

data Factor        = Var Char                -- variaveis
                | Brk LamExp                -- parenteses
                | LamTrue
                | LamFalse
                deriving (Show, Eq) 

data Token        = TokenVar Char
                | TokenLam
                | TokenDot
                | TokenOB
                | TokenCB
                | TokenTrue
                | TokenFalse
                deriving (Show)


lexer :: String -> [Token]
lexer [] = []
lexer (c:cs)        | isSpace c = lexer cs
                | isAlpha c = lexStr (c:cs)
lexer ('.':cs) = TokenDot : lexer cs
lexer ('(':cs) = TokenOB : lexer cs
lexer (')':cs) = TokenCB : lexer cs

lexStr cs = case span isAlpha cs of
                ("lam", rest)        -> TokenLam : lexer rest
                (var, rest)        -> lexVar var : lexer rest

lexVar (c:cs) = if cs == [] then 
                  TokenVar c
                else 
                  error "ERRO: Variavel definida com mais de um caracter." 


}

