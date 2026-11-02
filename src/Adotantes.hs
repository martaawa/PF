module Adotantes where

type Adotante = (Int, String, String, Int)
-- (n.º cliente, Nome, n.º de Telefone, n.º adoções)

type ListaDeAdotantes = [Adotante]

listarAdotantes :: ListaDeAdotantes -> IO ()
listarAdotantes [] = return ()
listarAdotantes (x:xs) = do
    print x
    listarAdotantes xs

adotantes :: ListaDeAdotantes
adotantes =
    [ (1, "Mariana", "912345678", 2)
    , (2, "Joaquim", "923456789", 1)
    , (3, "Ana", "934567890", 3)
    , (4, "Sofia", "956789012", 1)
    ]

-- na lista de adotantes não estão presentes pessoas que não adotaram, ou seja, o n.º de adoção tem que ser sempre diferente de 0

adicionarAdocoes :: Int -> Int -> ListaDeAdotantes -> ListaDeAdotantes
adicionarAdocoes _ _ [] = []
adicionarAdocoes nc n ((i,nome,telefone,total):xs)
    | n <= 0 = (i,nome,telefone,total) : xs
    | nc == i = (i,nome,telefone,total+n) : xs
    | otherwise = (i,nome,telefone,total) : adicionarAdocoes nc n xs


-- caso uma pessoa/cliente decida que quer adotar 1 ou mais animais, o número na lista irá mudar para o n.º atual de adoções do mesmo
-- nc é nº cliente, x é o adotante, xs é a lista de adotantes
-- o n.º de adoções não pode ser negativo, nem se pode adicionar n.ºs negativos