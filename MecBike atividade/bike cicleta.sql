create database mecbike;
use mecbike;

create table usuarios (
id int primary key auto_increment,
usuario varchar(50) not null,
login varchar(50)not null unique,
senha varchar(250) not null,
cargo varchar(50) not null
);

select * from usuarios;

drop table usuarios;

insert into usuarios (usuario,login,senha,cargo) values ('Teodoro','ADM',md5('1234'), 'CEO');
insert into usuarios (usuario,login,senha,cargo) values ('Mike','mike',md5('4321'), 'Assistente');
insert into usuarios (usuario,login,senha,cargo) values ('Rafael','rafa',md5('2222'), 'Assistente');
insert into usuarios (usuario,login,senha,cargo) values ('Jovi','jovi',md5('3214'), 'Assistente');

create table clientes (
	idcli int primary key auto_increment,
    nome varchar(50) not null,
    endereco varchar (50) not null,
    numero varchar (12) not null,
	bairro varchar(50) not null,
    cidade varchar(50) not null,
    cep char(8),
    fone varchar (15)not null,
    email varchar (40)
);

drop table clientes;

select * from clientes;

insert into clientes (nome,endereco,numero,bairro,cidade,cep,fone,email) values('jose','rua coleta','45','jardim dinheiro','São Paulo',11111222,'1111-1111','jose@gmail.com');
insert into clientes (nome,endereco,numero,bairro,cidade,cep,fone,email) values('maria','rua jardim','56','praça da flor','São Paulo',22222333,'2222-2222','maria@gmail.com');
insert into clientes (nome,endereco,numero,bairro,cidade,cep,fone,email) values('marcos','rua montanha','23','jardim construção','São Paulo',44444555,'3333-3333','marcos@gmail.com');
insert into clientes (nome,endereco,numero,bairro,cidade,cep,fone,email) values('maicon','rua cadeira','4','era uma vez','São Paulo',66666777,'4444-4444','maicon@gmail.com');
insert into clientes (nome,endereco,numero,bairro,cidade,cep,fone,email) values('jade','rua mesa','7','tatu','São Paulo',88888999,'5555-5555','jade@gmail.com');
insert into clientes (nome,endereco,numero,bairro,cidade,cep,fone,email) values('caue','rua pedra','66','rocha','São Paulo',10000111,'6666-6666','caue@gmail.com');
insert into clientes (nome,endereco,numero,bairro,cidade,cep,fone,email) values('larissa','rua bolinha','11','gude','parana',12222133,'7777-7777','larissa@gmail.com');
insert into clientes (nome,endereco,numero,bairro,cidade,cep,fone,email) values('estevao','rua tenis','32','rocha','bahia',14444155,'8888-8888','estevao@gmail.com');
insert into clientes (nome,endereco,numero,bairro,cidade,cep,fone,email) values('josuel','rua camisa','5','tatu','São Paulo',16666177,'9999-9999','josuel@gmail.com');
insert into clientes (nome,endereco,numero,bairro,cidade,cep,fone,email) values('rose','rua short','8','jardim roupa','São Paulo',18888199,'1000-1000','rose@gmail.com');



create table estoquepecas (
	iditen int primary key auto_increment,
    bcode varchar (50) unique,
    produto varchar (100) not null,
    fabricante varchar (100) not null,
    datacad timestamp default current_timestamp,
    quantidade int not null,
    estoquemin int not null,
    valor decimal(10,2),
    loc varchar(100)
);



select * from estoquepecas;

insert into estoquepecas (produto,fabricante,quantidade,estoquemin,valor,loc) values ('CÂMBIO','kmc',20,7,40,'Setor A-P1');
insert into estoquepecas (produto,fabricante,quantidade,estoquemin,valor,loc) values ('ALAVANCA','absolute',10,15,40.20,'Setor A-P2');
insert into estoquepecas (produto,fabricante,quantidade,estoquemin,valor,loc) values ('CORRENTE','mona',7,2,50.10,'Setor A-P3');
insert into estoquepecas (produto,fabricante,quantidade,estoquemin,valor,loc) values ('PEDIVELA','kmc',30,10,60.10,'Setor A-P4');
insert into estoquepecas (produto,fabricante,quantidade,estoquemin,valor,loc) values ('CASSETE','absolute',5,5,100,'Setor A-P5');

