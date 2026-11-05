module AnimaisTeste where

import Animais
import Adocoes

animaisTeste :: ListaDeAnimais
animaisTeste =
        [ (Animal 1 "Cao" "Macho" "Jack" "Medio" 5 False)
        , (Animal 2 "Gato" "Macho" "Teco" "Medio" 13 True)
        , (Animal 3 "Cao" "Macho" "Max" "Grande" 2 False)
        , (Animal 4 "Tartaruga" "Macho" "Donatello" "Pequeno" 20 False)
        , (Animal 5 "Coelho" "Femea" "Pompom" "Pequeno" 1 True)
        , (Animal 6 "Gato" "Femea" "Miona" "Medio" 3 True)
        , (Animal 7 "Passaro" "Femea" "Pipoca" "Pequeno" 1 False)
        , (Animal 8 "Cao" "Femea" "Fifi" "Pequeno" 4 False)
        , (Animal 9 "Cao" "Femea" "Patuda" "Grande" 12 False)
        , (Animal 10 "Tartaruga" "Macho" "Donatello" "Pequeno" 2 False)
        ]

testeQuantidade :: Bool
testeQuantidade = length animaisTeste == 10

-- Verifica se o animal 1 existe na lista de teste
-- e se nao existe numa lista vazia.
-- O resultado esperado e True quando as duas verificacoes passam.
testeListaVazia :: Bool
testeListaVazia = animalExiste 1 animaisTeste && not (animalExiste 99 animaisTeste)

testeProcurarPorNome :: Bool
testeProcurarPorNome 
    = length (procurarPorNome "Donatello" animaisTeste) == 2
    && null (procurarPorNome "Inexistente" animaisTeste)

testeProcurarPorEspecie :: Bool
testeProcurarPorEspecie =
    length (procurarPorEspecie "Cao" animaisTeste) == 4
    && null (procurarPorEspecie "Dragao" animaisTeste)

testeProximoId :: Bool
testeProximoId = proximoId animaisTeste == 11 &&  proximoId [] == 1

testeRegistarAnimal :: Bool
testeRegistarAnimal =
    let novaLista = registarAnimal "Gato" "Femea" "Luna" "Pequeno" 1 animaisTeste
    in animalExiste 11 novaLista
        && not (estaAdotado 11 novaLista)
        && length novaLista == 11 

testesAnimais :: IO ()
testesAnimais = do
    print testeQuantidade
    print testeListaVazia
    print testeProcurarPorNome
    print testeProcurarPorEspecie
    print testeProximoId
    print testeRegistarAnimal

