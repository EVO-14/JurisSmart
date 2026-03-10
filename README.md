# JurisSmart

Sistema web desenvolvido em **JSP + AJAX + MySQL** para gerenciamento de registros com operações **CRUD (Create, Read, Update, Delete)**.

O projeto simula um pequeno **sistema administrativo**, permitindo autenticação de usuários e gerenciamento de cadastros através de uma interface web simples e dinâmica.

---

# Tecnologias utilizadas

Este projeto foi desenvolvido utilizando as seguintes tecnologias:

- Java (JSP)
- AJAX
- JavaScript
- jQuery
- Bootstrap
- MySQL
- Apache Tomcat
- HTML5
- CSS3

---

# Funcionalidades

O sistema possui funcionalidades básicas de um painel administrativo.

## Autenticação

- Login de usuário
- Validação de credenciais no banco de dados
- Redirecionamento para área administrativa

---

## Cadastro de Usuários

- Inserir novos usuários
- Listar usuários cadastrados
- Excluir usuários
- Upload de imagem de perfil

---

## Cadastro de Pessoas

- Inserir novos registros
- Listar registros cadastrados
- Excluir registros

---

## Operações com AJAX

As operações de cadastro e listagem utilizam **AJAX**, permitindo atualizar os dados da página **sem recarregar o sistema inteiro**, tornando a experiência mais dinâmica.

---

# Banco de dados

O banco de dados utilizado é **MySQL**.

O script de criação está disponível em:


## Passos para configuração

1. Criar um banco de dados no MySQL
2. Importar o arquivo SQL disponível na pasta `database`

Exemplo:

```sql
source bd_juris.sql;
