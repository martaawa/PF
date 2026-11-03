module Adocoes where

import Animais
import Adotantes

estaAdotado :: Int -> ListaDeAnimais -> Bool
estaAdotado _ [] = False
estaAdotado procurado (a:xs)
    | procurado == idAnimal a = adotado a
    | otherwise = estaAdotado procurado xs

marcarComoAdotado :: Int -> ListaDeAnimais -> ListaDeAnimais
marcarComoAdotado _ [] = []
marcarComoAdotado procurado (a:xs)
    | procurado == idAnimal a = a { adotado = True } : xs
    | otherwise = a : marcarComoAdotado procurado xs

obterAnimaisDisponiveis :: ListaDeAnimais -> ListaDeAnimais
obterAnimaisDisponiveis [] = []
obterAnimaisDisponiveis (a:xs)
    | not (adotado a) = a : obterAnimaisDisponiveis xs
    | otherwise = obterAnimaisDisponiveis xs

listarAnimaisDisponiveis :: ListaDeAnimais -> IO ()
listarAnimaisDisponiveis lista = listarAnimais (obterAnimaisDisponiveis lista)

obterAnimaisAdotados :: ListaDeAnimais -> ListaDeAnimais
obterAnimaisAdotados [] = []
obterAnimaisAdotados (a:xs)
    | adotado a = a : obterAnimaisAdotados xs
    | otherwise = obterAnimaisAdotados xs

listarAnimaisAdotados :: ListaDeAnimais -> IO ()
listarAnimaisAdotados lista = listarAnimais (obterAnimaisAdotados lista)

realizarAdocao :: Int -> Int -> ListaDeAnimais -> ListaDeAdotantes -> (ListaDeAnimais, ListaDeAdotantes)
realizarAdocao animal cliente listaA listaAd
    | not (animalExiste animal listaA) = (listaA, listaAd)
    | not (clienteExiste cliente listaAd) = (listaA, listaAd)
    | estaAdotado animal listaA = (listaA, listaAd)
    | otherwise = (marcarComoAdotado animal listaA, adicionarAdocoes cliente 1 listaAd)

totalDeAdocoes :: ListaDeAdotantes -> Int
totalDeAdocoes [] = 0
totalDeAdocoes (a:xs) = numeroAdocoes a + totalDeAdocoes xs
