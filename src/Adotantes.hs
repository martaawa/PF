module Adotantes where

data Adotante = Adotante
    { numeroCliente :: Int
    , nomeAdotante :: String
    , telefoneAdotante :: String
    , numeroAdocoes :: Int
    } deriving (Eq, Show)
-- (Adotante n.º cliente Nome n.º de Telefone n.º adoções)

type ListaDeAdotantes = [Adotante]

listarAdotantes :: ListaDeAdotantes -> IO ()
listarAdotantes [] = return ()
listarAdotantes (x:xs) = do
    print x
    listarAdotantes xs

adotantes :: ListaDeAdotantes
adotantes =
    [ (Adotante 1 "Mariana" "912345678" 2)
    , (Adotante 2 "Joaquim" "923456789" 1)
    , (Adotante 3 "Ana" "934567890" 3)
    , (Adotante 4 "Sofia" "956789012" 1)
    , (Adotante 5 "Daniel" "917256543" 1)
    , (Adotante 6 "Alice" "964053123" 1)
    ]

-- na lista de adotantes não estão presentes pessoas que não adotaram, ou seja, o n.º de adoção tem que ser sempre diferente de 0

adicionarAdocoes :: Int -> Int -> ListaDeAdotantes -> ListaDeAdotantes
adicionarAdocoes _ _ [] = []
adicionarAdocoes nc n ((Adotante i nome telefone total):xs)
    | n <= 0 = (Adotante i nome telefone total) : xs
    | nc == i = (Adotante i nome telefone (total+n)) : xs
    | otherwise = (Adotante i nome telefone total) : adicionarAdocoes nc n xs

-- caso uma pessoa/cliente decida que quer adotar 1 ou mais animais, o número na lista irá mudar para o n.º atual de adoções do mesmo
-- nc é nº cliente, x é o adotante, xs é a lista de adotantes
-- o n.º de adoções não pode ser negativo, nem se pode adicionar n.ºs negativos

clienteExiste :: Int -> ListaDeAdotantes -> Bool
clienteExiste _ [] = False
clienteExiste nc ((Adotante i _ _ _):xs)
    | nc == i = True
    | otherwise = clienteExiste nc xs
