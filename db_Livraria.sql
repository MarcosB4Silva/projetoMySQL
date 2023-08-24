-- Nome: Marcos Barros Silva

-- excluir, visualizar, ver e entrar
drop database DB_Livraria;
create database db_Livraria;
show databases;
use DB_Livraria;

-- tabelas
create table tbAutor(
idAutor int not null auto_increment,
nomeAutor varchar(100) not null,
email varchar(100) not null,
primary key(idAutor)
);

create table tbGenero(
idGene int not null auto_increment,
descricao varchar(100) not null,
primary key(idGene)
);

create table tbCliente(
idCli int not null auto_increment,
nomeCli varchar(100) not null,
telefone char(13)not null,
primary key(idCli)
);

create table tbLivros(
idLivro int not null auto_increment,
idGene int not null,
titulo varchar(100) not null,
preco decimal(9,2) default 0 check(preco >= 0),
estoque int default 0 check(estoque >= 0),
primary key(idLivro),
foreign key(idGene) references tbGenero(idGene) 
);

create table tbVenda(
idVenda int not null auto_increment,
dtVenda date not null,
total decimal(9,2),
idCli int not null,
primary key(idVenda),
foreign key (idCli) references tbCliente(idCli)
);

create table tbIntensDaVenda(
idVenda int not null,
idLivro int not null,
qtd decimal(9,2) not null,
subtotal decimal(9,2) default 0 check(subtotal >= 0),
foreign key(idVenda) references tbVenda(idVenda),
foreign key(idLivro) references tbLivros(idLivro)
);

create table tbEscreve(
idLivro int not null,
idAutor int not null,
foreign key(idLivro) references tbLivros(idLivro),
foreign key(idAutor) references tbAutor(idAutor)
);
-- ver tabelas
desc tbAutor;
desc tbGenero;
desc tbCliente;
desc tbLivros;
desc tbVenda;
desc tbIntensDaVenda;
desc tbEscreve;


-- inserts

insert into tbGenero(descricao) values ('AÇÃO');
insert into tbGenero(descricao) values ('FANTASIA');
insert into tbGenero(descricao) values ('AVENTURA');
insert into tbGenero(descricao) values ('COMÉDIA');
insert into tbGenero(descricao) values ('MITOLOGIA GREGA');
insert into tbGenero(descricao) values ('ROMANCE');
insert into tbGenero(descricao) values ('FICÇÃO POLICIAL');
insert into tbGenero(descricao) values ('POESIA');
insert into tbGenero(descricao) values ('DIDATICO');
insert into tbGenero(descricao) values ('BIBLICO');

select * from tbGenero order by idGene;

insert into tbAutor(nomeAutor,email) values ('Rick Riordan', 'RickRiordan69@gmail.com');
insert into tbAutor(nomeAutor,email) values('J.K. Rowling','JK@gmail.com');
insert into tbAutor(nomeAutor,email) values('Koyoharu Gotouge','KG55@gmail.com');
insert into tbAutor(nomeAutor,email) values('Akira Toriyama','vegetto@gmail.com');
insert into tbAutor(nomeAutor,email) values('Yoshihiro Togashi','dragonquest@gmail.com');
insert into tbAutor(nomeAutor,email) values('Platão','Olhaoshapedopai@gmail.com');
insert into tbAutor(nomeAutor,email) values('Socrates','AlbertCM@gmail.com');
insert into tbAutor(nomeAutor,email) values('Jo Nesbo','JN@05gmail.com');
insert into tbAutor(nomeAutor,email) values('Machado de Assis','AssisMachado@gmail.com');
insert into tbAutor(nomeAutor,email) values('Castelo Branco','CasteloB@gmail.com');

select * from tbAutor order by idAutor;

