# PF
SISTEMA DE GESTÃO DE ANIMAIS DOMÉSTICOS PARA ADOÇÃO

## Sobre o projeto

Este repositório contém o trabalho prático desenvolvido no âmbito da Unidade Curricular de Programação Funcional, da Licenciatura em Engenharia Informática da Universidade de Trás-os-Montes e Alto Douro (UTAD).

O projeto é desenvolvido em Haskell, aplicando os conceitos e técnicas de programação funcional estudados ao longo do semestre.

## Objetivos da 1.ª Fase

A primeira fase do projeto, denominada **Modelação e Núcleo Funcional**, tem como objetivo desenvolver a estrutura inicial de um sistema de gestão de animais domésticos para adoção.

Nesta fase definimos tipos de dados próprios com `data` e records, organizamos o código em módulos e implementamos funções puras para consultar animais e gerir adoções, utilizando pattern matching, guards e recursividade.

Incluímos também dados de demonstração e testes básicos. O README documenta o funcionamento do projeto e o Git permite acompanhar o histórico de desenvolvimento do grupo.

## Tecnologias

- Haskell
- GHCi
- Visual Studio Code
- Git / GitHub Desktop

## Estrutura do projeto

```text
PF/
├── README.md
├── app/
│   └── Main.hs
├── src/
│   ├── Animais.hs
│   ├── Adotantes.hs
│   └── Adocoes.hs
└── test/
    ├── AnimaisTeste.hs
    ├── AdotantesTeste.hs
    └── AdocoesTeste.hs
```

