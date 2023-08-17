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
dataPed date not null,
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
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli) values (1,'ALÉM MAR PARANHOS','RUA C', 1500.00,'M');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli) values (1,'CATARINA SOUZA','RUA D', 892.00,'F');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli) values (1,'VAGNER COSTA ','RUA E', 950.00,'M');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli) values (2,'ANTENOR DA COSTA','RUA F', 1582.00,'M');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli) values (2,'MARIA AMÉLIA DE SOUZA','RUA G', 1152.00,'F');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli) values (2,'PAULO ROBERTO SILVA','RUA H', 3250.00,'M');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli) values (3,'FÁTIMA SOUZA','RUA I', 1632.00,'F');
insert into tbClientes(codCid,nomeCli,endCli,rendaCli,sexoCli) values (3,'JOEL DA ROCHA','RUA J', 2000.00,'M');
-- ver cidades
select * from tbclientes;

insert into tbConjuge(codCli,nomeConj,rendaConj,sexoConj) values (1,'CARLA NOGUEIRA',2500.00,'F');
insert into tbConjuge(codCli,nomeConj,rendaConj,sexoConj) values (2,'EMILIA PEREIRA', 5500.00,'F');
insert into tbConjuge(codCli,nomeConj,rendaConj,sexoConj) values (3,'ALTIVA DA COSTA', 3000.00,'F');
insert into tbConjuge(codCli,nomeConj,rendaConj,sexoConj) values (7,'CARLOS DE SOUZA',3250.00,'M');
-- ver conjuge
select * from tbConjuge order by codCli;

insert into tbFuncionarios(nomeFunc,endFunc,salFunc,sexoFunc) values ('VÂNIA GABRIELA PEREIRA','RUA A',2500.00,'F');
insert into tbFuncionarios(nomeFunc,endFunc,salFunc,sexoFunc) values ('NORBERTO PEREIRA DA SILVA','RUA B',300.00,'M');
insert into tbFuncionarios(nomeFunc,endFunc,salFunc,sexoFunc) values ('OLAVO LINHARES','RUA C',580.00,'M');
insert into tbFuncionarios(nomeFunc,endFunc,salFunc,sexoFunc) values ('PAULA DA SILVA','RUA D',3000.00,'F');
insert into tbFuncionarios(nomeFunc,endFunc,salFunc,sexoFunc) values ('ROLANDO ROCHA','RUA E',2000.00,'M');
insert into tbFuncionarios(nomeFunc,endFunc,salFunc,sexoFunc) values ('JHEFF SANTANA','RUA F',2250.00,'M');
insert into tbFuncionarios(nomeFunc,endFunc,salFunc,sexoFunc) values ('MARCOS BARROS','RUA G',750.00,'M');
-- ver funcionarios
select * from tbFuncionarios order by codFunc;

insert into tbDependentes(codFunc,nomeDep,sexoDep) values (1,'ANA PEREIRA','F');
insert into tbDependentes(codFunc,nomeDep,sexoDep) values (1,'ROBERTO PEREIRA','M');
insert into tbDependentes(codFunc,nomeDep,sexoDep) values (1,'CELSO PEREIRA','M');
insert into tbDependentes(codFunc,nomeDep,sexoDep) values (3,'BRISA LINHARES','F');
insert into tbDependentes(codFunc,nomeDep,sexoDep) values (3,'MARI SOL LINHARES','F');
insert into tbDependentes(codFunc,nomeDep,sexoDep) values (4,'SONIA DA SILVA','F');
-- ver dependentes 
select * from tbDependentes order by codDep;

insert into tbTitulos(codCat,codGrav,nomeCD,valCD,qtdEstq) values(1,1,'TRIBALISTAS',30.00,1500);
insert into tbTitulos(codCat,codGrav,nomeCD,valCD,qtdEstq) values(1,2,'TROPICÁLIA',50.00,500);
insert into tbTitulos(codCat,codGrav,nomeCD,valCD,qtdEstq) values(1,1,'AQUELE ABRAÇO',50.00,600);
insert into tbTitulos(codCat,codGrav,nomeCD,valCD,qtdEstq) values(1,2,'REFAZENDA',60.00,1000);
insert into tbTitulos(codCat,codGrav,nomeCD,valCD,qtdEstq) values(1,3,'TOTALMENTE DEMAIS',50.00,2000);
insert into tbTitulos(codCat,codGrav,nomeCD,valCD,qtdEstq) values(1,3,'TRAVESSIA',55.00,500);
insert into tbTitulos(codCat,codGrav,nomeCD,valCD,qtdEstq) values(1,2,'COURAGE',30.00,200);
insert into tbTitulos(codCat,codGrav,nomeCD,valCD,qtdEstq) values(4,3,'LEGIÃO URBANA',20,100);
insert into tbTitulos(codCat,codGrav,nomeCD,valCD,qtdEstq) values(3,2,'THE BEATLES',30.00,300);
insert into tbTitulos(codCat,codGrav,nomeCD,valCD,qtdEstq) values(4,1,'RITA LEE',30.00,500);
-- ver titulos
select * from tbTitulos order by codTit;

