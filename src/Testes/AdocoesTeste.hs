module AdotantesTeste where

import Adotantes

adotantesTeste :: ListaDeAdotantes
adotantesTeste = take 3 adotantes

testeQuantidade :: Bool
testeQuantidade = length adotantesTeste == 3

testeAdicionarAdocao :: Bool
testeAdicionarAdocao = adicionarAdocoes 3 1 adotantesTeste ==
    [Adotante 1 "Mariana" "912345678" 2,
     Adotante 2 "Joaquim" "923456789" 1,
     Adotante 3 "Ana" "934567890" 4]

testeListaVazia :: Bool
testeListaVazia = adicionarAdocoes 1 1 [] == []

testesAdotantes :: IO ()
testesAdotantes = do
    print testeQuantidade
    print testeAdicionarAdocao
    print testeListaVazia
