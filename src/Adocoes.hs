module Adocoes where

import Animais
import Adotantes

data Adocao = Adocao {
    idAnimal :: Int,
    idAdotante :: Int
} deriving (Show, Eq)

type ListaDeAdocoes = [Adocao]

estaAdotado :: Int -> ListaDeAnimais -> Bool
estaAdotado _ [] = False
estaAdotado procurado (Animal i _ _ _ _ _ est : xs)
    | procurado == i = est
    | otherwise      = estaAdotado procurado xs

marcarComoAdotado :: Int -> ListaDeAnimais -> ListaDeAnimais
marcarComoAdotado _ [] = []
marcarComoAdotado procurado (a@(Animal i _ _ _ _ _ _) : xs)
    | procurado == i = a { adotado = True } : xs
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

realizarAdocao :: Int -> Int -> ListaDeAnimais -> ListaDeAdotantes -> ListaDeAdocoes -> (ListaDeAnimais, ListaDeAdotantes, ListaDeAdocoes)
realizarAdocao animal cliente listaA listaAd listaAdoc
    | not (animalExiste animal listaA)     = (listaA, listaAd, listaAdoc)
    | not (clienteExiste cliente listaAd)   = (listaA, listaAd, listaAdoc)
    | estaAdotado animal listaA             = (listaA, listaAd, listaAdoc)
    | otherwise = 
        let novosAnimais   = marcarComoAdotado animal listaA
            novosAdotantes = adicionarAdocoes cliente 1 listaAd
            novaAdocao     = Adocao animal cliente
        in (novosAnimais, novosAdotantes, novaAdocao : listaAdoc)

totalDeAdocoes :: ListaDeAdotantes -> Int
totalDeAdocoes [] = 0
totalDeAdocoes (a:xs) = numeroAdocoes a + totalDeAdocoes xs

animaisDeAdotante :: Int -> ListaDeAdocoes -> [Int]
animaisDeAdotante _ [] = []
animaisDeAdotante cliente (Adocao anim adot : xs)
    | adot == cliente = anim : animaisDeAdotante cliente xs
    | otherwise = animaisDeAdotante cliente xs
