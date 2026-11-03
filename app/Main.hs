module Main where

import Animais
import Adotantes
import Adocoes

main :: IO ()
main = do
    putStrLn "-- Lista de Animais Disponiveis -- :"
    listarAnimaisDisponiveis animais

    putStrLn "\n-- Total de adoções no sistema -- :"
    print (totalDeAdocoes adotantes)

    putStrLn "\n-- Realizar adocao -- :"

    putStrLn "Introduza o ID do animal:"
    idAnimal <- readLn

    putStrLn "Introduza o numero do cliente:"
    idCliente <- readLn

    if not (animalExiste idAnimal animais)
        then putStrLn "Erro: animal inexistente!"
        else if not (clienteExiste idCliente adotantes)
            then putStrLn "Erro: cliente inexistente!"
            else if estaAdotado idAnimal animais
                then putStrLn "Erro: este animal ja foi adotado!"
                else do
                    let (novosAnimais, novosAdotantes) = realizarAdocao idAnimal idCliente animais adotantes

                    putStrLn "\n-- Novo Total de adocoes do cliente -- :"
                    listarAdotantes novosAdotantes

                    putStrLn "\n-- Animais disponiveis depois da adocao -- :"
                    listarAnimaisDisponiveis novosAnimais

                    putStrLn "\n-- Total de adocoes atualizado -- :"
                    print (totalDeAdocoes novosAdotantes)