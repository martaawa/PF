module Domain where

import Model

animalExiste :: Int -> ListaDeAnimais -> Bool
animalExiste _ [] = False
animalExiste procurado (Animal i _ _ _ _ _ _ : xs)
    | procurado == i = True
    | otherwise      = animalExiste procurado xs

clienteExiste :: Int -> ListaDeAdotantes -> Bool
clienteExiste _ [] = False
clienteExiste procurado (Adotante i _ _ _ : xs)
    | procurado == i = True
    | otherwise      = clienteExiste procurado xs

estaAdotado :: Int -> ListaDeAnimais -> Bool
estaAdotado _ [] = False
estaAdotado procurado (Animal i _ _ _ _ _ est : xs)
    | procurado == i = est
    | otherwise      = estaAdotado procurado xs

marcarComoAdotado :: Int -> ListaDeAnimais -> ListaDeAnimais
marcarComoAdotado _ [] = []
marcarComoAdotado procurado (a@(Animal i _ _ _ _ _ _) : xs)
    | procurado == i = a { adotado = True } : xs
    | otherwise      = a : marcarComoAdotado procurado xs

obterAnimaisDisponiveis :: ListaDeAnimais -> ListaDeAnimais
obterAnimaisDisponiveis [] = []
obterAnimaisDisponiveis (a:xs)
    | not (adotado a) = a : obterAnimaisDisponiveis xs
    | otherwise       = obterAnimaisDisponiveis xs

obterAnimaisAdotados :: ListaDeAnimais -> ListaDeAnimais
obterAnimaisAdotados [] = []
obterAnimaisAdotados (a:xs)
    | adotado a = a : obterAnimaisAdotados xs
    | otherwise = obterAnimaisAdotados xs

adicionarAdocoes :: Int -> Int -> ListaDeAdotantes -> ListaDeAdotantes
adicionarAdocoes _ qtd [] = []
adicionarAdocoes procurado qtd (ad@(Adotante i n t nAd) : xs)
    | qtd <= 0       = ad : xs
    | procurado == i = ad { numeroAdocoes = nAd + qtd } : xs
    | otherwise      = ad : adicionarAdocoes procurado qtd xs

realizarAdocao :: Int -> Int -> ListaDeAnimais -> ListaDeAdotantes -> ListaDeAdocoes -> (ListaDeAnimais, ListaDeAdotantes, ListaDeAdocoes)
realizarAdocao animalId clienteId listaA listaAd listaAdoc
    | not (animalExiste animalId listaA)    = (listaA, listaAd, listaAdoc)
    | not (clienteExiste clienteId listaAd)  = (listaA, listaAd, listaAdoc)
    | estaAdotado animalId listaA            = (listaA, listaAd, listaAdoc)
    | otherwise = 
        let novosAnimais   = marcarComoAdotado animalId listaA
            novosAdotantes = adicionarAdocoes clienteId 1 listaAd
            novaAdocao     = Adocao animalId clienteId
        in (novosAnimais, novosAdotantes, novaAdocao : listaAdoc)

totalDeAdocoes :: ListaDeAdotantes -> Int
totalDeAdocoes [] = 0
totalDeAdocoes (Adotante _ _ _ nAd : xs) = nAd + totalDeAdocoes xs

animaisDeAdotante :: Int -> ListaDeAdocoes -> [Int]
animaisDeAdotante _ [] = []
animaisDeAdotante clienteId (Adocao animId adotId : xs)
    | adotId == clienteId = animId : animaisDeAdotante clienteId xs
    | otherwise           = animaisDeAdotante clienteId xs

procurarPorNome :: String -> ListaDeAnimais -> ListaDeAnimais
procurarPorNome _ [] = []
procurarPorNome procurado (a:xs)
    | nome a == procurado = a : procurarPorNome procurado xs
    | otherwise           = procurarPorNome procurado xs

procurarPorEspecie :: String -> ListaDeAnimais -> ListaDeAnimais
procurarPorEspecie _ [] = []
procurarPorEspecie procurada (a:xs)
    | especie a == procurada = a : procurarPorEspecie procurada xs
    | otherwise              = procurarPorEspecie procurada xs