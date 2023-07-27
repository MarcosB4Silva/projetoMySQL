-- nome: Marcos Barros Silva

-- Excluir se ja existir 
drop database dbEscola;
-- Criar banco
create database dbEscola;
-- Entrar 
use dbEscola;
-- Ver banco
show databases;
-- Criar tabelas
create table tbAtividade(
idAtividade int,
atividade varchar(45)
);
create table tbTurma(
quantAluno int,
horaAula datetime,
duracaoAula datetime,
dataInicio date,
dataFim date,
atividade int,
idInstruto int,
idMonitor int
);
create table tbRegistro(
idAluno int,
idTurma int,
ausencia int,
idRegistro int
);
create table tbAluno(
matricula int,
dataMatricula date,
nome varchar(45),
endereco varchar(45),
telefone varchar(45),
nascimento varchar(45),
altura float,
peso float,
idTurma int
);
create table tbInstrutor(
rg int,
nome varchar(45),
nascimento date,
tirulacao varchar(45),
telefone varchar(45)
);
create table tbMonitor(
idAluno int
);
-- Ver tabelas
desc tbAtividade;
desc tbAluno;
desc tbTurma;
desc tbRegistro;
desc tbMonitor;
desc tbInstrutor;