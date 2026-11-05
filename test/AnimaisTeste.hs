module AnimaisTeste where

import Animais

animaisTeste :: ListaDeAnimais
animaisTeste = take 10 animais

testeQuantidade :: Bool
testeQuantidade = length animaisTeste == 10

-- Verifica se o animal 10 existe na lista de teste
-- e se nao existe numa lista vazia.
-- O resultado esperado e True quando as duas verificacoes passam.
testeListaVazia :: Bool
testeListaVazia = animalExiste 10 animaisTeste && not (animalExiste 10 [])

testesAnimais :: IO ()
testesAnimais = do
    print testeQuantidade
    print testeListaVazia