insert into tbPedidos(codCli,codFunc,dataPed,valPed) values (1,2,'02-05-02',1500.00);
insert into tbPedidos(codCli,codFunc,dataPed,valPed) values (3,4,'02-05-02',50.00);
insert into tbPedidos(codCli,codFunc,dataPed,valPed) values (4,7,'02-06-02',100.00);
insert into tbPedidos(codCli,codFunc,dataPed,valPed) values (1,4,'02-02-03',200.00);
insert into tbPedidos(codCli,codFunc,dataPed,valPed) values (7,5,'02-03-03',300.00);
insert into tbPedidos(codCli,codFunc,dataPed,valPed) values (4,4,'02-03-03',100.00);
insert into tbPedidos(codCli,codFunc,dataPed,valPed) values (5,5,'02-03-03',50.00);
insert into tbPedidos(codCli,codFunc,dataPed,valPed) values (8,2,'02-03-03',50.00);
insert into tbPedidos(codCli,codFunc,dataPed,valPed) values (2,2,'02-03-03',2000.00);
insert into tbPedidos(codCli,codFunc,dataPed,valPed) values (7,1,'02-03-03',3000.00);
-- ver pedidos
select * from tbPedidos order by numPed;

insert into tbTitulosArtista(codTit,codArt) values (1,1);
insert into tbTitulosArtista(codTit,codArt) values (2,2);
insert into tbTitulosArtista(codTit,codArt) values (3,2);
insert into tbTitulosArtista(codTit,codArt) values (4,2);
insert into tbTitulosArtista(codTit,codArt) values (5,3);
insert into tbTitulosArtista(codTit,codArt) values (6,4);
insert into tbTitulosArtista(codTit,codArt) values (7,4);
insert into tbTitulosArtista(codTit,codArt) values (8,5);
insert into tbTitulosArtista(codTit,codArt) values (9,6);
insert into tbTitulosArtista(codTit,codArt) values (10,7);
-- ver titulos dos artistas
select * from tbTitulosArtista order by codTit;

insert into tbTitulosPedidos(numPed,codTit,qtdCD,valCD) values(1,1,2,30.00);
insert into tbTitulosPedidos(numPed,codTit,qtdCD,valCD) values(1,2,3,20.00);
insert into tbTitulosPedidos(numPed,codTit,qtdCD,valCD) values(2,1,1,50.00);
insert into tbTitulosPedidos(numPed,codTit,qtdCD,valCD) values(2,2,3,30.00);
insert into tbTitulosPedidos(numPed,codTit,qtdCD,valCD) values(3,1,2,40.00);
insert into tbTitulosPedidos(numPed,codTit,qtdCD,valCD) values(4,2,3,20.00);
insert into tbTitulosPedidos(numPed,codTit,qtdCD,valCD) values(5,1,2,25.00);
insert into tbTitulosPedidos(numPed,codTit,qtdCD,valCD) values(6,2,3,30.00);
insert into tbTitulosPedidos(numPed,codTit,qtdCD,valCD) values(6,3,1,35.00);
insert into tbTitulosPedidos(numPed,codTit,qtdCD,valCD) values(7,4,2,55.00);
insert into tbTitulosPedidos(numPed,codTit,qtdCD,valCD) values(8,1,4,60.00);
insert into tbTitulosPedidos(numPed,codTit,qtdCD,valCD) values(9,2,3,15.00);
insert into tbTitulosPedidos(numPed,codTit,qtdCD,valCD) values(10,7,2,15.00);
-- ver titulos pedidos
select * from tbTitulosPedidos order by numPed;