module Dados where

import Model

animaisIniciais :: ListaDeAnimais
animaisIniciais =
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

adotantesIniciais :: ListaDeAdotantes
adotantesIniciais =
    [ Adotante 1 "Mariana" "912345678" 2
    , Adotante 2 "Joaquim" "923456789" 1
    , Adotante 3 "Ana" "934567890" 3
    ]

adocoesIniciais :: ListaDeAdocoes
adocoesIniciais =
    [ Adocao 2 1
    , Adocao 10 1
    , Adocao 5 3
    , Adocao 6 3
    ]