module AdotantesTeste where

import Adotantes

-- Lista pequena de adotantes para realizar os testes
adotantesTeste :: ListaDeAdotantes
adotantesTeste =
    [ (1, "Mariana", "912345678", 2)
    , (2, "Joaquim", "923456789", 1)
    , (3, "Ana", "934567890", 3)
    ]

-- Verifica se a lista tem exatamente 3 adotantes
testeQuantidade :: Bool
testeQuantidade = length adotantesTeste == 3

-- Verifica se a lista não está vazia
testeListaNaoVazia :: Bool
testeListaNaoVazia = not (null adotantesTeste)

-- Testa adicionar 1 adoção a Mariana (passa de 2 para 3)
testeAdicionarAdocao :: Bool
testeAdicionarAdocao =
    adicionarAdocoes 1 1 adotantesTeste ==
    [ (1, "Mariana", "912345678", 3)
    , (2, "Joaquim", "923456789", 1)
    , (3, "Ana", "934567890", 3)
    ]

-- Testa adicionar 0 adoções (a lista deve ficar igual)
testeAdicionarZero :: Bool
testeAdicionarZero =
    adicionarAdocoes 1 0 adotantesTeste == adotantesTeste

-- Testa adicionar um numero negativo de adoções
-- A lista deve ficar igual
testeAdicionarNegativo :: Bool
testeAdicionarNegativo =
    adicionarAdocoes 1 (-1) adotantesTeste == adotantesTeste

-- Testa se adicionar uma adocao a um cliente inexistente
-- mantem a lista de adotantes inalterada
testeClienteInexistente :: Bool
testeClienteInexistente =
    adicionarAdocoes 10 1 adotantesTeste == adotantesTeste

-- Testa adicionar uma adoção numa lista vazia
-- O resultado deve continuar a ser uma lista vazia
testeListaVazia :: Bool
testeListaVazia =
    adicionarAdocoes 1 1 [] == []

-- Executa todos os testes
testesAdotantes :: IO ()
testesAdotantes = do
    putStrLn "-- Testes dos Adotantes --"
    print testeQuantidade
    print testeListaNaoVazia
    print testeAdicionarAdocao
    print testeAdicionarZero
    print testeAdicionarNegativo
    print testeClienteInexistente
    print testeListaVazia

-- Permite introduzir um numero de cliente no terminal
-- e verifica se esse cliente existe na lista

testarCliente :: IO ()
testarCliente = do
    putStrLn "Introduza o numero do cliente:"
    nc <- readLn

    if clienteExiste nc adotantesTeste
        then putStrLn "Cliente encontrado!"
        else putStrLn "Erro: cliente inexistente!"