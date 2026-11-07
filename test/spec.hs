module Main where

import Model
import Dados
import Domain

testesModel :: Bool
testesModel = 
    length animaisIniciais == 10 &&
    length adotantesIniciais == 3 &&
    length adocoesIniciais == 4

testesDomain :: Bool
testesDomain =
    animalExiste 1 animaisIniciais &&
    not (animalExiste 99 animaisIniciais) &&
    clienteExiste 3 adotantesIniciais &&
    estaAdotado 2 animaisIniciais &&
    not (estaAdotado 1 animaisIniciais) &&
    length (obterAnimaisDisponiveis animaisIniciais) == 6 &&
    animaisDeAdotante 1 adocoesIniciais == [2, 10]

testeRealizarAdocao :: Bool
testeRealizarAdocao =
    let (novosAnimais, novosAdotantes, novasAdocoes) = 
            realizarAdocao 1 1 animaisIniciais adotantesIniciais adocoesIniciais
    in case novosAdotantes of
        (ad:_) -> estaAdotado 1 novosAnimais &&
                  numeroAdocoes ad == 3 &&
                  length novasAdocoes == 5
        []     -> False

main :: IO ()
main = do
    putStrLn "========================================"
    putStrLn "   EXECUTANDO TESTES (CABAL)   "
    putStrLn "========================================"
    putStrLn $ "Testes de Model / Dados: " ++ show testesModel
    putStrLn $ "Testes de Regras Domain: " ++ show testesDomain
    putStrLn $ "Teste Realizar Adoção:  " ++ show testeRealizarAdocao
    putStrLn "========================================"
    if testesModel && testesDomain && testeRealizarAdocao
        then putStrLn "  RESULTADO: TODOS OS TESTES PASSARAM!  "
        else putStrLn "  RESULTADO: EXISTEM TESTES A FALHAR!  "
    putStrLn "========================================"