insert into tbCliente(nomeCli,telefone) values('Allan Bida','11 97878-9999');
insert into tbCliente(nomeCli,telefone) values('Marco Polo','11 98888-6565');
insert into tbCliente(nomeCli,telefone) values('Ryan Braga','11 99899-6565');
insert into tbCliente(nomeCli,telefone) values('Jhefferson Almeida','11 99799-6365');
insert into tbCliente(nomeCli,telefone) values('Rodrigo ','11 99699-6365');
insert into tbCliente(nomeCli,telefone) values('Rodrygo Goes','11 99499-6365');
insert into tbCliente(nomeCli,telefone) values('Isabela Rocha','11 99299-6364');
insert into tbCliente(nomeCli,telefone) values('Gabriel Vini','11 99199-6564');
insert into tbCliente(nomeCli,telefone) values('Keferso Jhony','11 99099-6564');
insert into tbCliente(nomeCli,telefone) values('Carlos Eduardo','11 99399-6564');

select * from tbCliente order by idCli;

insert into tbLivros(titulo,preco,estoque,idGene) values ('Harry Potter I', 45.00,250,2);
insert into tbLivros(titulo,preco,estoque,idGene) values ('Harry Potter II', 50.00,200,2);
insert into tbLivros(titulo,preco,estoque,idGene) values ('Harry Potter III', 50.00,150,2);
insert into tbLivros(titulo,preco,estoque,idGene) values ('Harry Potter IV', 65.00,35,2);
insert into tbLivros(titulo,preco,estoque,idGene) values ('Harry Potter V', 40.00,23,2);
insert into tbLivros(titulo,preco,estoque,idGene) values ('P.J O Ladrão de Raios', 15.00, 30,2);
insert into tbLivros(titulo,preco,estoque,idGene) values ('P.J O Mar de Monstros', 29.30, 5,2);
insert into tbLivros(titulo,preco,estoque,idGene) values ('P.J A Maldição do Titã', 27.90, 23,2);
insert into tbLivros(titulo,preco,estoque,idGene) values ('P.J A Batalha do Labirinto', 18.60, 14,2);
insert into tbLivros(titulo,preco,estoque,idGene) values ('Dragon Ball Z', 24.90,100,2);

select * from tbLivros order by idLivro;

insert into tbVenda(dtVenda,total,idCli) values('2023-30-06', 15.00, 1);
insert into tbVenda(dtVenda,total,idCli) values('2023-12-02', 24.90,2);
insert into tbVenda(dtVenda,total,idCli) values('2023-19-09', 50.00,7);
insert into tbVenda(dtVenda,total,idCli) values('2023-31-10', 277.90,9);
insert into tbVenda(dtVenda,total,idCli) values('2023-25-11', 18.60,6);
insert into tbVenda(dtVenda,total,idCli) values('2023-20-08', 45.00,3);
insert into tbVenda(dtVenda,total,idCli) values('2023-11-06', 65.00,10);
insert into tbVenda(dtVenda,total,idCli) values('2023-05-07', 715.00,4); 
insert into tbVenda(dtVenda,total,idCli) values('2023-05-06', 24.90,2);
insert into tbVenda(dtVenda,total,idCli) values('2023-10-02', 29.30,5); 

select * from tbVenda order by idVenda;

insert into tbIntensDaVenda(idVenda,idLivro,qtd,subtotal) values ( 1, 6, 2, 30.00);
insert into tbIntensDaVenda(idVenda,idLivro,qtd,subtotal) values ( 2, 10, 1, 24.90);
insert into tbIntensDaVenda(idVenda,idLivro,qtd,subtotal) values ( 3, 2, 3, 150.00);
insert into tbIntensDaVenda(idVenda,idLivro,qtd,subtotal) values ( 4, 8, 1, 27.90);
insert into tbIntensDaVenda(idVenda,idLivro,qtd,subtotal) values ( 5, 2, 1, 18.60);
insert into tbIntensDaVenda(idVenda,idLivro,qtd,subtotal) values ( 6, 1, 2, 90.00);
insert into tbIntensDaVenda(idVenda,idLivro,qtd,subtotal) values ( 7, 4, 4, 260.00);
insert into tbIntensDaVenda(idVenda,idLivro,qtd,subtotal) values ( 8, 6, 2, 30.00);
insert into tbIntensDaVenda(idVenda,idLivro,qtd,subtotal) values ( 9, 10, 1, 24.90);
insert into tbIntensDaVenda(idVenda,idLivro,qtd,subtotal) values ( 10, 7, 1, 29.30);

