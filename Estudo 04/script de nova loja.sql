/**
	E-Commerce
    @author teodoro freitas
*/

create database dbloja;
drop database dblojacarrinho;
use dbloja;


create table clientes (
idcli int primary key auto_increment,
nome varchar(50) not null,
email varchar(50) unique not null,
senha varchar(250) not null
);

insert into clientes(nome,email,senha) values ('jose de assis','jose@email.com',md5('123456'));

select * from clientes;

describe clientes;


-- datacad timestamp default current_timestamp (data e hora automatico)
-- date (tipo de dados relacionados a data) YYYYMMDD
create table produtos (
	codigo int primary key auto_increment,
    barcode varchar (50) unique,
    produto varchar (100) not null,
    fabricante varchar (100) not null,
    datacad timestamp default current_timestamp,
    dataval date not null,
    estoque int not null,
    estoquemin int not null,
    medida varchar (50) not null,
    valor decimal(10,2),
    loc varchar(100)
    );
    
    describe produtos;
    
    insert into produtos (produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)values('Caneta BIC Azul','BIC', 20221005,100,10,'CX',28.75,'Setor A-P2');
    insert into produtos (produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)values('Lapiz Faber GRAFITE','FABER CASTEL', 20250801,200,20,'CX',15.10,'Setor A-P3');
    insert into produtos (produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)values('Borracha Mercur 2lad','MERCUR', 20230101,50,5,'CX',10.25,'Setor A-P4');
    insert into produtos (produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)values('Corretor pritt','PRITT', 20221005,150,25,'CX',30.25,'Setor B-P1');
    insert into produtos (produto,fabricante,dataval,estoque,estoquemin,medida,valor,loc)values('Cartela lapis 10 cores','FABER CASTEL', 20230501,300,30,'CT',25.30,'Setor B-P2');
    
    select * from produtos;
    
    update produtos set dataval= 20211005 where codigo = 4;
    update produtos set dataval= 20201010 where codigo=3;
    
    update produtos set estoque = 10 where codigo = 2;
    update produtos set estoque = 29 where codigo =5;
    update produtos set produto= 'Caderno bat',fabricante='CAPRICHO',dataval= 20291001,estoque=100,estoquemin=10,medida='CX',valor=50.10,loc='Setor C-P1' where codigo=1;
    delete from produtos where codigo=6;
    
    -- inventario de estoque()
    
    select sum(estoque) as total from produtos;
    
    -- relatorio de reposição do estoque
    
    select * from produtos where estoque < estoquemin;
    
    -- relatorio de reposição do estoque 
    -- date_format() -> formater a exibição da data
    -- %d (dia) %m (mês) %y (ano 2 digitos) %Y (ano 4 digitos)
    select codigo as Código,produto,date_format(dataval,'%d/%m/%y') as data_validade,estoque, estoquemin from produtos where estoque < estoquemin;
    
    
    -- relatorios de produtos vencidos 1 
    
    select codigo,produto,date_format(dataval,'%d/%m/%Y') as  data_validade from produtos;
    
    -- relatorios de validade dos produtos 2
    -- datediff () retorna a diferença em dias de duas datas
    -- curdate() data atual
    select codigo as Código, produto, date_format(dataval,'%d/%m/%Y') as data_validade, datediff(dataval, curdate()) as dias_restantes from produtos;
    
    create table pedidos(
    pedido int primary key auto_increment,
    dataped timestamp default current_timestamp,
    total decimal(10,2),
    idcli int not null,
    foreign key(idcli) references clientes(idcli)
    );
    
    insert into  pedidos(idcli) values (1);
    select * from pedidos;
    
    -- abertura do pedido
    select pedidos.pedido,date_format(pedidos.dataped,'%d/%m/%Y - %H:%i') as data_pedido, clientes.nome as cliente, clientes.email as e_mail from pedidos inner join clientes on pedidos.idcli = clientes.idcli;
    
    create table carrinho(
		pedido int not null,
        codigo int not null,
        quantidade int not null,
        foreign key(pedido) references pedidos(pedido),
        foreign key(codigo) references produtos(codigo)
    );
    
    select * from carrinho;
    
    insert into carrinho (pedido, codigo, quantidade) values (1,1,10);
	insert into carrinho (pedido, codigo, quantidade) values (1,2,5);
    
    select pedidos.pedido,carrinho.codigo as Código, produtos.produto, carrinho.quantidade, produtos.valor,produtos.valor * carrinho.quantidade as Sub_Total from (carrinho inner join pedidos on carrinho.pedido = pedidos.pedido) inner join produtos on carrinho.codigo = produtos.codigo;
    
    select sum(produtos.valor * carrinho.quantidade) as total from carrinho inner join produtos on carrinho.codigo = produtos.codigo;
    
    update carrinho inner join produtos on carrinho.codigo = produtos.codigo set produtos.estoque = produtos.estoque - carrinho.quantidade where carrinho.quantidade > 0;