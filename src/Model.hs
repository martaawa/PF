module Model where

-- | Definição da entidade Animal
data Animal = Animal {
    idAnimal   :: Int,
    especie    :: String,
    sexo       :: String,
    nome       :: String,
    porte      :: String,
    idade      :: Int,
    adotado    :: Bool
} deriving (Show, Eq)

type ListaDeAnimais = [Animal]

data Adotante = Adotante {
    idAdotante    :: Int,
    nomeAdotante  :: String,
    telefone      :: String,
    numeroAdocoes :: Int
} deriving (Show, Eq)

type ListaDeAdotantes = [Adotante]

-- | Definição da entidade Adocao (relação N:M)
data Adocao = Adocao {
    adocaoAnimalId   :: Int,
    adocaoAdotanteId :: Int
} deriving (Show, Eq)

type ListaDeAdocoes = [Adocao]