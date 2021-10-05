/**
	Agenda de Contatos
    @author  Teodoro Freitas
*/

-- exibir Banco de dados do servidor
Show databases;
-- criar um novo banco de dados
create database dbagenda;
-- excluir um banco de dados
drop database dbteste;
-- selecionar o banco de dados
use dbagenda;


-- verificar tabelas existentes
show tables;

-- criando uma tabela
-- toda tabla precisa ter uma chave primaria (PK)
-- int(tipo de dados) -> numeros inteiros
-- primary key -> transforma este campo em chave primaria 
-- auto_inchement -> numeração automatica
-- varchar (tipo de dados equivalente a string (50) numero maximo de caracteres)
-- not null -> preenchimento obrigatorio
-- unique -> não permite valores duplicados na tebela

create table contatos(
	id int primary key auto_increment,
    nome varchar(50) not null,
    fone varchar(15) not null,
    email varchar (50) unique
);

-- descrição da tabela
describe contatos;


-- alterar o nome de um campo na tabela
alter table contatos change nome contato varchar(50) not null;

-- adicionar um novo campo a tabela
alter table contatos add column obs varchar(250);

-- adicionar um novo campo(coluna) em um local especifico da tebela
alter table contatos add column fone2 varchar(15) after fone;

-- modificar tipo de dados e/ou validação na coluna

alter table contatos modify column fone2 int;
alter table contatos modify column email varchar(100) not null;

-- excluir uma colina da tabela
alter table contatos drop column obs;

-- excluir a tabela
drop table contatos;

-- CRUD (create read uldate delete)
-- operações basicas do banco de dados

-- CRUD create
insert into contatos (nome,fone,email) values ('Teodoro','00000-0000','teo@gmail.com');
insert into contatos (nome,fone,email) values ('pedro','11111-1111','pedro@gmail.com');
insert into contatos (nome,fone,email) values ('matheus','22222-2222','matheus@gmail.com');
insert into contatos (nome,fone) values ('eduardo','33333-3333');
insert into contatos (nome,fone,email) values ('jose de assis','44444-4444','jose de assis@gmail.com');
-- CRUD read
-- selecionar todos os  registros(dados)da tabela
select * from contatos;

-- selecionar colunas especificas da tabela 
select nome, fone from contatos;

-- selecionar colunas em ordem crescente e decrescente
select * from contatos order by nome;
select id, nome from contatos order by id desc;

-- uso de filtros
select * from contatos where id = 1;
select * from contatos where nome = 'pedro';
select * from contatos where nome like 'e%';

-- CRUD update
update contatos set email='eduardo@gmail.com' where id = 5;
update contatos set fone= '99999-1234' where id = 1;
update contatos set nome='jose de souza', fone = '98901-77777',email= 'jose_de_souza@gomail.com' where id=4;

-- CRUD delete
-- ATENÇÃO! NÃO ESQUÇA DO WHERE E USAR SEMPRE O ID PARA EVITAR PROBLEMAS
delete from contatos where id=7;