select * from tbIntensDaVenda order by idVenda;

insert into tbEscreve(idLivro,idAutor) values( 1, 2);
insert into tbEscreve(idLivro,idAutor) values( 2, 2);
insert into tbEscreve(idLivro,idAutor) values( 3, 2);
insert into tbEscreve(idLivro,idAutor) values( 4, 2);
insert into tbEscreve(idLivro,idAutor) values( 5, 2);
insert into tbEscreve(idLivro,idAutor) values( 6, 1);
insert into tbEscreve(idLivro,idAutor) values( 7, 1);
insert into tbEscreve(idLivro,idAutor) values( 8, 1);
insert into tbEscreve(idLivro,idAutor) values( 9, 1);
insert into tbEscreve(idLivro,idAutor) values( 10, 4);

select * from tbEscreve order by idLivro;


-- delete from tbGenero

-- updates
-- autor
update tbAutor set nomeAutor = 'Camilo Castelo Branco' where idAutor = 10;
update tbAutor set email = 'RespiraçãoDoEscritor@gmail.com' where idAutor = 3;
update tbAutor set email = 'Platão428A.C@gmail.com' where idAutor = 6;
update tbAutor set nomeAutor = 'Albert Camus' where idAutor = 7;
update tbAutor set email = 'MachadiA@gmail.com' where idAutor = 8;
	select * from tbAutor;

-- genero


-- cliente
update tbCliente set nomeCli = 'Albedo Cunha' where idCli = 1;
update tbCliente set nomeCli = 'Jorge da Silva' where idCli = 5;
update tbCliente set nomeCli = 'Algustinho Mendes' where idCli = 6;
update tbCliente set telefone = '11 94388-4561' where idCli = 10;
update tbCliente set telefone = '11 99368-7562' where idCli = 8;
	select * from tbCliente;

-- livro
update tbLivros set titulo = 'O boneco de neve' where idLivro = 2;
update tbLivros set titulo = 'Animais fantasticos e onde abitam' where idLivro = 4;
update tbLivros set idGene = 7 where idLivro = 2;
update tbLivros set estoque = 12 where idLivro = 4;
update tbLivros set estoque = 55 where idLivro = 10;
	select * from tbLivros;

-- venda
update tbVenda set idCli = 6 where idvenda = 1;
update tbVenda set idCli = 8 where idvenda = 7;
update tbVenda set dtVenda = '2023-05-05' where idvenda = 10;
update tbVenda set total = 27.90 where idvenda = 4;
update tbVenda set total = 15.00 where idvenda = 8;
	select * from tbVenda order by idVenda;


-- itens_da_venda
update tbIntensDaVenda set qtd = 5 where idVenda = 10;
update tbIntensDaVenda set qtd = 2 where idVenda = 9;
update tbIntensDaVenda set subtotal = 146.50 where idVenda = 10;
update tbIntensDaVenda set subtotal = 49.80 where idVenda = 9;
update tbIntensDaVenda set idLivro = 9 where idVenda = 5;
	select * from tbIntensDaVenda order by idVenda;

-- escreve


delete from tbAutor where idAutor = 6;
delete from tbAutor where idAutor = 7;
delete from tbAutor where idAutor = 8;
delete from tbAutor where idAutor = 9;
delete from tbAutor where idAutor = 10;
	select * from tbAutor;

delete from tbGenero where idGene = 6;
delete from tbGenero where idGene = 7;
delete from tbGenero where idGene = 8;
delete from tbGenero where idGene = 9;
delete from tbGenero where idGene = 10;

delete from tbCliente where idCli = 6;
delete from tbCliente where idCli = 7;
delete from tbCliente where idCli = 8;
delete from tbCliente where idCli = 9;
delete from tbCliente where idCli = 10;

