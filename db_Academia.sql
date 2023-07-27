-- Apagando o banco de dados
drop database dbAcademia;
-- Criando banco de dados
create database dbAcademia;
-- Acessando banco de dados
use dbAcademia;
-- Visualizar o banco de dados
show databases;
-- Criando tabelas
create table tbUsuarios(
codigo int,
nome varchar(50),
senha varchar(50)
);
create table tbFuncionarios(
codigo int,
nome varchar(100),
email varchar(100),
cpf char(14)
);
create table tbTelefone(
codigo int,
nome varchar(50),
telefone char(15)
);
-- Visualizar tabelas criadas
show tables;
-- Visualizar estrutura da tabela
desc tbUsuarios;
desc tbFuncionarios;
desc tbTelefone;