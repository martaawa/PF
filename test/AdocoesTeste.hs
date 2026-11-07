module AdocoesTeste where

import Animais
import Adotantes
import Adocoes


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


adocoesTeste :: ListaDeAdocoes
adocoesTeste =
    [ Adocao 2 1  -- Teco adotado pela Mariana
    , Adocao 5 3  -- Pompom adotada pela Ana
    , Adocao 6 3  -- Miona adotada pela Ana
    , Adocao 10 1 -- Blue adotado pela Mariana
    ]


testeNaoAdotado :: Bool
testeNaoAdotado =
    not (estaAdotado 1 animaisTeste)
    && estaAdotado 2 animaisTeste

-- Verifica quais os animais disponíveis
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


testeRealizarAdocao :: Bool
testeRealizarAdocao =
    let (novosAnimais, novosAdotantes, novasAdocoes) =
            realizarAdocao 1 1 animaisTeste adotantesTeste adocoesTeste
    in novosAnimais == (Animal 1 "Cao" "Macho" "Jack" "Medio" 5 True : drop 1 animaisTeste)
       && novosAdotantes ==
          [ Adotante 1 "Mariana" "912345678" 3
          , Adotante 2 "Joaquim" "923456789" 1
          , Adotante 3 "Ana" "934567890" 3
          ]
       && novasAdocoes == Adocao 1 1 : adocoesTeste


testeTotalAdocoes :: Bool
testeTotalAdocoes =
    totalDeAdocoes adotantesTeste == 6
    && totalDeAdocoes [] == 0

testeAnimaisDeAdotante :: Bool
testeAnimaisDeAdotante = animaisDeAdotante 3 adocoesTeste == [5, 6]

testesAdocoes :: IO ()
testesAdocoes = do
    putStrLn "-- Testes das Adocoes --"
    print testeNaoAdotado
    print testeAnimaisDisponiveis
    print testeRealizarAdocao
    print testeTotalAdocoes
    print testeAnimaisDeAdotante