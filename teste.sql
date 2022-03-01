create database superMercado;
use superMercado;

create table produtos (
	cod_prod int(8) primary key auto_increment,
	loj_prod int(8) not null,
	desc_prod char(40),
	dt_inclu_prod date,
	preco_prod decimal(8,2)
);


/*1)Com base na tabela de “produtos” acima favor inserir um registro na referida tabela passando os seguintes valores : cod_prod =170, loj_prod=2, desc_prod=LEITE CONDESADO MOCOCA, dt_inclu_prod=30/12/2010  e preço_prod = R$45,40*/
insert produtos values (170, 2, "LEITE CONDESADO MOCOCA", "2010-10-30", 45.40),
(01, 1, "PICANHA", "2008-10-31", 112.49),
(02, 3, "COSTELA", "2009-10-31", 101.50),
(03, 4, "CHOCOLATE", "2011-10-31", 45.50),
(190, 5, "UVA", "2012-10-31", 45.50);


/*2)O Índice da tabela  de “produtos é o cód_prod e a loj_prod, com base no referido índice faça a alteração do preço do produto para R$95,40, lembrando que o cod_prod =170 e a loj_prod=2:*/ 
update produtos
set preco_prod = preco_prod * 2.1036
where cod_prod = 170 and loj_prod = 2 ;


/*3)Com base na tabela de “produtos” monte um select trazendo todos os registros da loja 1 e 2:
select * from produtos*/
where loj_prod = 1 or loj_prod = 2;


/*4)Com base na tabela de “produtos” monte um select para trazer a maior e a menor data  de inclusão do produto “dt_inclu_prod”:*/
select max(dt_inclu_prod) from produtos;
select min(dt_inclu_prod) from produtos;


/*5)Com base na tabela de “produtos” monte um select para trazer a quantidade total de registros existentes na tabela de “produtos”:*/
select count(cod_prod) from produtos;


/*6)Com base na tabela de “produtos” monte um select para trazer todos os produtos que comecem com a letra “L” na tabela de “produtos”:*/
select desc_prod from produtos
where desc_prod like "L%";


/*7)Com base na tabela de “produtos” monte um select para trazer a soma de todos os preços dos produtos totalizado por loja:*/
select sum(preco_prod) 
from produtos;


/*8)Com base na tabela de “produtos” monte um select para trazer a soma de todos os preços dos produtos totalizados por loja que seja maior que R$100.000*/
select sum(preco_prod) from produtos
where preco_prod >100;


------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------


create database centauro;
use centauro;

create table produtos (
	cod_prod int(8) primary key auto_increment, 				/*Codigo produto*/ 
	loj_prod int(8)	not null,									/*Codigo da loja */
	desc_prod char(40),											/*Descrição do Produto*/
	dt_inclu_prod date,											/*Data de inclusão do produto*/
	preco_prod decimal(8,2)	 									/*Preço do produto*/
);

create table lojas(
	loj_prod int(8)	not null,									/*Codigo da loja*/ 
	desc_loj char(40),											/*Descrição da loja*/
	foreign key (loj_prod) references produtos(loj_prod)		/*Chave estrangeira (Codigo loja)*/
);

create table estoque(
	cod_prod int (8) not null,									/*Codigo do produto*/
	loj_prod int (8) not null,									/*Codigo da loja*/
	qtd_prod decimal(15,3),										/*Quantidade em estoque do produto*/
	foreign key (cod_prod) references produtos(cod_prod),		/*Chave estrangeira (Codigo produto)*/
	foreign key (loj_prod) references lojas(loj_prod)			/*Chave estrangeira (Codigo loja)*/
);



/*insert*/
insert produtos values (169, 1, "nike", "2022-02-27", 550.00),
(789, 2, "vans", "2022-01-17", 500.00),
(654, 3, "adidas", "2022-02-07", 350.00),
(345, 4, "mizuno", "2012-06-23", 450.00);

insert estoque values (169, 1, 0.120),
(789, 2, 0.005),
(654, 3, 0.100),
(456, 4, 0.001);

insert lojas values(1, "temos em estoque"),
(2, "em falta"),
(3, "temos em estoque");


/*A)Montar um unico select para trazer os seguintes campos: o código da loja do produto, a descrição da loja, código do produto, a descrição do produto, o preço do produto, a quantidade em estoque do produto. Considere que o código da loja para esta consulta seja igual a 1.*/
select lojas.loj_prod, lojas.desc_loj, produtos.cod_prod, produtos.desc_prod, produtos.preco_prod, estoque.qtd_prod
from produtos
inner join estoque on produtos.cod_prod = estoque.cod_prod
inner join lojas on produtos.loj_prod = lojas.loj_prod
where lojas.loj_prod = 1;


/*B)Observe a estrutura da tabela de estoque e da tabela de produtos, monte um select para trazer todos os produtos que existem na tabela de produtos que não existem na tabela de estoque.*/
select * from produtos 
left join estoque on produtos.cod_prod = estoque.cod_prod;

/*C)Observe a estrutura da tabela de estoque e da tabela de produtos, monte um select para trazer todos os produtos que existem na tabela de estoque que não existem na tabela de produtos.*/
select * from produtos 
right join estoque on produtos.cod_prod = estoque.cod_prod;























