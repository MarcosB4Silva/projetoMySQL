drop database dbMercadosSA;
create database dbMercadosSA;

show databases;
use dbMercadosSA;

create table tbFuncionarios(
idFunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
cpf char(14) not null unique,
salario decimal(9,2) default 0 check(salario >= 0),
sexo char(1) default 'F' check(sexo in('F','M')),
primary key(idFunc)
);

create table tbClientes(
idCli int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telCel char(10),
primary key(idCli)
);

create table tbFornecedores(
idForn int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
cnpj char(18) unique,
primary key(idForn)
);

create table tbUsuarios(
idUser int not null auto_increment,
nome varchar(50) not null,
senha varchar(50) not null,
idFunc int not null,
primary key(idUser),
foreign key(idFunc) references tbFuncionarios(idFunc)
);


create table tbProdutos(
idProd int not null auto_increment,
descricao varchar(100) not null,
dtEntrada date,
hrEntrada time,
quantidade decimal(9,2),
valorUnit decimal(9,2),
idForn int not null,
primary key(idProd),
foreign key(idForn) references tbFornecedores(idForn)
);

create table tbVendas(
idVenda int not null auto_increment,
idUser int not null,
idProd int not null,
idCli int not null,
dtVenda date,
quantidade decimal(9,2),
valorTotal decimal(9,2),
primary key(idVenda),
foreign key(idUser) references tbUsuarios(idUser),
foreign key(idProd) references tbProdutos(idProd),
foreign key(idCli) references tbClientes(idCli)
);

desc tbFuncionarios;
desc tbClientes;
desc tbFornecedores;
desc tbUsuarios;
desc tbProdutos;
desc tbVendas;

-- inserir registros nas tabelas

insert into tbFuncionarios(nome, email, cpf, salario, sexo) values ('Jeff lendario socrivel','jeff231@gmail.com',44455566611, 2500.00,'M');
insert into tbClientes(nome,email,telCel) values ('Mauricio','maumau777@gmail.com','98888-6666');
insert into tbClientes(nome,email,telCel) values ('S1mple','sashaTop1@gmail.com','98778-3333');
insert into tbFornecedores(nome,email,cnpj) values('BK','McMenorQueBK@gmail.com','95.555.444/2323-69');
insert into tbFornecedores(nome,email,cnpj) values('loud','fazoL@gmail.com','31.777.434/2323-69');
insert into tbUsuarios(nome,senha,idFunc) values ('Jeff lendario socrivel','porta',1);
insert into tbProdutos(descricao,dtEntrada,hrEntrada,quantidade,valorUnit,idForn) values ('refri','2023/08/11','12:06:55',2,15.2,1);
insert into tbProdutos(descricao,dtEntrada,hrEntrada,quantidade,valorUnit,idForn) values ('batata','2023/08/11','12:06:55',17,7.50,1);
insert into tbProdutos(descricao,dtEntrada,hrEntrada,quantidade,valorUnit,idForn) values ('Aspas','2023/09/05','12:00:00',1,500000.00,2);
insert into tbVendas(idUser,idProd,idCli,dtVenda,quantidade,valorTotal) values (1,1,2,'2023/08/10',10,152.00);
insert into tbVendas(idUser,idProd,idCli,dtVenda,quantidade,valorTotal) values (1,3,2,'2023/08/10',1,500000.0);
insert into tbVendas(idUser,idProd,idCli,dtVenda,quantidade,valorTotal) values (1,1,1,'2023/08/10',10,152.00);

select * from tbFuncionarios;
select * from tbClientes;
select * from tbFornecedores;
select * from tbUsuarios;
select * from tbProdutos;
select * from tbVendas;
