-- Excluindo banco de dados
drop database dbManicure;
-- Cria banco de dados 
create database dbManicure;
-- Ver banco
show databases;
-- Entra/usar banco de dados
use dbManicure;
-- Criar tabela
create table tbProdutos(
idProd int,
descricao varchar(100),
quantProd decimal(9,2),
dataEntrada date,
valorUnit decimal(9,2)
);
-- Ver tabelas
show tables;
-- Ver estrutura da tabela
desc tbProdutos;

-- Inserir registro na tabela
insert into tbProdutos(idProd,descricao,quantProd,dataEntrada,valorUnit) values(1,'Alicate de unha',10,'2023/08/01',5.50);
insert into tbProdutos(idProd,descricao,quantProd,dataEntrada,valorUnit) values(2,'Algodão',100,'2023/07/31',2.53);
insert into tbProdutos(idProd,descricao,quantProd,dataEntrada,valorUnit) values(3,'Esmalte',25,'2023/08/01',15.00);
insert into tbProdutos(idProd,descricao,quantProd,dataEntrada,valorUnit) values(4,'Acetona',35,'2023/07/30',3.50);
insert into tbProdutos(idProd,descricao,quantProd,dataEntrada,valorUnit) values(5,'Unha postiça',50,'2023/07/25',9.99);

insert into tbProdutos(idProd,descricao,quantProd,dataEntrada,valorUnit) values(6,'Unha',50,'2023/07/25',9.99);
insert into tbProdutos(idProd,descricao,quantProd,dataEntrada,valorUnit) values(7,'postiça',50,'2023/07/25',9.99);
-- Visualizar os registros inseridos
select * from tbProdutos;

-- Alterar registro das tabelas
update tbProdutos set descricao = 'Palito de unha', valorUnit = 1.35, quantProd = 40 where idProd = 6;
update tbProdutos set descricao = 'Mascara de proteção', valorUnit = 4.50, quantProd = 15 where idProd = 7;
-- Visualizar os registros alterados
select * from tbProdutos;

-- Apagar registro das tabelas
delete from tbProdutos where idProd = 7;
-- Visualizar os registros apagados
select * from tbProdutos;