module AdotantesTeste where

import Adotantes

-- Lista de 3 adotantes para os testes
adotantesTeste :: ListaDeAdotantes
adotantesTeste =
    [ Adotante 1 "Mariana" "912345678" 2
    , Adotante 2 "Joaquim" "923456789" 1
    , Adotante 3 "Ana" "934567890" 3
    ]

-- Verifica se existem 3 adotantes
testeQuantidade :: Bool
testeQuantidade = length adotantesTeste == 3

-- A Ana passa de 3 para 4 adocoes
-- Os restantes adotantes ficam iguais
testeAdicionarAdocao :: Bool
testeAdicionarAdocao =
    adicionarAdocoes 3 1 adotantesTeste ==
    [ Adotante 1 "Mariana" "912345678" 2
    , Adotante 2 "Joaquim" "923456789" 1
    , Adotante 3 "Ana" "934567890" 4
    ]

-- Adicionar uma adocao numa lista vazia devolve uma lista vazia
testeListaVazia :: Bool
testeListaVazia = adicionarAdocoes 1 1 [] == []

testesAdotantes :: IO ()
testesAdotantes = do
    putStrLn "-- Testes dos Adotantes --"
    print testeQuantidade
    print testeAdicionarAdocao
    print testeListaVazia