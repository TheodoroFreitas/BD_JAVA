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

-- datacad timestamp default current_timestamp (data e hora automatico)
-- date (tipo de dados relacionados a data) YYYYMMDD
create table estoque (
	codigo int primary key auto_increment,
    barcode varchar (50) unique,
    produto varchar (100) not null,
    fabricante varchar (100) not null,
    datacad timestamp default current_timestamp,
    dataval date not null,
    quantidade int not null,
    estoquemin int not null,
    medida varchar (50) not null,
    valor decimal(10,2),
    loc varchar(100)
    );
    
    describe estoque;
    
    insert into estoque (produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)values('Caneta BIC Azul','BIC', 20221005,100,10,'CX',28.75,'Setor A-P2');
    insert into estoque (produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)values('Lapiz Faber GRAFITE','FABER CASTEL', 20250801,200,20,'CX',15.10,'Setor A-P3');
    insert into estoque (produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)values('Borracha Mercur 2lad','MERCUR', 20230101,50,5,'CX',10.25,'Setor A-P4');
    insert into estoque (produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)values('Corretor pritt','PRITT', 20221005,150,25,'CX',30.25,'Setor B-P1');
    insert into estoque (produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)values('Cartela lapis 10 cores','FABER CASTEL', 20230501,300,30,'CT',25.30,'Setor B-P2');
    
    select * from estoque;
    
    update estoque set dataval= 20211005 where codigo = 4;
    update estoque set dataval= 20201010 where codigo=3;
    
    update estoque set quantidade = 10 where codigo = 2;
    update estoque set quantidade = 29 where codigo =5;
    update estoque set produto= 'Caderno bat',fabricante='CAPRICHO',dataval= 20291001,quantidade=100,estoquemin=10,medida='CX',valor=50.10,loc='Setor C-P1' where codigo=1;
    delete from estoque where codigo=6;
    
    -- inventario de estoque()
    
    select sum(quantidade) as total from estoque;
    
    -- relatorio de reposição do estoque
    
    select * from estoque where quantidade < estoquemin;
    
    -- relatorio de reposição do estoque 
    -- date_format() -> formater a exibição da data
    -- %d (dia) %m (mês) %y (ano 2 digitos) %Y (ano 4 digitos)
    select codigo as Código,produto,date_format(dataval,'%d/%m/%y') as data_validade,quantidade, estoquemin from estoque where quantidade < estoquemin;
    
    
    -- relatorios de produtos vencidos 1 
    
    select codigo,produto,date_format(dataval,'%d/%m/%Y') as  data_validade from estoque;
    
    -- relatorios de validade dos produtos 2
    -- datediff () retorna a diferença em dias de duas datas
    -- curdate() data atual
    select codigo as Código, produto, date_format(dataval,'%d/%m/%Y') as data_validade, datediff(dataval, curdate()) as dias_restantes from estoque;