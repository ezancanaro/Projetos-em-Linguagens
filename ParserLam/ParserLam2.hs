{-# OPTIONS_GHC -w #-}
module ParserLam2 where
import Data.Char
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.5

data HappyAbsSyn t4 t5 t6
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6

action_0 (7) = happyShift action_5
action_0 (8) = happyShift action_2
action_0 (10) = happyShift action_6
action_0 (15) = happyShift action_7
action_0 (16) = happyShift action_8
action_0 (17) = happyShift action_9
action_0 (20) = happyShift action_10
action_0 (21) = happyShift action_11
action_0 (26) = happyShift action_12
action_0 (4) = happyGoto action_3
action_0 (5) = happyGoto action_4
action_0 _ = happyFail

action_1 (8) = happyShift action_2
action_1 _ = happyFail

action_2 (7) = happyShift action_19
action_2 _ = happyFail

action_3 (7) = happyShift action_5
action_3 (10) = happyShift action_6
action_3 (15) = happyShift action_7
action_3 (16) = happyShift action_8
action_3 (30) = happyAccept
action_3 (5) = happyGoto action_18
action_3 _ = happyFail

action_4 _ = happyReduce_3

action_5 _ = happyReduce_8

action_6 (7) = happyShift action_5
action_6 (8) = happyShift action_2
action_6 (10) = happyShift action_6
action_6 (15) = happyShift action_7
action_6 (16) = happyShift action_8
action_6 (17) = happyShift action_9
action_6 (20) = happyShift action_10
action_6 (21) = happyShift action_11
action_6 (26) = happyShift action_12
action_6 (4) = happyGoto action_17
action_6 (5) = happyGoto action_4
action_6 _ = happyFail

action_7 _ = happyReduce_10

action_8 _ = happyReduce_11

action_9 (7) = happyShift action_5
action_9 (8) = happyShift action_2
action_9 (10) = happyShift action_6
action_9 (15) = happyShift action_7
action_9 (16) = happyShift action_8
action_9 (17) = happyShift action_9
action_9 (20) = happyShift action_10
action_9 (21) = happyShift action_11
action_9 (26) = happyShift action_12
action_9 (4) = happyGoto action_16
action_9 (5) = happyGoto action_4
action_9 _ = happyFail

action_10 (7) = happyShift action_5
action_10 (8) = happyShift action_2
action_10 (10) = happyShift action_6
action_10 (15) = happyShift action_7
action_10 (16) = happyShift action_8
action_10 (17) = happyShift action_9
action_10 (20) = happyShift action_10
action_10 (21) = happyShift action_11
action_10 (26) = happyShift action_12
action_10 (4) = happyGoto action_15
action_10 (5) = happyGoto action_4
action_10 _ = happyFail

action_11 (7) = happyShift action_5
action_11 (8) = happyShift action_2
action_11 (10) = happyShift action_6
action_11 (15) = happyShift action_7
action_11 (16) = happyShift action_8
action_11 (17) = happyShift action_9
action_11 (20) = happyShift action_10
action_11 (21) = happyShift action_11
action_11 (26) = happyShift action_12
action_11 (4) = happyGoto action_14
action_11 (5) = happyGoto action_4
action_11 _ = happyFail

action_12 (7) = happyShift action_5
action_12 (8) = happyShift action_2
action_12 (10) = happyShift action_6
action_12 (15) = happyShift action_7
action_12 (16) = happyShift action_8
action_12 (17) = happyShift action_9
action_12 (20) = happyShift action_10
action_12 (21) = happyShift action_11
action_12 (26) = happyShift action_12
action_12 (4) = happyGoto action_13
action_12 (5) = happyGoto action_4
action_12 _ = happyFail

action_13 (7) = happyShift action_5
action_13 (10) = happyShift action_6
action_13 (15) = happyShift action_7
action_13 (16) = happyShift action_8
action_13 (27) = happyShift action_25
action_13 (5) = happyGoto action_18
action_13 _ = happyFail

action_14 (7) = happyShift action_5
action_14 (10) = happyShift action_6
action_14 (15) = happyShift action_7
action_14 (16) = happyShift action_8
action_14 (23) = happyShift action_24
action_14 (5) = happyGoto action_18
action_14 _ = happyFail

action_15 (7) = happyShift action_5
action_15 (10) = happyShift action_6
action_15 (15) = happyShift action_7
action_15 (16) = happyShift action_8
action_15 (23) = happyShift action_23
action_15 (5) = happyGoto action_18
action_15 _ = happyFail

action_16 (7) = happyShift action_5
action_16 (10) = happyShift action_6
action_16 (15) = happyShift action_7
action_16 (16) = happyShift action_8
action_16 (18) = happyShift action_22
action_16 (5) = happyGoto action_18
action_16 _ = happyFail

action_17 (7) = happyShift action_5
action_17 (10) = happyShift action_6
action_17 (11) = happyShift action_21
action_17 (15) = happyShift action_7
action_17 (16) = happyShift action_8
action_17 (5) = happyGoto action_18
action_17 _ = happyFail

action_18 _ = happyReduce_2

action_19 (12) = happyShift action_20
action_19 _ = happyFail

action_20 (14) = happyShift action_28
action_20 (24) = happyShift action_29
action_20 (25) = happyShift action_30
action_20 (6) = happyGoto action_33
action_20 _ = happyFail

action_21 _ = happyReduce_9

action_22 (7) = happyShift action_5
action_22 (8) = happyShift action_2
action_22 (10) = happyShift action_6
action_22 (15) = happyShift action_7
action_22 (16) = happyShift action_8
action_22 (17) = happyShift action_9
action_22 (20) = happyShift action_10
action_22 (21) = happyShift action_11
action_22 (26) = happyShift action_12
action_22 (4) = happyGoto action_32
action_22 (5) = happyGoto action_4
action_22 _ = happyFail

action_23 (14) = happyShift action_28
action_23 (24) = happyShift action_29
action_23 (25) = happyShift action_30
action_23 (6) = happyGoto action_31
action_23 _ = happyFail

action_24 (14) = happyShift action_28
action_24 (24) = happyShift action_29
action_24 (25) = happyShift action_30
action_24 (6) = happyGoto action_27
action_24 _ = happyFail

action_25 (20) = happyShift action_26
action_25 _ = happyFail

action_26 (7) = happyShift action_5
action_26 (8) = happyShift action_2
action_26 (10) = happyShift action_6
action_26 (15) = happyShift action_7
action_26 (16) = happyShift action_8
action_26 (17) = happyShift action_9
action_26 (20) = happyShift action_10
action_26 (21) = happyShift action_11
action_26 (26) = happyShift action_12
action_26 (4) = happyGoto action_38
action_26 (5) = happyGoto action_4
action_26 _ = happyFail

action_27 (13) = happyShift action_35
action_27 (22) = happyShift action_36
action_27 _ = happyReduce_6

action_28 _ = happyReduce_13

action_29 _ = happyReduce_15

action_30 _ = happyReduce_16

action_31 (13) = happyShift action_35
action_31 (22) = happyShift action_36
action_31 _ = happyReduce_5

action_32 (7) = happyShift action_5
action_32 (10) = happyShift action_6
action_32 (15) = happyShift action_7
action_32 (16) = happyShift action_8
action_32 (19) = happyShift action_37
action_32 (5) = happyGoto action_18
action_32 _ = happyFail

action_33 (9) = happyShift action_34
action_33 (13) = happyShift action_35
action_33 (22) = happyShift action_36
action_33 _ = happyFail

action_34 (7) = happyShift action_5
action_34 (10) = happyShift action_6
action_34 (15) = happyShift action_7
action_34 (16) = happyShift action_8
action_34 (5) = happyGoto action_43
action_34 _ = happyFail

action_35 (14) = happyShift action_28
action_35 (24) = happyShift action_29
action_35 (25) = happyShift action_30
action_35 (6) = happyGoto action_42
action_35 _ = happyFail

action_36 (14) = happyShift action_28
action_36 (24) = happyShift action_29
action_36 (25) = happyShift action_30
action_36 (6) = happyGoto action_41
action_36 _ = happyFail

action_37 (7) = happyShift action_5
action_37 (8) = happyShift action_2
action_37 (10) = happyShift action_6
action_37 (15) = happyShift action_7
action_37 (16) = happyShift action_8
action_37 (17) = happyShift action_9
action_37 (20) = happyShift action_10
action_37 (21) = happyShift action_11
action_37 (26) = happyShift action_12
action_37 (4) = happyGoto action_40
action_37 (5) = happyGoto action_4
action_37 _ = happyFail

action_38 (7) = happyShift action_5
action_38 (10) = happyShift action_6
action_38 (15) = happyShift action_7
action_38 (16) = happyShift action_8
action_38 (29) = happyShift action_39
action_38 (5) = happyGoto action_18
action_38 _ = happyFail

action_39 (7) = happyShift action_5
action_39 (8) = happyShift action_2
action_39 (10) = happyShift action_6
action_39 (15) = happyShift action_7
action_39 (16) = happyShift action_8
action_39 (17) = happyShift action_9
action_39 (20) = happyShift action_10
action_39 (21) = happyShift action_11
action_39 (26) = happyShift action_12
action_39 (4) = happyGoto action_44
action_39 (5) = happyGoto action_4
action_39 _ = happyFail

action_40 (7) = happyShift action_5
action_40 (10) = happyShift action_6
action_40 (15) = happyShift action_7
action_40 (16) = happyShift action_8
action_40 (5) = happyGoto action_18
action_40 _ = happyReduce_4

action_41 (13) = happyShift action_35
action_41 (22) = happyShift action_36
action_41 _ = happyReduce_14

action_42 (13) = happyShift action_35
action_42 (22) = happyShift action_36
action_42 _ = happyReduce_12

action_43 _ = happyReduce_1

action_44 (7) = happyShift action_5
action_44 (10) = happyShift action_6
action_44 (15) = happyShift action_7
action_44 (16) = happyShift action_8
action_44 (28) = happyShift action_45
action_44 (5) = happyGoto action_18
action_44 _ = happyFail

action_45 (21) = happyShift action_46
action_45 _ = happyFail

action_46 (7) = happyShift action_5
action_46 (8) = happyShift action_2
action_46 (10) = happyShift action_6
action_46 (15) = happyShift action_7
action_46 (16) = happyShift action_8
action_46 (17) = happyShift action_9
action_46 (20) = happyShift action_10
action_46 (21) = happyShift action_11
action_46 (26) = happyShift action_12
action_46 (4) = happyGoto action_47
action_46 (5) = happyGoto action_4
action_46 _ = happyFail

action_47 (7) = happyShift action_5
action_47 (10) = happyShift action_6
action_47 (15) = happyShift action_7
action_47 (16) = happyShift action_8
action_47 (29) = happyShift action_48
action_47 (5) = happyGoto action_18
action_47 _ = happyFail

action_48 (7) = happyShift action_5
action_48 (8) = happyShift action_2
action_48 (10) = happyShift action_6
action_48 (15) = happyShift action_7
action_48 (16) = happyShift action_8
action_48 (17) = happyShift action_9
action_48 (20) = happyShift action_10
action_48 (21) = happyShift action_11
action_48 (26) = happyShift action_12
action_48 (4) = happyGoto action_49
action_48 (5) = happyGoto action_4
action_48 _ = happyFail

action_49 (7) = happyShift action_5
action_49 (10) = happyShift action_6
action_49 (15) = happyShift action_7
action_49 (16) = happyShift action_8
action_49 (5) = happyGoto action_18
action_49 _ = happyReduce_7

happyReduce_1 = happyReduce 6 4 happyReduction_1
happyReduction_1 ((HappyAbsSyn5  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Abs happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn4
		 (App happy_var_1 happy_var_2
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  4 happyReduction_3
happyReduction_3 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Factor happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happyReduce 6 4 happyReduction_4
happyReduction_4 ((HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (LamIf happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 4 4 happyReduction_5
happyReduction_5 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Inl happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 4 4 happyReduction_6
happyReduction_6 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Inr happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 12 4 happyReduction_7
happyReduction_7 ((HappyAbsSyn4  happy_var_12) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (LamCase happy_var_2 (Inl happy_var_5 None) happy_var_7 (Inr happy_var_10 None) happy_var_12
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_1  5 happyReduction_8
happyReduction_8 (HappyTerminal (TokenVar happy_var_1))
	 =  HappyAbsSyn5
		 (Var happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  5 happyReduction_9
happyReduction_9 _
	(HappyAbsSyn4  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (Brk happy_var_2
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  5 happyReduction_10
happyReduction_10 _
	 =  HappyAbsSyn5
		 (LamTrue
	)

happyReduce_11 = happySpecReduce_1  5 happyReduction_11
happyReduction_11 _
	 =  HappyAbsSyn5
		 (LamFalse
	)

happyReduce_12 = happySpecReduce_3  6 happyReduction_12
happyReduction_12 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (FuncType happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  6 happyReduction_13
happyReduction_13 _
	 =  HappyAbsSyn6
		 (Boole
	)

happyReduce_14 = happySpecReduce_3  6 happyReduction_14
happyReduction_14 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (SumType happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  6 happyReduction_15
happyReduction_15 _
	 =  HappyAbsSyn6
		 (None
	)

happyReduce_16 = happySpecReduce_1  6 happyReduction_16
happyReduction_16 _
	 =  HappyAbsSyn6
		 (Nat
	)

happyNewToken action sts stk [] =
	action 30 30 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenVar happy_dollar_dollar -> cont 7;
	TokenLam -> cont 8;
	TokenDot -> cont 9;
	TokenOB -> cont 10;
	TokenCB -> cont 11;
	TokenColon -> cont 12;
	TokenArrow -> cont 13;
	TokenBoole -> cont 14;
	TokenTrue -> cont 15;
	TokenFalse -> cont 16;
	TokenIf -> cont 17;
	TokenThen -> cont 18;
	TokenElse -> cont 19;
	TokenInl -> cont 20;
	TokenInr -> cont 21;
	TokenPlus -> cont 22;
	TokenAs -> cont 23;
	TokenNone -> cont 24;
	TokenNat -> cont 25;
	TokenCase -> cont 26;
	TokenOf -> cont 27;
	TokenPipe -> cont 28;
	TokenDashArrow -> cont 29;
	_ -> happyError' (tk:tks)
	}

happyError_ 30 tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = return
    (<*>) = ap
instance Monad HappyIdentity where
    return = HappyIdentity
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => [(Token)] -> HappyIdentity a
happyError' = HappyIdentity . parseError

calc tks = happyRunIdentity happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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
{-# LINE 1 "templates\GenericTemplate.hs" #-}
{-# LINE 1 "templates\\GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 9 "<command-line>" #-}
{-# LINE 1 "G:\\GitHub\\haskell-platform\\build\\ghc-bindist\\local\\lib/include\\ghcversion.h" #-}

















{-# LINE 9 "<command-line>" #-}
{-# LINE 1 "templates\\GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 13 "templates\\GenericTemplate.hs" #-}

{-# LINE 46 "templates\\GenericTemplate.hs" #-}








{-# LINE 67 "templates\\GenericTemplate.hs" #-}

{-# LINE 77 "templates\\GenericTemplate.hs" #-}

{-# LINE 86 "templates\\GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 155 "templates\\GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 256 "templates\\GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 322 "templates\\GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
