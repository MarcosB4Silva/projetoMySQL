-- Marcos Barros Silva

-- Apagar se ja exitir
drop database dbClinicaMedica;
-- Cria banco de dados
create database dbClinicaMedica;
-- Entrar no banco de dados
use dbClinicaMedica;
-- Visualizar banco
show databases;
-- Criar tabelas
create table tbMedicos(
idMedico int,
nomeMedico varchar(45),
telefone varchar(9)
);
create table tbConsulta(
idConsulta int,
dataConsulta datetime,
idMedico int,
idPaciente int,
idReceita int
);
create table tbPaciente(
idPaciente int,
nomePaciente varchar(45),
telefone varchar(9),
covenio varchar(45)
);
create table tbReceita(
idReceita int,
descricao varchar(500)
);
-- Visualizar tabelas
desc tbMedicos;
desc tbConsulta;
desc tbPaciente;
desc tbReceita;