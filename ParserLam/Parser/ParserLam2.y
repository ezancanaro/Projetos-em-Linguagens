
{
module ParserLam2 where
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
    ':'                 { TokenColon}
    '>'                { TokenArrow }
    boole               { TokenBoole }
    true                { TokenTrue }
    false              { TokenFalse }
    "if"                  {TokenIf }
    "then"                { TokenThen }
    "else"                {TokenElse }
    inl                 {TokenInl}
    inr                 {TokenInr}
    '+'                 {TokenPlus}
    as                {TokenAs}
    none                {TokenNone}
    nat                 {TokenNat}
    "case"              {TokenCase}
    "of"                {TokenOf}
    '|'                 {TokenPipe}
    '='                {TokenDashArrow}

%%

LamExp    : lam var ':' T '.' Factor               { Abs $2 $4 $6}
        | LamExp Factor                        { App $1 $2 }
        | Factor                                { Factor $1 }
        | "if" LamExp "then" LamExp "else" LamExp { LamIf $2 $4 $6 }
        | inl LamExp as T                           {Inl $2 $4}
        | inr LamExp as T                          {Inr $2 $4}
        | "case" LamExp "of" inl LamExp '=' LamExp '|' inr LamExp '=' LamExp  {LamCase $2 (Inl $5 None) $7 (Inr $10 None) $12}

Factor    : var                                { Var $1 }
        | '(' LamExp ')'                        { Brk $2 }
        | true                                  { LamTrue }
        | false                                 { LamFalse }


T        : T '>' T                             {FuncType $1 $3 }
        | boole                                 { Boole }
        | T '+' T                               {SumType $1 $3}
        | none                                  { None }
        | nat                                   { Nat}
{

parseError :: [Token] -> a
parseError _ = error "ERRO: Sequencia de caracteres invalida para analise."

-- Definição da sintaxe abstrata na linguagem: simple-typed lambda calculus
    
data LamExp        = Abs Char T Factor                -- abstracao
                | App LamExp Factor                -- aplicacao
                | Factor Factor
                | LamIf LamExp LamExp LamExp       -- condicional IF
                | Inl LamExp T
                | Inr LamExp T
                | LamCase LamExp LamExp LamExp LamExp LamExp
                deriving (Show, Eq)

data Factor        = Var Char                -- variaveis
                | Brk LamExp                -- parenteses
                | LamTrue 
                | LamFalse
                deriving (Show, Eq) 

data T         = Boole
                | None
                | FuncType T T
                | SumType T T
                | Nat
                deriving (Show,Eq,Read)

data Token        = TokenVar Char
                | TokenLam
                | TokenDot
                | TokenOB
                | TokenCB
                | TokenTrue
                | TokenFalse
                | TokenArrow 
                | TokenBoole
                | TokenColon
                | TokenIf 
                | TokenThen 
                | TokenElse
                | TokenInl
                | TokenInr
                | TokenPlus 
                | TokenCase
                | TokenOf   
                | TokenPipe
                | TokenDashArrow 
                | TokenAs
                | TokenNone
                | TokenNat
                deriving (Show)

type TyContext      = [(Char,T)]

lexer :: String -> [Token]
lexer [] = []
lexer (c:cs)        | isSpace c = lexer cs
                | isAlpha c = lexStr (c:cs)
lexer ('.':cs) = TokenDot : lexer cs
lexer ('(':cs) = TokenOB : lexer cs
lexer (')':cs) = TokenCB : lexer cs
lexer (':':cs) = TokenColon : lexer cs
lexer ('>':cs) = TokenArrow : lexer cs
lexer ('+':cs) = TokenPlus : lexer cs
lexer ('|':cs) = TokenPipe : lexer cs
lexer ('=':cs) = TokenDashArrow : lexer cs

lexStr cs = case span isAlpha cs of
                ("lam", rest)        -> TokenLam : lexer rest
                ("boole", rest)        ->  TokenBoole : lexer rest
                ("if", rest)        ->  TokenIf : lexer rest
                ("then", rest)        ->  TokenThen : lexer rest
                ("else", rest)        ->  TokenElse : lexer rest
                ("true", rest)      -> TokenTrue : lexer rest
                ("false", rest)     -> TokenFalse : lexer rest
                ("inl", rest)       -> TokenInl : lexer rest
                ("inr", rest)       -> TokenInr : lexer rest
                ("case", rest)      -> TokenCase : lexer rest
                ("of", rest)        -> TokenOf : lexer rest
                ("as",rest)         -> TokenAs : lexer rest
                ("none",rest)       -> TokenNone : lexer rest
                ("nat",rest)        -> TokenNat : lexer rest
                (var, rest)        -> lexVar var : lexer rest
                

lexVar (c:cs) = if cs == [] then 
                  TokenVar c
                else 
                  error "ERRO: Variavel definida com mais de um caracter." 


}

