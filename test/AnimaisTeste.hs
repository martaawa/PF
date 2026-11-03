module AnimaisTeste where

import Animais

animaisTeste :: ListaDeAnimais
animaisTeste = take 10 animais

testeQuantidade :: Bool
testeQuantidade = length animaisTeste == 10

testeListaVazia :: Bool
testeListaVazia = animalExiste 10 animaisTeste && not (animalExiste 10 [])

testesAnimais :: IO ()
testesAnimais = do
    print testeQuantidade
    print testeListaVazia
