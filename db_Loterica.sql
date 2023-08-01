-- Apagar db
drop database dbLoterica;
-- Criar db
create database dbLoterica;
-- Ver
show databases;
-- Usar/entrar
use dbLoterica;
-- Criar tb
create table tbJogos(
    idJogo int,
    nomeJogo varchar(100),
    valor decimal(9,2),
    data date
);
-- ver tb
show tables;
desc tbJogos;

-- Inserir
insert into tbJogos(idJogo,nomeJogo,valor,data) values(1,'+Milionária',5.00,'2023/08/01');
insert into tbJogos(idJogo,nomeJogo,valor,data) values(2,'Mega-Sena',15.00,'2023/06/12');
insert into tbJogos(idJogo,nomeJogo,valor,data) values(3,'Virada da Mega',544.45,'2022/11/01');
insert into tbJogos(idJogo,nomeJogo,valor,data) values(4,'Quina',9.50,'2022/12/26');
insert into tbJogos(idJogo,nomeJogo,valor,data) values(5,'Rapadinha',6.00,'2023/05/15');
insert into tbJogos(idJogo,nomeJogo,valor,data) values(6,'Dia de sorte',12.00,'2023/08/01');
insert into tbJogos(idJogo,nomeJogo,valor,data) values(7,'Super Sete',12.50,'2018/08/19');
insert into tbJogos(idJogo,nomeJogo,valor,data) values(8,'Bingo',2.50,'2010/08/12');
insert into tbJogos(idJogo,nomeJogo,valor,data) values(9,'Jogo do Bicho',5.00,'2020/07/30');
insert into tbJogos(idJogo,nomeJogo,valor,data) values(10,'Truco',5.00,'2023/06/11');
-- Ver inseridos
select * from tbJogos;

-- Alterar
update tbJogos set nomeJogo = 'Mega da Virada', valor = 4.50  where idJogo = 3;
update tbJogos set valor = 7.00, data = '2007/07/07' where idJogo = 7;
-- Ver Aleterados
select * from tbJogos;

-- Deletar
delete from tbJogos where idJogo = 8;
delete from tbJogos where idJogo = 9;
delete from tbJogos where idJogo = 10;
-- Ver deletados
select * from tbJogos;