-- Criando tabela cliente

create table cliente (
id_cliente serial primary key,
cpf_cliente varchar(11) not null unique,
nome varchar(100) not null,
telefone varchar(15) not null,
email varchar(100) not null,
data_nascimento date not null
);


-- Criando tabela status_reserva

create table status_reserva (
id_status_reserva serial primary key,
descricao_status_reserva varchar(30) not null
);


-- Criando tabela status_mesa
create table status_mesa (
id_status_mesa serial primary key,
descricao_status_mesa varchar(30) not null
);


-- Criando tabela status_pagamento
create table status_pagamento (
id_status_pagamento serial primary key,
descricao_status_pagamento varchar(30) not null
);


-- Criando tabela status_pedido
create table status_pedido (
id_status_pedido serial primary key, 
descricao_status_pedido varchar(30) not null
);

-- Criando tabela prato
create table prato (
id_prato serial primary key,
nome varchar(100) not null unique,
descricao text not null,
preco decimal(10,2) not null
);


-- Criando tabela funcionário

create table funcionario (
id_funcionario serial primary key, 
cpf_funcionario varchar(11) not null unique,
nome varchar(100) not null, 
cargo varchar(50) not null, 
telefone varchar(15) not null
);


-- Criar tabela mesa
create table mesa (
id_mesa serial primary key,
numero_identificador int not null unique, 
capacidade_assentos int not null,
id_status_mesa int not null,

foreign key (id_status_mesa)
	references status_mesa (id_status_mesa)
);


-- Criar tabela pedido
create table pedido (
id_pedido serial primary key,
id_prato int not null,
hora_pedido timestamp default transaction_timestamp(),
id_cliente int not null,
id_mesa int not null,
id_status_pedido int not null,

foreign key (id_prato)
	references prato(id_prato),

foreign key (id_cliente)
	references cliente(id_cliente),
	
foreign key (id_mesa)
	references mesa(id_mesa),
	
foreign key (id_status_pedido)
	references status_pedido(id_status_pedido)
);


-- Criar tabela pedido_funcionario
create table pedido_funcionario (
id_pedido_funcionario serial primary key,
id_pedido int not null,
id_funcionario int not null,

foreign key (id_pedido)
	references pedido(id_pedido),

foreign key (id_funcionario)
	references funcionario(id_funcionario)
 
 );


-- Criar tabela pagamento
create table pagamento (
id_pagamento serial primary key,
id_mesa int not null,
id_cliente int not null, 
id_funcionario int not null,
hora_pagamento timestamp default transaction_timestamp(),
id_status_pagamento int not null,

foreign key (id_mesa)
	references mesa(id_mesa),
	
foreign key (id_cliente)
	references cliente(id_cliente), 
	
foreign key (id_funcionario)
	references funcionario(id_funcionario),

foreign key (id_status_pagamento)
	references status_pagamento(id_status_pagamento)
);


-- Criar tabela reserva
create table reserva (
id_reserva serial primary key,
hora_reserva timestamp default transaction_timestamp(), 
quantidade_assentos int not null, 
id_cliente int not null, 
id_funcionario int not null,
id_status_reserva int not null,

foreign key (id_cliente)
	references cliente(id_cliente), 
	
foreign key (id_funcionario)
	references funcionario(id_funcionario), 
	
foreign key (id_status_reserva)
	references status_reserva(id_status_reserva)
	
);


-- Criar tabela reserva_mesa
create table reserva_mesa (
id_reserva_mesa serial primary key,
id_mesa int not null,
id_reserva int not null,

foreign key (id_mesa)
	references mesa(id_mesa),
	
foreign key (id_reserva)
	references reserva(id_reserva)
);








