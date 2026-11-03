module AdocoesTeste where

import Animais
import Adotantes
import Adocoes

-- Dados para os testes
animaisTeste :: ListaDeAnimais
animaisTeste =
    [ Animal 1 "Cao" "Macho" "Jack" "Medio" 5 False
    , Animal 2 "Gato" "Macho" "Teco" "Medio" 13 True
    , Animal 3 "Cao" "Macho" "Max" "Grande" 2 False
    , Animal 4 "Tartaruga" "Macho" "Donatello" "Pequeno" 20 False
    , Animal 5 "Coelho" "Femea" "Pompom" "Pequeno" 1 True
    , Animal 6 "Gato" "Femea" "Miona" "Medio" 3 True
    , Animal 7 "Passaro" "Femea" "Pipoca" "Pequeno" 1 False
    , Animal 8 "Cao" "Femea" "Fifi" "Pequeno" 4 False
    , Animal 9 "Cao" "Femea" "Patuda" "Grande" 12 False
    , Animal 10 "Passaro" "Macho" "Blue" "Pequeno" 2 True
    ]

adotantesTeste :: ListaDeAdotantes
adotantesTeste =
    [ Adotante 1 "Mariana" "912345678" 2
    , Adotante 2 "Joaquim" "923456789" 1
    , Adotante 3 "Ana" "934567890" 3
    ]

-- O Jack esta disponivel e o Teco ja foi adotado
testeNaoAdotado :: Bool
testeNaoAdotado =
    not (estaAdotado 1 animaisTeste)
    && estaAdotado 2 animaisTeste

-- Verifica quais os animais disponiveis
testeAnimaisDisponiveis :: Bool
testeAnimaisDisponiveis =
    obterAnimaisDisponiveis animaisTeste ==
    [ Animal 1 "Cao" "Macho" "Jack" "Medio" 5 False
    , Animal 3 "Cao" "Macho" "Max" "Grande" 2 False
    , Animal 4 "Tartaruga" "Macho" "Donatello" "Pequeno" 20 False
    , Animal 7 "Passaro" "Femea" "Pipoca" "Pequeno" 1 False
    , Animal 8 "Cao" "Femea" "Fifi" "Pequeno" 4 False
    , Animal 9 "Cao" "Femea" "Patuda" "Grande" 12 False
    ]

-- O Jack fica adotado e a Mariana passa de 2 para 3 adocoes
-- Os restantes dados devem ficar iguais
testeRealizarAdocao :: Bool
testeRealizarAdocao =
    let (novosAnimais, novosAdotantes) =
            realizarAdocao 1 1 animaisTeste adotantesTeste
    in novosAnimais ==
       (Animal 1 "Cao" "Macho" "Jack" "Medio" 5 True
        : drop 1 animaisTeste)
       && novosAdotantes ==
          [ Adotante 1 "Mariana" "912345678" 3
          , Adotante 2 "Joaquim" "923456789" 1
          , Adotante 3 "Ana" "934567890" 3
          ]

-- O total inicial e 6; numa lista vazia e 0
testeTotalAdocoes :: Bool
testeTotalAdocoes =
    totalDeAdocoes adotantesTeste == 6
    && totalDeAdocoes [] == 0

testesAdocoes :: IO ()
testesAdocoes = do
    putStrLn "-- Testes das Adocoes --"
    print testeNaoAdotado
    print testeAnimaisDisponiveis
    print testeRealizarAdocao
    print testeTotalAdocoes