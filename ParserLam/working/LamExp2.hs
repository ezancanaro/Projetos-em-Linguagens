module LamExp2 where
	
import ParserLam2
import Data.List
import Control.Exception
--
--data LamExp        = Abs Char T Factor                -- abstracao
--                | App LamExp Factor                -- aplicacao
--                | Factor Factor
--                | LamIf LamExp LamExp LamExp       -- condicional IF
--                deriving (Show, Eq)

--data Factor        = Var Char                -- variaveis
--                | Brk LamExp                -- parenteses
--                | LamTrue 
--                | LamFalse
--                deriving (Show, Eq) 

--data T         = Boole
--                | FuncType T T
--                deriving (Show,Eq,Read)
         

--type TyContext      = [(Char,T)]


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
eval (Abs x tipo t12) = Abs x tipo t12
eval (App (Factor(Brk(t1))) t2) = eval (App t1 t2)
eval (App (Abs x tipo t12) t2) = if(isVal (removeBrk t12))	then subs x (removeBrk t2) (removeBrk t12) --ARRUMAR ISSO AQUI
														else subs x (eval(removeBrk t2)) (removeBrk t12)
eval (App t1 t2) = if(isVal t1) then let t2' = eval (removeBrk t2) in (App t1 (Brk t2'))
								else let t1' = eval t1 in (App t1' t2)
eval (LamIf guard t1 t2) =  if(eval guard == Factor (LamTrue)) 
                              then eval t1
                            else eval t2

evalFactor :: Factor -> LamExp
evalFactor (Var x) = Factor (Var x)
evalFactor (Brk t1) = eval t1
evalFactor LamTrue = Factor (LamTrue)
evalFactor LamFalse = Factor (LamFalse)

isVal :: LamExp -> Bool
isVal (Factor f) = isValFactor f
isVal (Abs x tipo t1) = True
isVal _ = False

isValFactor :: Factor -> Bool
isValFactor (Var x) = True
isValFactor (Brk t) = isVal t
isValFactor (LamTrue) = True
isValFactor (LamFalse) = True


subs :: Char -> LamExp -> LamExp -> LamExp
subs x t1 (Factor f) = subsFactor x t1 f
subs x t1 (Abs s tipo t2) = subs x t1 (removeBrk t2)  --ARRUMAR ISSO AQUI
subs x t1 (App t2 t3) = App (subs x t1 t2) (Brk(subs x t1 (removeBrk t3)))

subsFactor :: Char -> LamExp -> Factor -> LamExp
subsFactor x t1 (Var y) = if(x == y)  	then t1
										else Factor (Var y)
subsFactor x t1 (Brk t2) = subs x t1 t2

 -- Remove uma expressão de dentro dos parênteses
removeBrk :: Factor -> LamExp
removeBrk (Brk (t)) = t
removeBrk t = Factor(t)


extend :: TyContext -> (Char, T) -> TyContext
extend con xt = xt : con

typeof :: TyContext -> LamExp -> T
typeof con (Factor f) = typeofFactor con f

typeof con (Abs x ty t2) =  let conNew = (x,ty) : con
                                tyt2 = typeof conNew (removeBrk t2)
                              in FuncType ty tyt2

typeof con (App t1 t2) =    let tyt1 = typeof con t1
                                tyt2 = typeofFactor con t2
                            in  if ( (funcTypeT1 tyt1)  == tyt2)
                                  then funcTypeT2 tyt1
                                else error "Type Error : t2 type differs from t1 parameters"

typeof con (LamIf t1 t2 t3) = if (typeof con t1) == Boole
                                then  let tyt2 = typeof con t2
                                          tyt3 = typeof con t3
                                        in  if(tyt2 == tyt3)
                                              then tyt2
                                            else error "Type Error : t2 and t3 of different types"
                              else error "Type Error : If guard isn't boolean"

typeofFactor :: TyContext -> Factor -> T
typeofFactor con LamTrue = Boole
typeofFactor con LamFalse = Boole
typeofFactor  con (Var x) = case (lookup x con) of
                                  Just e  -> e
                                  Nothing -> error ("Type Error : Var not in the context environment : " ++ [x])
typeofFactor con (Brk exp) = typeof con exp 


funcTypeT1 :: T -> T
funcTypeT1 (FuncType t1 _) = t1

funcTypeT2 :: T -> T
funcTypeT2 (FuncType _ t2) = t2

 --Chama recursivamente eval até encontrar a expressão reduzida ao máximo.
interpret :: LamExp -> LamExp
interpret t = let t' = eval t 
               in if (t == (t'))
                  then t
                  else interpret (t')