module Animais where

data Animal = Animal
    { idAnimal :: Int
    , especie :: String
    , sexo :: String
    , nomeAnimal :: String
    , porte :: String
    , idade :: Int
    , adotado :: Bool
    } deriving (Eq, Show)
    -- (Animal ID Espécie Sexo Nome Porte Idade Estado de adoção)

type ListaDeAnimais = [Animal]

listarAnimais :: ListaDeAnimais -> IO ()
listarAnimais [] = return ()
listarAnimais (x:xs) = do
    print x
    listarAnimais xs

animais :: ListaDeAnimais
animais =
        [ (Animal 1 "Cao" "Macho" "Jack" "Medio" 5 False)
        , (Animal 2 "Gato" "Macho" "Teco" "Medio" 13 True)
        , (Animal 3 "Cao" "Macho" "Max" "Grande" 2 False)
        , (Animal 4 "Tartaruga" "Macho" "Donatello" "Pequeno" 20 False)
        , (Animal 5 "Coelho" "Femea" "Pompom" "Pequeno" 1 True)
        , (Animal 6 "Gato" "Femea" "Miona" "Medio" 3 True)
        , (Animal 7 "Passaro" "Femea" "Pipoca" "Pequeno" 1 False)
        , (Animal 8 "Cao" "Femea" "Fifi" "Pequeno" 4 False)
        , (Animal 9 "Cao" "Femea" "Patuda" "Grande" 12 False)
        , (Animal 10 "Passaro" "Macho" "Blue" "Pequeno" 2 True)
        , (Animal 11 "Gato" "Femea" "Chanel" "Pequeno" 1 False)
        , (Animal 12 "Coelho" "Macho" "Toby" "Medio" 7 False)
        , (Animal 13 "Tartaruga" "Macho" "Leonardo" "Pequeno" 9 False)
        , (Animal 14 "Tartaruga" "Macho" "Michelangelo" "Pequeno" 8 False)
        , (Animal 15 "Gato" "Macho" "Tico" "Medio" 8 True)
        , (Animal 16 "Coelho" "Femea" "Lola" "Pequeno" 1 False)
        , (Animal 17 "Coelho" "Femea" "Lily" "Medio" 4 True)
        , (Animal 18 "Passaro" "Macho" "Zazu" "Pequeno" 2 True)
        , (Animal 19 "Cao" "Macho" "Checo" "Grande" 4 False)
        , (Animal 20 "Tartaruga" "Macho" "Raphael" "Pequeno" 10 False)
        , (Animal 21 "Tartaruga" "Macho" "Donatello" "Pequeno" 29 False)
        , (Animal 22 "Coelho" "Femea" "Daisy" "Medio" 2 True)
        , (Animal 23 "Gato" "Macho" "Riscas" "Medio" 6 True)
        , (Animal 24 "Passaro" "Macho" "Fred" "Pequeno" 5 False)
        , (Animal 25 "Passaro" "Femea" "Kiwi" "Pequeno" 2 False)
        , (Animal 26 "Cao" "Femea" "Mel" "Medio" 5 True)
        , (Animal 27 "Tartaruga" "Femea" "Rita" "Pequeno" 2 False)
        , (Animal 28 "Coelho" "Macho" "Bugs" "Pequeno" 1 True)
        , (Animal 29 "Gato" "Femea" "Mimi" "Medio" 15 True)
        , (Animal 30 "Tartaruga" "Femea" "Margarida" "Pequeno" 40 False)]

-- Verifica se um animal existe na lista
animalExiste :: Int -> ListaDeAnimais -> Bool
animalExiste _ [] = False
animalExiste idProcurado ((Animal idA _ _ _ _ _ _):xs)
    | idProcurado == idA = True
    | otherwise = animalExiste idProcurado xs
