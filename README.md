# PF
SISTEMA DE GESTÃO DE ANIMAIS DOMÉSTICOS PARA ADOÇÃO

## 📌 Sobre o projeto

Este repositório contém o trabalho prático desenvolvido no âmbito da Unidade Curricular de Programação Funcional, da Licenciatura em Engenharia Informática da Universidade de Trás-os-Montes e Alto Douro (UTAD).

O projeto é desenvolvido em Haskell, aplicando os conceitos e técnicas de programação funcional estudados ao longo do semestre.

## 🎯 Objetivos da 1.ª Fase

A primeira fase do projeto, denominada **Modelação e Núcleo Funcional**, tem como objetivo desenvolver a estrutura inicial de um sistema de gestão de animais domésticos para adoção, utilizando a linguagem Haskell.

Nesta fase pretende-se definir os tipos de dados necessários, organizar o código em módulos e implementar funções puras para a gestão e consulta de animais domésticos, recorrendo a conceitos de programação funcional, como pattern matching e recursividade.

Pretende-se ainda criar dados de teste, documentar o projeto e manter um histórico de desenvolvimento através do Git.

## Tecnologias

- Haskell
- GHC / GHCi
- Visual Studio Code

## Execução

Para carregar o projeto no GHCi:

```bash
ghci main.hs
```

## 🐾 Estrutura dos Dados

Nesta primeira etapa, definimos dois tipos de dados:

- **Animal**: representa cada animal através de sete características: ID, Espécie, Sexo, Nome, Porte, Idade e Estado de Adoção.

- **ListaDeAnimais**: representa uma lista de elementos do tipo Animal.

Criámos uma lista inicial com 30 animais de diferentes espécies, idades e características, que será utilizada para testar as funcionalidades do sistema.

O Estado de Adoção é representado por um valor booleano (Bool):

- True: o animal já foi adotado.

- False: o animal encontra-se disponível para adoção.

## Funcionalidades Implementadas

1. Listar Animais

Implementámos a função **listarAnimais**, que permite apresentar todos os animais registados no sistema.

Esta função utiliza recursividade e pattern matching para percorrer a lista de animais, apresentando cada um individualmente até chegar à lista vazia.

## 👥 Autores

- Marta Monteiro - al2025163535
- Alexandre Sousa - al2025173550
- Beatriz Belo - al2024147689
