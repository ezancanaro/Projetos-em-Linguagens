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
eval (App (Abs x tipo t12) t2) = if(isVal (removeBrk t12))  then subs x (removeBrk t2) (removeBrk t12) --
                            else subs x (eval(removeBrk t2)) (removeBrk t12)
eval (App t1 t2) = if(isVal t1) then let t2' = eval (removeBrk t2) in (App t1 (Brk t2'))
                else let t1' = eval t1 in (App t1' t2)
eval (LamIf guard t1 t2) =  if(eval guard == Factor (LamTrue)) 
                              then eval t1
                            else eval t2
eval (LamCase (Inl v0 ty1) (Inl (Factor (Var x1)) ty2) t1 _ _) = subs x1 v0 t1 
eval (LamCase (Inr v0 ty1) _ _ (Inr (Factor (Var x2)) ty2) t2) = subs x2 v0 t2
eval (LamCase t0 (Inl x1 ty1) t1 (Inr x2 ty2) t2) = LamCase (eval t0) (Inl x1 ty1) t1 (Inr x2 ty2) t2
eval (LamCase (Factor (Brk exp)) t1 t2 t3 t4) = LamCase exp t1 t2 t3 t4 -- Tirar a guarda do case dos parenteses
eval (Inl t1 ty1) = Inl (eval t1) ty1
eval (Inr t2 ty1) = Inr (eval t2) ty1



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
subsFactor x t1 (Var y) = if(x == y)    then t1
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
typeof con (Inl t1 ty1) = if( (typeof con t1) == ( sumTypeT1 ty1) ) then ty1
                          else error "Type WRONG"
typeof con (Inr t2 ty2) = if( (typeof con t2) == ( sumTypeT2 ty2) ) then ty2
                            else error "Type WRONG"
typeof con (LamCase t0 (Inl (Factor (Var x)) _ ) t1 (Inr (Factor (Var y)) _ ) t2) = 
                                                    let ty1 = sumTypeT1(typeof con t0)
                                                        ty2 = sumTypeT2(typeof con t0) 
                                                        conNew = (x,ty1) : con
                                                        conNew2 = (y,ty2) : con
                                                        tyt1 = typeof conNew t1
                                                        tyt2 = typeof conNew2 t2
                                                    in  if(tyt1 == tyt2)
                                                          then tyt1
                                                        else error "Cases don't have matching types"


typeofFactor :: TyContext -> Factor -> T
typeofFactor con LamTrue = Boole
typeofFactor con LamFalse = Boole
typeofFactor  con (Var x) = case (lookup x con) of
                                  Just e  -> e
                                  Nothing -> error ("Type Error : Var not in the context environment : " ++ [x])
typeofFactor con (Brk exp) = typeof con exp 

sumTypeT1 :: T -> T
sumTypeT1 (SumType t1 _) = t1
sumTypeT1 _ = error "Not a SumType"

sumTypeT2 :: T -> T
sumTypeT2 (SumType _ t2) = t2
sumTypeT2 _ = error "Not a SumType"

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