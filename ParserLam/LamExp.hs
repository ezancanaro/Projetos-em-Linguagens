module LamExp where
	
import ParserLam
import Data.List
--
--data LamExp =  Var Char
 --               | Abs Char Factor
  --              | App LamExp LamExp deriving(Show)
 -- data Factor        = Var Char                -- variaveis
   --             | Brk LamExp                -- parenteses
      --          | LamTrue
        --        | LamFalse
     --           deriving (Show, Eq)
                
--isFree :: Char -> LamExp -> Bool
--isFree x (Var y) = if(x==y) then True else False
--isFree x (Abs y e) = if(x==y) then False else isFree x e
--isFree x (App e1 e2) = (isFree x e1) || (isFree x e2)

--freeVars :: LamExp -> [Char]
--freeVars (Var x) = [x]
--freeVars (Abs x e) = delete x (freeVars e)
--freeVars (App e1 e2) = (freeVars e1) ++ (freeVars e2)

eval :: LamExp -> LamExp
eval (Factor x) = evalFactor x
eval (Abs x t12) = Abs x t12
eval (App (Factor(Brk(t1))) t2) = eval (App t1 t2)
eval (App (Abs x t12) t2) = if(isVal (removeBrk t12))	then subs x (removeBrk t2) (removeBrk t12) 
														else subs x (eval(removeBrk t2)) (removeBrk t12)
eval (App t1 t2) = if(isVal t1) then let t2' = eval (removeBrk t2) in (App t1 (Brk t2'))
								else let t1' = eval t1 in (App t1' t2)


evalFactor :: Factor -> LamExp
evalFactor (Var x) = Factor (Var x)
evalFactor (Brk t1) = eval t1

isVal :: LamExp -> Bool
isVal (Factor f) = isValFactor f
isVal (Abs x t1) = True
isVal _ = False

isValFactor :: Factor -> Bool
isValFactor (Var x) = True
isValFactor (Brk t) = isVal t

subs :: Char -> LamExp -> LamExp -> LamExp
subs x t1 (Factor f) = subsFactor x t1 f
subs x t1 (Abs s t2) = subs x t1 (removeBrk t2)
subs x t1 (App t2 t3) = App (subs x t1 t2) (Brk(subs x t1 (removeBrk t3)))

subsFactor :: Char -> LamExp -> Factor -> LamExp
subsFactor x t1 (Var y) = if(x == y)  	then t1
										else Factor (Var y)
subsFactor x t1 (Brk t2) = subs x t1 t2

 -- Remove uma expressão de dentro dos parênteses
removeBrk :: Factor -> LamExp
removeBrk (Brk (t)) = t
removeBrk t = Factor(t)

 --Chama recursivamente eval até encontrar a expressão reduzida ao máximo.
interpret :: LamExp -> LamExp
interpret t = let t' = eval t 
               in if (t == (t'))
                  then t
                  else interpret (t')