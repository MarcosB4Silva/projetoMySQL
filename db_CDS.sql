-- nome: Marcos Barros silva

drop database dbCDS;
create database dbCDS;

show databases;
use dbCDS;


create table tbArtistas(
codArt int not null auto_increment,
nomeArt varchar(100) not null unique,
primary key (codArt)
);

create table tbGravadoras(
codGrav int not null auto_increment,
nomeGrav varchar(50) not null unique,
primary key (codGrav)
);

create table tbCategoria(
codCat int not null auto_increment,
nomeCat varchar(50) not null unique,
primary key(codCat)
);

create table tbEstados(
siglaEst char(2) not null,
nomeEst varchar(50) not null unique,
primary key(siglaEst)
);

-- ver tabelas sem estrangerios 
desc tbArtistas;
desc tbGravadoras;
desc tbCategoria;
desc tbEstados;

create table tbCidades(
codCid int not null auto_increment,
siglaEst char(2) not null,
nomeCid varchar(50) not null,
primary key(codCid),
foreign key(siglaEst) references tbEstados(siglaEst) 
);

create table tbClientes(
codCli int not null auto_increment,
codCid int not null,
nomeCli varchar(50) not null,
endCli varchar(100) not null,
rendaCli decimal(9,2) not null default 0 check(rendaCli>=0),
sexoCli char(1) not null default 'F' check(sexoCli in('F','M')),
primary key(codCli),
foreign key(codCid) references tbCidades(codCid)
);

create table tbConjuge(
codConj int not null auto_increment,
codCli int not null,
nomeConj varchar(50) not null,
rendaConj decimal(9,2) not null default 0 check(rendaConj >= 0),
sexoConj char(1) not null default 'F' check(sexoConj in('F','M')),
primary key(codConj),
foreign key(codCli) references tbClientes(codCli)
);

create table tbFuncionarios(
codFunc int not null auto_increment,
nomeFunc varchar(50) not null,
endFunc varchar(100) not null,
salFunc decimal(9,2) not null default 0 check(salFunc>=0),
sexoFunc char(1) default 'F' check(sexoFunc in('F','M')),
primary key(codFunc)
);

create table tbDependentes(
codDep int not null auto_increment,
codFunc int not null,
nomeDep varchar(100) not null,
sexoDep char(1) default 'F' check(sexoDep in('F','M')),
primary key(codDep),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbTitulos(
codTit int not null auto_increment,
codCat int not null,
codGrav int not null,
nomeCD varchar(50) not null unique,
valCD decimal(9,2) not null check(valCD>=0),
qtdEstq int not null check(qtdEstq>=0),
primary key(codTit),
foreign key(codCat) references tbCategoria(codCat),
foreign key(codGrav) references tbGravadoras(codGrav)
);

create table tbPedidos(
numPed int not null auto_increment,
codCli int not null,
codFunc int not null,
dataPed datetime not null,
valPed decimal(9,2) not null default 0 check(valPed>=0),
primary key(numPed),
foreign key(codCli) references tbClientes(codCli),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbTitulosPedidos(
numPed int not null,
codTit int not null,
qtdCD int not null check(qtdCD>=0),
valCD decimal(9,2) check(valCD>=0),
foreign key (numPed) references tbPedidos(numPed),
foreign key (codTit) references tbTitulos(codTit)
);

create table tbTitulosArtista(
codTit int not null,
codArt int not null,
foreign key(codTit) references tbTitulos(codTit),
foreign key(codArt) references tbArtistas(codArt)
);


insert into tbArtistas(nomeArt) values ('MARISA MONTE');
insert into tbArtistas(nomeArt) values ('GILBERTO GIL');
insert into tbArtistas(nomeArt) values ('CAETANO VELOSO');
insert into tbArtistas(nomeArt) values ('MILTON NASCIMENTO');
insert into tbArtistas(nomeArt) values ('LEGIÃO URBANA');
insert into tbArtistas(nomeArt) values ('THE BEATLES');
insert into tbArtistas(nomeArt) values ('RITA LEE');
-- ver artistas
select * from tbArtistas order by codArt;

insert into tbGravadoras(nomeGrav) values ('POLYGRAM');
insert into tbGravadoras(nomeGrav) values ('EMI');
insert into tbGravadoras(nomeGrav) values ('SOM LIVRE');
insert into tbGravadoras(nomeGrav) values ('SOM MUSIC');
-- ver gravadoras
select * from tbGravadoras order by codGrav;

insert into tbCategoria(nomeCat) values ('MPB');
insert into tbCategoria(nomeCat) values ('TRILHA SONORA');
insert into tbCategoria(nomeCat) values ('ROCK INTERNACIONAL');
insert into tbCategoria(nomeCat) values ('ROCK NACIONAL');
-- ver categorias
select * from tbCategoria order by codCat;

insert into tbEstados(siglaEst,nomeEst) values ('SP','SÃO PAULO');
insert into tbEstados(siglaEst,nomeEst) values ('MG','MINAS GERAIS');
insert into tbEstados(siglaEst,nomeEst) values ('RJ','RIO DE JANEIRO');
insert into tbEstados(siglaEst,nomeEst) values ('ES', 'ESPIRITO SANTO');
-- ver estados
select * from tbEstados;

insert into tbCidades(siglaEst,nomeCid) values ('SP','SÃO PAULO');
insert into tbCidades(siglaEst,nomeCid) values ('SP','SOROCABA');
insert into tbCidades(siglaEst,nomeCid) values ('SP','JUNDIAÍ');
insert into tbCidades(siglaEst,nomeCid) values ('SP','AMERICANA');
insert into tbCidades(siglaEst,nomeCid) values ('SP','ARARAQUARA');
insert into tbCidades(siglaEst,nomeCid) values ('MG','OURO PRETO');
insert into tbCidades(siglaEst,nomeCid) values ('ES','CACHOEIRA DO ITAPEMIRIM');
-- ver cidades
select * from tbCidades order by codCid;

insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli) values (1,'JOSÉ NOGUEIRA','RUA A', 1500.00,'M');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli) values (1,'ÂNGELO PEREIRA','RUA B', 2000.00,'M');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli) values (1,'','RUA C', ,'M');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli) values (1,'','RUA D', ,'F');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli) values (1,'','RUA E', ,'M');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli) values (2,'','RUA F', ,'M');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli) values (2,'','RUA G', ,'F');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli) values (2,'','RUA H', ,'M');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli) values (3,'','RUA I', ,'F');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli) values (3,'','RUA J', ,'M');
	