create database supermercado_barto2A;
use supermercado_barto2A;

create table produto (
id_produto int not null primary key auto_increment unique,
produto varchar(60),
descricao varchar(60),
marca varchar(60),
unidade_medida float
);

create table funcionario (
id_func int not null primary key auto_increment unique,
funcionario varchar(60)
);

create table fornecedor (
id_form int not null primary key auto_increment unique,
fornecedor varchar(60),
cnpj varchar(18),
local_cidade varchar(60), local_estado varchar(60)
);

create table compra (
id_compra int not null primary key auto_increment unique,
id_produto int not null,
produto varchar(60),
valor float,
quantidade float,
id_form int not null,
fornecedor varchar(60),
cnpj varchar(18),
id_func int not null,
funcionario varchar(60),
data_compra date,

foreign key (id_produto) references produto (id_produto),
foreign key (id_form) references fornecedor (id_form),
foreign key (id_func) references funcionario (id_func)
);

create table venda (
id_venda int not null primary key auto_increment unique,
id_produto int not null,
produto varchar(60),
descricao varchar(60),
quantidade float,
valor float,
id_func int not null,
funcionario varchar(60),
data_venda date,
foreign key (id_produto) references produto (id_produto),
foreign key (id_func) references funcionario (id_func)
);

create table entrega (
id_entrega int not null primary key auto_increment unique,
id_venda int not null,
cliente varchar(60),
rua_entrega varchar(60),
numero_entrega varchar(60),
bairro_entrega varchar(60),
cidade_entrega varchar(60),
foreign key (id_venda) references venda (id_venda)
);

insert into produto (produto, descricao, marca, unidade_medida) values ("Salgadinho", "Salgadinho", "Cheetos", 0.08 );
insert into produto (produto, descricao, marca, unidade_medida) values ("Bolacha", "Maizena", "Vitarella", 0.5);
insert into produto (produto, descricao, marca, unidade_medida) values ("Farinha de trigo", "Trigo", "Dona Benta", 1);
insert into produto (produto, descricao, marca, unidade_medida) values ("Açúcar", "Refinado", "União", 1); 
insert into produto (produto, descricao, marca, unidade_medida) values ("Refrigerante", "Cola", "Coca-cola", 0.35);

insert into funcionario (funcionario) values ("Fernando");
insert into funcionario (funcionario) values ("Danilo");
insert into funcionario (funcionario) values ("Rodrigo");
insert into funcionario (funcionario) values ("Maria");
insert into funcionario (funcionario) values ("Pedro");

insert into fornecedor (fornecedor, cnpj, local_cidade, local_estado) values ("Pepsico do Brasil", "31.565.104/0020-30", "São Paulo", "São Paulo");
insert into fornecedor (fornecedor, cnpj, local_cidade, local_estado) values ("Filial Vitarella", "07.206.816/0052-65", "Jaboatão dos Guararapes", "Pernambuco");
insert into fornecedor (fornecedor, cnpj, local_cidade, local_estado) values ("Dona Benta LTDA", "41.828.849/0001-35", "Ipatinga", "Minas Gerais");
insert into fornecedor (fornecedor, cnpj, local_cidade, local_estado) values ("União Acucar S.A.", "07.191.991/0003-48", "Rio de Janeiro", "Rio de Janeiro");
insert into fornecedor (fornecedor, cnpj, local_cidade, local_estado) values ("Coca Cola", "45.997.418/0017-10", "Rio de Janeiro", "Rio de Janeiro");

insert into compra (id_produto, produto, valor, quantidade, id_form, fornecedor, cnpj, id_func, funcionario, data_compra) values (1, "Salgadinho", 7.00, 1.00, 1, "Pepsico do Brasil", "31.565.104/0020-30", 1, "Fernando", '2024-08-30');
insert into compra (id_produto, produto, valor, quantidade, id_form, fornecedor, cnpj, id_func, funcionario, data_compra) values (2, "Bolacha", 6.00, 1.00, 2, "Filial Vitarella", "07.206.816/0052-65", 2, "Danilo", '2024-08-30');
insert into compra (id_produto, produto, valor, quantidade, id_form, fornecedor, cnpj, id_func, funcionario, data_compra) values (3, "Farinha de Trigo", 15.00 , 1.00, 3, "Dona Benta LTDA", "41.828.849/0001-35", 3, "Rodrigo", '2024-08-30');
insert into compra (id_produto, produto, valor, quantidade, id_form, fornecedor, cnpj, id_func, funcionario, data_compra) values (4, "Açúcar", 7.00, 1.00, 4, "União Acucar S.A.", "07.191.991/0003-48", 4, "Maria", '2024-08-30');
insert into compra (id_produto, produto, valor, quantidade, id_form, fornecedor, cnpj, id_func, funcionario, data_compra) values (5, "Refrigerante", 4.00, 1.00, 5, "Coca Cola", "45.997.418/0017-10", 5, "Pedro", '2024-08-30');

/*select * from produto;
select * from funcionario;
select * from fornecedor;*/
select * from compra;

/*select * from produto join fornecedor on id_produto = id_form;*/

DELIMITER $$
create procedure cad_produto(
in
p_produto varchar(60),
p_descricao varchar(60),
p_marca varchar(60),
p_unidade_medida float
)
BEGIN
if(p_produto != "") then
insert into produto (produto, descricao, marca, unidade_medida) values (p_produto, p_descricao, p_marca, p_unidade_medida);
else
select "Digite o produto" as Msg;
END if;
END$$
DELIMITER $$

call cad_produto("", "de pelo", "VDR", 1);

select * from produto;
