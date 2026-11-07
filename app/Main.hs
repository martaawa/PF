module Main where

import Model
import Dados
import Domain

main :: IO ()
main = do
    putStrLn "=================================================="
    putStrLn "  SISTEMA DE GESTÃO DE ANIMAIS DOMÉSTICOS (UTAD)  "
    putStrLn "=================================================="
    putStrLn ""
    putStrLn "1. Animais Disponíveis Inicialmente:"
    print (obterAnimaisDisponiveis animaisIniciais)
    putStrLn ""
    putStrLn "2. Adotantes Registados:"
    print adotantesIniciais
    putStrLn ""
    putStrLn "3. Realizar Adoção (Animal ID 1 pelo Cliente ID 1):"
    let (novosAnimais, novosAdotantes, novasAdocoes) = 
            realizarAdocao 1 1 animaisIniciais adotantesIniciais adocoesIniciais
    putStrLn "Animais atualizados:"
    print novosAnimais
    putStrLn "Adotantes atualizados:"
    print novosAdotantes
    putStrLn "Registo de Adoções:"
    print novasAdocoes
    putStrLn ""
    putStrLn "4. Animais Adotados pela Ana (Cliente ID 3):"
    print (animaisDeAdotante 3 novasAdocoes)
    putStrLn ""
    putStrLn "=================================================="