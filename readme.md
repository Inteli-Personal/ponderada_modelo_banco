# Modelagem do Banco de Dados para Aplicação de Rede Social

Este é a modelagem do banco de dados da nossa plataforma, em que os usuários podem criar posts e ter interesse por diferentes público-alvo. O banco de dados é projetado usando SQL e contém as seguintes tabelas:

## Tabela 'usuários'

Armazena informações sobre os usuários da aplicação, como nome, email e senha.

| Campo | Tipo    | Descrição        |
|-------|---------|------------------|
| id    | INTEGER | Chave Primária   |
| nome  | VARCHAR | Nome do usuário  |
| email | VARCHAR | Email do usuário |
| senha | VARCHAR | Senha do usuário |

## Tabela 'feed'

Registra os posts feitos pelos usuários.

| Campo         | Tipo     | Descrição                     |
|---------------|----------|-------------------------------|
| id            | INTEGER  | Chave Primária                |
| id_usuarios   | INTEGER  | Chave Estrangeira (usuários)  |
| texto_do_post | VARCHAR  | Texto do post                 |
| data          | DATETIME | Data e hora do post           |

## Tabela 'usuarios-e-publico-alvo'

Estabelece uma relação entre os usuários e os públicos-alvo que eles seguem.

| Campo          | Tipo    | Descrição                                |
|----------------|---------|------------------------------------------|
| id_usuarios    | INTEGER | Chave Estrangeira (usuários)             |
| id_publico_alvo| INTEGER | Chave Estrangeira (publico_alvo)         |

## Tabela 'publico_alvo'

Armazena os diferentes públicos-alvo que os usuários podem se interessar.

| Campo       | Tipo     | Descrição                |
|-------------|----------|--------------------------|
| id          | INTEGER  | Chave Primária           |
| publico_alvo| VARCHAR  | Nome do público-alvo     |

## Tabela 'feed_e_publico_alvo'

Associa posts específicos a públicos-alvo específicos.

| Campo          | Tipo     | Descrição                                |
|----------------|----------|------------------------------------------|
| id             | INTEGER  | Chave Primária                           |
| id_feed        | INTEGER  | Chave Estrangeira (feed)                 |
| id_publico_alvo| INTEGER  | Chave Estrangeira (publico_alvo)         |



----
## Explicação das relações entre tabelas
### Tabela 'usuários' e 'feed' (1:N):

Um usuário pode ter vários posts, mas um post pertence a apenas um usuário. Portanto, a relação entre a tabela 'usuários' e 'feed' é de um para muitos (1:N).

### Tabela 'usuários' e 'usuarios-e-publico-alvo' (1:N):

Um usuário pode se interessar por vários públicos-alvo, e um público-alvo pode ser de interesse de vários usuários. Portanto, a relação entre a tabela 'usuários' e 'usuarios-e-publico-alvo' também é de um para muitos (1:N).

### Tabela 'feed' e 'feed_e_publico_alvo' (1:N):

Um post pode estar associado a vários públicos-alvo, e um público-alvo pode estar associado a vários posts. Portanto, a relação entre a tabela 'feed' e 'feed_e_publico_alvo' também é de um para muitos (1:N).