- **Animais.hs**: definição dos animais, lista inicial, listagem e pesquisa por identificador.
- **Adotantes.hs**: definição dos adotantes, lista inicial, listagem, pesquisa e atualização do número de adoções.
- **Adocoes.hs**: regras de adoção, consulta de animais disponíveis e adotados e cálculo do total de adoções.
- **Main.hs**: demonstração interativa no terminal.
- **Testes/**: três módulos com testes básicos das funções puras.

## Execução no GHCi

Os comandos seguintes devem ser executados na pasta principal do projeto, onde se encontram as pastas `src` e `app`.

Para abrir o GHCi e carregar o programa:

```bash
ghci -isrc app/Main.hs
```

Dentro do GHCi, executar:

```haskell
main
```

O programa apresenta os animais disponíveis e o total de adoções dos adotantes registados. Depois, pede o identificador de um animal e o número de um cliente para demonstrar uma adoção.

Após alterar e guardar os ficheiros, recarregar o código:

```haskell
:reload
```

Para executar novamente o programa:

```haskell
main
```

Para sair do GHCi:

```haskell
:quit
```

As alterações produzidas pela adoção são apresentadas durante a execução. Nesta fase, não são guardadas em ficheiros nem alteram as listas iniciais definidas no código.

## 🐾 Estrutura dos dados

### Animais

**Animal** é um tipo definido com `data` e records, contendo sete campos:

- `idAnimal`: identificador do animal.
- `especie`: espécie.
- `sexo`: sexo.
- `nomeAnimal`: nome.
- `porte`: porte.
- `idade`: idade.
- `adotado`: estado de adoção.

**ListaDeAnimais** é um sinónimo de tipo definido com `type`, que representa uma lista de valores `Animal`.

A lista inicial contém **30 animais** de diferentes espécies, idades e características.

O estado de adoção é representado por um valor `Bool`:

- `True`: o animal já foi adotado.
- `False`: o animal encontra-se disponível para adoção.

### Adotantes

**Adotante** é um tipo definido com `data` e records, contendo quatro campos:

- `numeroCliente`: número de cliente.
- `nomeAdotante`: nome.
- `telefoneAdotante`: número de telefone.
- `numeroAdocoes`: número de adoções.

**ListaDeAdotantes** é um sinónimo de tipo definido com `type`, que representa uma lista de valores `Adotante`.

A lista inicial contém **6 adotantes**, todos com pelo menos uma adoção registada.

Os tipos `Animal` e `Adotante` incluem `deriving (Eq, Show)`, permitindo comparar os seus valores e apresentá-los no terminal.

O modelo atual guarda o estado de adoção de cada animal e o número de adoções de cada adotante. Ainda não guarda um histórico que associe cada animal ao respetivo adotante.

## Funcionalidades implementadas

### 1. Listar animais

A função `listarAnimais` apresenta todos os animais de uma lista no terminal.

Utiliza recursividade e pattern matching para percorrer a lista, apresentando cada animal até chegar à lista vazia.

### 2. Listar adotantes

A função `listarAdotantes` apresenta todos os adotantes de uma lista no terminal.

Tal como `listarAnimais`, utiliza recursividade e pattern matching.

### 3. Verificar a existência de animais e clientes

As funções `animalExiste` e `clienteExiste` pesquisam recursivamente um identificador nas respetivas listas.

Devolvem `True` quando encontram o animal ou cliente e `False` quando não o encontram.

### 4. Consultar o estado de adoção

A função `estaAdotado` consulta o estado de adoção de um animal através do seu identificador.

Devolve `True` se o animal estiver adotado e `False` se estiver disponível ou se o identificador não existir na lista.

### 5. Consultar animais disponíveis e adotados

A função `obterAnimaisDisponiveis` devolve uma lista com os animais que ainda não foram adotados.

A função `obterAnimaisAdotados` devolve uma lista com os animais que já foram adotados.

As funções `listarAnimaisDisponiveis` e `listarAnimaisAdotados` apresentam essas listas no terminal.

### 6. Atualizar o número de adoções

A função `adicionarAdocoes` acrescenta uma quantidade positiva ao número de adoções de um cliente.

Se a quantidade for igual ou inferior a zero, ou se o cliente não existir, a lista mantém-se inalterada.

### 7. Marcar um animal como adotado

A função `marcarComoAdotado` devolve uma lista em que o animal identificado passa a ter o campo `adotado` com o valor `True`.

Os restantes animais mantêm os seus dados.

### 8. Realizar uma adoção

A função `realizarAdocao` verifica se o animal e o cliente existem e se o animal está disponível.

Quando a adoção é válida, devolve duas listas atualizadas:

- O animal fica marcado como adotado.
- O número de adoções do cliente aumenta em uma unidade.

Se o animal ou o cliente não existirem, ou se o animal já estiver adotado, as listas são devolvidas sem alterações.

### 9. Calcular o total de adoções

A função `totalDeAdocoes` soma recursivamente os números de adoções dos adotantes registados.

Este resultado corresponde ao total registado nos contadores dos adotantes, podendo ser diferente da quantidade de animais marcados como adotados na lista.

## Testes

Os testes estão organizados em três módulos:

- **AnimaisTeste.hs**: quantidade de animais de teste, pesquisa e comportamento com uma lista vazia.
- **AdotantesTeste.hs**: quantidade de adotantes de teste, atualização do número de adoções e comportamento com uma lista vazia.
- **AdocoesTeste.hs**: estado de adoção, animais disponíveis, realização de uma adoção válida e cálculo do total de adoções.

Os dados de teste utilizam os primeiros **10 animais** e os primeiros **3 adotantes** das listas iniciais.

As nove verificações devolvem valores do tipo `Bool`. O resultado esperado é `True` em todas.

### Executar os testes no GHCi

Na pasta principal do projeto, abrir o GHCi com:

```bash
ghci -isrc -isrc/Testes src/Testes/AdocoesTeste.hs
```

Depois, executar:

```haskell
AnimaisTeste.testesAnimais
AdotantesTeste.testesAdotantes
AdocoesTeste.testesAdocoes
```

Após alterar e guardar os ficheiros de testes, utilizar `:reload` e executar novamente as funções de teste.

## Conceitos de programação funcional utilizados

- Tipos de dados próprios com `data` e records.
- Sinónimos de tipos com `type`.
- Assinaturas explícitas nas funções.
- Funções puras para consultar e transformar os dados.
- Pattern matching para tratar as diferentes formas das listas e decompor os dados.
- Guards para selecionar resultados de acordo com condições.
- Recursividade para percorrer listas, pesquisar, selecionar e calcular totais.
- Imutabilidade: as atualizações produzem novos valores.
- Ações `IO` para apresentar informação e receber dados no terminal.

## 👥 Autores

- Marta Monteiro - al2025163535
- Alexandre Sousa - al2025173550
- Beatriz Belo - al2024147689
