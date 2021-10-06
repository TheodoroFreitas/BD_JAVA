/**
	carrinho de compras
    @author teodoro freitas
*/

create database dblojacarrinho;

use dblojacarrinho;

-- decimal (tipo de dados numericos não inteiro 10,2 dez digitos com 2 casas decimais de precisao)

create table carrinho(
codigo int primary key auto_increment,
produto varchar(250) not null,
quantidade int not null,
valor decimal (10,2) not null
);

describe carrinho;

drop table carrinho;

show databases;

drop database dbcarrinho;

alter table carrinho modify column valor int;
alter table carrinho modify column valor decimal(10,2)not null;


-- CRUD Create

insert into carrinho (produto,quantidade,valor) value ('Caneta bic CX30',10,17.50);
insert into carrinho (produto,quantidade,valor) value ('Caderno liso CX10',5,20.50);
insert into carrinho (produto,quantidade,valor) value ('Lapis bic CX15',20,8.70);
insert into carrinho (produto,quantidade,valor) value ('Marcador Verde CX12',2,9.10);
insert into carrinho (produto,quantidade,valor) value ('Branquinho bic CX16',8,15.10);


select * from carrinho;


select sum(valor * quantidade) as total from carrinho;

select * from carrinho;

select produto, quantidade from carrinho;

-- selecionar colunas em ordem crescente e decrescente
select * from carrinho order by produto;
select codigo, produto from carrinho order by codigo desc;


select * from carrinho where codigo = 1;
select * from carrinho where produto = 'Lapis bic CX15';
select * from carrinho where produto like 'c%';


update carrinho set valor= 5 where codigo = 5;
update carrinho set quantidade= 50 where codigo = 1;
update carrinho set quantidade = 100 ,valor= 100 where codigo= 2;

delete from carrinho where codigo=8;