-- RELARIO 1
    
select sum(quantidade * valor) as total from estoquepecas;
    
-- RELARIO 2
    
select * from estoquepecas where quantidade < estoquemin;
    
create table bikedanos (
	bikeos int primary key auto_increment,
	dataos timestamp default current_timestamp,
	tipo varchar(20) not null,
	statusos varchar(30) not null,
	modelobi varchar(200) not null,
	problema varchar(200) not null,
	mec varchar(50),
    retiradaos date,
    garantia varchar(10),
	valor decimal(10,2),
	idcli int not null,
	foreign key(idcli) references clientes(idcli)
);

select * from bikedanos;

drop table bikedanos;

insert into bikedanos(tipo,statusos,modelobi,problema,mec,valor,idcli) values ('orçamento','aguardando aprovação','monark','roda enroscando','Teodoro',35.25,1);
insert into bikedanos(tipo,statusos,modelobi,problema,mec,valor,idcli) values ('orçamento','bancada','caloi','pedal quebrado','Mike',70.10,2);
insert into bikedanos(tipo,statusos,modelobi,problema,mec,valor,idcli) values ('orçamento','retirado','focus','guidão nao roda','Teodoro',15.90,3);
insert into bikedanos(tipo,statusos,modelobi,problema,mec,valor,idcli) values ('orçamento','retirado','scott','freio nao pega','Mike',20.60,4);
insert into bikedanos(tipo,statusos,modelobi,problema,mec,valor,idcli) values ('orçamento','retirado','monark','corrente travou','Jovi',50.47,5);
insert into bikedanos(tipo,statusos,modelobi,problema,mec,valor,idcli) values ('orçamento','bancada','caloi','freio da frente esta desregulado','Rafael',47.63,6);
insert into bikedanos(tipo,statusos,modelobi,problema,mec,valor,idcli) values ('orçamento','aguardando aprovação','scott','marcha nao funciona','Rafael',150.20,7);
insert into bikedanos(tipo,statusos,modelobi,problema,mec,valor,idcli) values ('orçamento','aguardando aprovação','focus','roda travou','Teodoro',40.10,8);
insert into bikedanos(tipo,statusos,modelobi,problema,mec,valor,idcli) values ('orçamento','retirado','focus','pedal quebrou','Jovi',60.25,9);
insert into bikedanos(tipo,statusos,modelobi,problema,mec,valor,idcli) values ('orçamento','retirado','monark','cambio parou defuncionar','Mike',100.00,10);

update bikedanos set valor = 200.00 where idcli=4;

update bikedanos set retiradaos = 20211015 where idcli=3;
update bikedanos set retiradaos = 20211016 where idcli=4;
update bikedanos set retiradaos = 20211015 where idcli=9;
update bikedanos set retiradaos = 20211014 where idcli=10;
update bikedanos set retiradaos = 20211014 where idcli=5;
update bikedanos set garantia='1 dia' where idcli=3;
update bikedanos set garantia='1 dia' where idcli=4;
update bikedanos set garantia='5 dia' where idcli=9;
update bikedanos set garantia='1 dia' where idcli=10;
update bikedanos set garantia='2 dia' where idcli=5;

-- relatório 1 
select * from bikedanos inner join clientes on bikedanos.idcli = clientes.idcli;

-- relatório 2
select
bikedanos.modelobi,bikedanos.problema,bikedanos.statusos as status_os,bikedanos.valor,clientes.nome,clientes.fone
 from bikedanos inner join clientes on bikedanos.idcli = clientes.idcli where statusos = 'aguardando aprovação';

select
bikedanos.modelobi,bikedanos.problema,bikedanos.statusos as status_os,bikedanos.valor,clientes.nome,clientes.fone
 from bikedanos inner join clientes on bikedanos.idcli = clientes.idcli where statusos = 'bancada';

-- relatorio 3
select bikedanos.bikeos,date_format(bikedanos.dataos,'%d/%m/%Y - %H:%i') as data_os,bikedanos.modelobi,bikedanos.
problema,bikedanos.valor,retiradaos,garantia,clientes.nome as cliente from bikedanos inner join clientes on bikedanos.idcli = clientes.idcli
 where statusos = 'retirado';

-- relatorio 4
select sum(valor) as ValorReparos from bikedanos where statusos = 'retirado';

