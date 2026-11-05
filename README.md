# PF
🐾 SISTEMA DE GESTÃO DE ANIMAIS DOMÉSTICOS PARA ADOÇÃO 🐾

## Sobre o projeto

Este projeto foi desenvolvido para a **Unidade Curricular de Programação Funcional**, da Licenciatura em Engenharia Informática da Universidade de Trás-os-Montes e Alto Douro (UTAD).

Estamos a criar um sistema em Haskell para consultar animais disponíveis para adoção e registar adoções feitas por clientes.

## Objetivos da 1.ª Fase

Nesta primeira fase, começámos por definir os dados dos animais e dos adotantes.

Organizámos o código em módulos e criámos funções para pesquisar animais e clientes, consultar os animais disponíveis, realizar uma adoção e calcular o total de adoções.

Utilizámos tipos de dados, listas, pattern matching, guards e recursividade. Criámos também alguns testes para verificar o funcionamento das funções.

## Ferramentas utilizadas

- Haskell
- GHCi
- Visual Studio Code
- Git / GitHub Desktop

## Organização do projeto

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
|   ├── AnimaisTeste.hs
|   ├── AdotantesTeste.hs
|   └── AdocoesTeste.hs
|
└── docs/
|   └── Relatório.pdf
```

- **Animais.hs**: contém o tipo `Animal`, a lista de animais e funções para listar e procurar animais.
- **Adotantes.hs**: contém o tipo `Adotante`, a lista de adotantes e funções para consultar e atualizar os seus dados.
- **Adocoes.hs**: contém as funções relacionadas com as adoções.
- **Main.hs**: permite experimentar o sistema no terminal.
- **test/**: contém os três ficheiros de testes.

## Dados dos animais

Criámos o tipo `Animal` com `data` e records. Os records permitem dar um nome a cada campo.

Cada animal tem:

- ID
- Espécie
- Sexo
- Nome
- Porte
- Idade
- Estado de adoção

O estado de adoção é um valor `Bool`:

- `True`: o animal já foi adotado.
- `False`: o animal ainda está disponível.

A lista principal tem **30 animais**.

Também definimos `ListaDeAnimais` com `type`, para dar um nome mais simples ao tipo `[Animal]`.

## Dados dos adotantes

Criámos o tipo `Adotante` com `data` e records.

Cada adotante tem:

- Número de cliente
- Nome
- Número de telefone
- Número de adoções

A lista principal tem **6 adotantes**, todos com pelo menos uma adoção registada.

Definimos também `ListaDeAdotantes` com `type`, para representar uma lista de adotantes.

Nos dois tipos utilizámos `deriving (Eq, Show)`. Isto permite comparar os dados com `==` e apresentá-los no terminal.

Nesta fase, guardamos o estado de cada animal e o número de adoções de cada cliente. Ainda não guardamos qual foi o cliente que adotou cada animal.

## Funcionalidades implementadas

### 1. Listar animais

A função `listarAnimais` mostra os animais no terminal.

Utiliza recursividade para percorrer a lista e apresentar um animal de cada vez, até chegar à lista vazia.

### 2. Listar adotantes

A função `listarAdotantes` mostra os adotantes no terminal.

Funciona de forma semelhante à função `listarAnimais`, percorrendo a lista através de recursividade.

### 3. Procurar animais e clientes

As funções `animalExiste` e `clienteExiste` verificam se um animal ou cliente existe na respetiva lista.

Recebem o identificador e devolvem `True` se o encontrarem ou `False` se não o encontrarem.

### 4. Verificar o estado de adoção

A função `estaAdotado` verifica se um animal já foi adotado.

Devolve `True` se estiver adotado e `False` se estiver disponível ou se o identificador não existir.

### 5. Consultar animais disponíveis e adotados

A função `obterAnimaisDisponiveis` devolve uma lista com os animais que ainda não foram adotados.

A função `obterAnimaisAdotados` devolve uma lista com os animais que já foram adotados.

As funções `listarAnimaisDisponiveis` e `listarAnimaisAdotados` mostram essas listas no terminal.

### 6. Atualizar o número de adoções

A função `adicionarAdocoes` aumenta o número de adoções de um cliente.

Se a quantidade indicada for igual ou inferior a zero, ou se o cliente não existir, a lista fica igual.

### 7. Marcar um animal como adotado

A função `marcarComoAdotado` coloca o estado de adoção de um animal a `True`.

Devolve uma nova lista com essa alteração, mantendo os dados dos restantes animais.

### 8. Realizar uma adoção

A função `realizarAdocao` verifica se o animal e o cliente existem e se o animal ainda está disponível.

Se a adoção for válida:

- O animal passa a estar adotado.
- O número de adoções do cliente aumenta em uma unidade.

A função devolve as duas listas atualizadas. Se o animal ou o cliente não existirem, ou se o animal já estiver adotado, devolve as listas sem alterações.

### 9. Calcular o total de adoções

A função `totalDeAdocoes` soma o número de adoções de todos os adotantes da lista, utilizando recursividade.

Este total corresponde às adoções registadas nos contadores dos clientes e pode ser diferente do número de animais marcados como adotados.

### 10. Procurar animais por nome ou espécie

As funções `procurarPorNome` e `procurarPorEspecie` devolvem uma lista com todos os animais que têm o nome ou a espécie indicados.

Devolvem uma lista, e não um único animal, porque podem existir vários resultados (por exemplo, existem dois animais chamados Donatello). Se não houver resultados, devolvem uma lista vazia.

### 11. Registar um novo animal

A função `registarAnimal` acrescenta um novo animal à lista.

- O ID é atribuído automaticamente pela função `proximoId`, que calcula o maior ID existente e soma 1. Assim, nunca há IDs repetidos.
- Um animal novo fica sempre disponível para adoção.

A lista original não é alterada: a função devolve uma nova lista com o animal acrescentado.

## Como executar

Utilizamos o GHCi para experimentar o projeto.

Na pasta principal `PF`, abrir o terminal e escrever:

```bash
ghci -isrc app/Main.hs
```

Depois, dentro do GHCi:

```haskell
main
```

O programa mostra os animais disponíveis e pede o ID de um animal e o número de um cliente para realizar uma adoção.

Depois de alterar e guardar o código, podemos recarregá-lo com:

```haskell
:r
```

Para executar novamente:

```haskell
main
```

Para sair:

```haskell
:q
```

Nesta fase, as alterações não são guardadas em ficheiros. Quando executamos novamente `main`, voltamos a usar as listas iniciais.

## Testes

Criámos três ficheiros de testes para verificar o funcionamento das funções implementadas na primeira fase.

- **AnimaisTeste.hs**: contém a função `testesAnimais`, que realiza 6 testes. Verifica a quantidade de animais, a existência de animais através do ID, a pesquisa por nome e espécie, o cálculo do próximo ID disponível e o registo de um novo animal.

- **AdotantesTeste.hs**: contém a função `testesAdotantes`, que realiza 3 testes. Verifica a quantidade de adotantes, a atualização do número de adoções de um cliente e o comportamento da função perante uma lista vazia.

- **AdocoesTeste.hs**: contém a função `testesAdocoes`, que realiza 4 testes. Verifica o estado de adoção dos animais, a obtenção dos animais disponíveis, a realização de uma adoção válida e o cálculo do número total de adoções.

Utilizamos **10 animais e 3 adotantes** nos testes, pois considerámos que listas reduzidas facilitam a verificação dos resultados.

Para abrir os testes no GHCi, escrever na pasta principal `PF`:

```bash
ghci -isrc -itest test/AdocoesTeste.hs
```

Depois, carregar os restantes módulos de testes, caso ainda não estejam carregados:

```haskell
:add test/AnimaisTeste.hs test/AdotantesTeste.hs
```

Para executar os testes:

```haskell
AnimaisTeste.testesAnimais
AdotantesTeste.testesAdotantes
AdocoesTeste.testesAdocoes
```

Existem **13 testes**, que deverão apresentar `True` quando todas as verificações forem bem-sucedidas.

Para abrir os testes no GHCi, escrever na pasta principal `PF`:

```bash
ghci -isrc -itest test/AdocoesTeste.hs
```

Depois, carregar os restantes módulos de testes, caso ainda não estejam carregados:

```haskell
:add test/AnimaisTeste.hs test/AdotantesTeste.hs
```

Para executar os testes:

```haskell
AnimaisTeste.testesAnimais
AdotantesTeste.testesAdotantes
AdocoesTeste.testesAdocoes
```

Existem **13 testes**, que deverão apresentar `True` quando todas as verificações forem bem-sucedidas.

Para abrir os testes no GHCi, escrever na pasta principal `PF`:

```bash
ghci -isrc -itest test/AdocoesTeste.hs
```

Depois, executar:

```haskell
AnimaisTeste.testesAnimais
AdotantesTeste.testesAdotantes
AdocoesTeste.testesAdocoes
```

Existem **9 verificações** e todas devem apresentar `True`.

## Conceitos utilizados

- **`data` e records**: para definir os animais e os adotantes com campos com nomes.
- **`type`**: para dar nomes aos tipos das listas.
- **Pattern matching**: para separar os casos das listas vazias e não vazias e aceder aos dados.
- **Guards**: para escolher o resultado de acordo com uma condição.
- **Recursividade**: para percorrer as listas e calcular resultados.
- **Funções puras**: para consultar e atualizar dados sem alterar as listas originais.
- **`IO`**: para mostrar informação e receber dados no terminal.

## Autores

- Marta Monteiro - al2025163535
- Alexandre Sousa - al2025173550
- Beatriz Belo - al2024147689
