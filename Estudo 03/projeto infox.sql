create database dbinfox;

use dbinfox;

create table usuarios(
id int primary key auto_increment,
usuario varchar(50) not null,
login varchar(50)not null unique,
senha varchar(250) not null,
perfil varchar(50) not null
);

-- a linha abaixo insere uma senha com criptografia

insert into usuarios (usuario,login,senha,perfil) values('Teodoro', 'admin', md5('123456'), 'administrador');
insert into usuarios (usuario,login,senha,perfil) values('Marciele', 'Marci', md5('123'), 'operador');

select * from usuarios;
select * from usuarios where id=1;

-- selecionando o usuario e sua senha (tela de login)

select * from usuarios where login='admin' and senha=md5('123456');

update usuarios set usuario='Marciele Thais ',login='Marcithais',senha=md5('1234'),perfil='operador' where id=2;

delete from usuarios where id=5;

-- char -> tipo de dados que aceita uma String de caracteres não variaveis 
create table clientes(
	idcli int primary key auto_increment,
    nome varchar(50) not null,
    cep char(8),
    endereco varchar (50) not null,
    numero varchar (12) not null,
    complemento varchar(30),
    bairro varchar(50) not null,
    cidade varchar(50) not null,
    uf char (2),
    fone varchar (15)not null
);

select * from clientes;

insert into clientes (nome,cep,endereco,numero,complemento,bairro,cidade,uf,fone)values('Teodoro Freitas',11111222,'rua sebastiao',2,'perto do supermercado','jardim sebast','São Paulo','SP','111111-1111');
insert into clientes (nome,cep,endereco,numero,complemento,bairro,cidade,uf,fone)values('Thiago perreira',22222333,'rua antorio vargas',222,'perto do vendinha','inveto','São Paulo','SP','22222-2222');
insert into clientes (nome,cep,endereco,numero,complemento,bairro,cidade,uf,fone)values('talita martins',44444555,'rua compiutee',15,'perto da esquina','intaquar','Rio de Janeiro','RJ','33333-3333');
insert into clientes (nome,cep,endereco,numero,complemento,bairro,cidade,uf,fone)values('vinicius medrado',66666777,'rua cadert',16,'arvore amarela','jardim amarelo','Curitiba','PR','44444-4444');
insert into clientes (nome,cep,endereco,numero,complemento,bairro,cidade,uf,fone)values('jose de assis',88888999,'rua moninter',7,'perto da praça jose','jardim jose','São Paulo','SP','55555-5555');


delete from clientes where idcli=6;

create table tbos (
os int primary key auto_increment,
dataos timestamp default current_timestamp,
tipo varchar(20) not null,
statusos varchar(30) not null,
equipamento varchar(200) not null,
defeito varchar(200) not null,
tecnico varchar(50),
valor decimal(10,2),
idcli int not null,
foreign key(idcli) references clientes(idcli)
);

describe tbos;

insert into tbos(tipo,statusos,equipamento,defeito,idcli) values ('orçamento','bancada','notebook Lenovo G90','Não liga',1);

insert into tbos(tipo,statusos,equipamento,defeito,tecnico,valor,idcli) values ('orçamento','Aguardando aprovação','Impressora HP2020','Papel enroscando','robson', '60',1);

insert into tbos(tipo,statusos,equipamento,defeito,tecnico,valor,idcli) values ('orçamento','Retirado','galaxy a20','tela quebrada','teo', '200',1);

insert into tbos(tipo,statusos,equipamento,defeito,tecnico,valor,idcli) values ('orçamento','Retirado','moto g5','bateria viciada','jose', '400',3);

insert into tbos(tipo,statusos,equipamento,defeito,tecnico,valor,idcli) values ('orçamento','Aguardando aprovação','monitor','apagando','robson', '300',4);


select * from tbos;

drop table tbos;
-- (inner join) união de tabelas relacionadas para consultas e updates
-- relatório 1
select * from tbos inner join clientes on tbos.idcli = clientes.idcli;

-- relatório 2
select
tbos.equipamento,tbos.defeito,tbos.statusos as status_os,tbos.valor,clientes.nome,clientes.fone from tbos inner join clientes on tbos.idcli = clientes.idcli where statusos = 'aguardando aprovação';

-- relatorio 3
select
tbos.os,date_format(tbos.dataos,'%d/%m/%Y - %H:%i') as data_os,tbos.equipamento,tbos.defeito,tbos.valor,clientes.nome as cliente from tbos inner join clientes on tbos.idcli = clientes.idcli where statusos = 'retirado';

-- relatorio 4
select sum(valor) as faturamento from tbos where statusos = 'retirado';