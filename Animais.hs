module Animais where

type Animal = (Int, String, String, String, String, Int, Bool)
    -- (ID, Espécie, Sexo, Nome, Porte, Idade, Estado de adoção)

type ListaDeAnimais = [Animal]

listarAnimais :: ListaDeAnimais -> IO ()
listarAnimais [] = return ()
listarAnimais (x:xs) = do
    print x
    listarAnimais xs

animais :: ListaDeAnimais
animais =
        [ (1, "Cao", "Macho", "Jack", "Medio", 5, False)
        , (2, "Gato", "Macho", "Teco", "Medio", 13, True)
        , (3, "Cao", "Macho", "Max", "Grande", 2, False)
        , (4, "Tartaruga", "Macho", "Donatello", "Pequeno", 20, False)
        , (5, "Coelho", "Femea", "Pompom", "Pequeno", 1, True)
        , (6, "Gato", "Femea", "Miona", "Medio", 3, True)
        , (7, "Passaro", "Femea", "Pipoca", "Pequeno", 1, False)
        , (8, "Cao", "Femea", "Fifi", "Pequeno", 4, False)
        , (9, "Cao", "Femea", "Patuda", "Grande", 12, False)
        , (10, "Passaro", "Macho", "Blue", "Pequeno", 2, True)
        , (11, "Gato", "Femea", "Chanel", "Pequeno", 1, False)
        , (12, "Coelho", "Macho", "Toby", "Medio", 7, False)
        , (13, "Tartaruga", "Macho", "Leonardo", "Pequeno", 9, False)
        , (14, "Tartaruga", "Macho", "Michelangelo", "Pequeno", 8, False)
        , (15, "Gato", "Macho", "Tico", "Medio", 8, True)
        , (16, "Coelho", "Femea", "Lola", "Pequeno", 1, False)
        , (17, "Coelho", "Femea", "Lily", "Medio", 4, True)
        , (18, "Passaro", "Macho", "Zazu", "Pequeno", 2, True)
        , (19, "Cao", "Macho", "Checo", "Grande", 4, False)
        , (20, "Tartaruga", "Macho", "Raphael", "Pequeno", 10, False)
        , (21, "Tartaruga", "Macho", "Donatello", "Pequeno", 29, False)
        , (22, "Coelho", "Femea", "Daisy", "Medio", 2, True)
        , (23, "Gato", "Macho", "Riscas", "Medio", 6, True)
        , (24, "Passaro", "Macho", "Fred", "Pequeno", 5, False)
        , (25, "Passaro", "Femea", "Kiwi", "Pequeno", 2, False)
        , (26, "Cao", "Femea", "Mel", "Medio", 5, True)
        , (27, "Tartaruga", "Femea", "Rita", "Pequeno", 2, False)
        , (28, "Coelho", "Macho", "Bugs", "Pequeno", 1, True)
        , (29, "Gato", "Femea", "Mimi", "Medio", 15, True)
        , (30, "Tartaruga", "Femea", "Margarida", "Pequeno", 40, False)]