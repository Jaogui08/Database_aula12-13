create database empresa_join_2;
use empresa_join_2;

create table departamento(
	id int primary key auto_increment,
    nome varchar(255) not null
);

create table funcionario(
	id int primary key auto_increment,
    salario decimal(10,2) not null,
    nome varchar(100) not null,
    id_departamento int,
    foreign key (id_departamento) references departamento(id)
);

create table dependente(
	id int primary key auto_increment,
    nome varchar(100) not null,
    id_funcionario int,
    foreign key (id_funcionario) references funcionario(id)
);

insert into departamento(nome)
values ('Tecnologia da Informação'),
('Recursos Humanos'),
('Marketing'),
('Contabilidade'),
('Produção');

select * from departamento; 

insert into funcionario(salario, nome, id_departamento)
values (15000.00, 'João Sales', 1),
(10000.00, 'Daniel Moreira', 3),
(15000.00, 'Giovanna Busnardi', 1),
(8000.00, 'Laura Dias', 2),
(12000.00, 'Matheus Costa', 5);

select * from funcionario;

insert into dependente(nome, id_funcionario)
values ('Fábio Costa', 5),
('Heitor Costa', 5),
('Isabela Sales', 1),
('Maria Dias', 4),
('Lucas Busnardi', 3);

select * from dependente;

-- Exercício 1
select func.nome nome_funcionario, count(depen.id) quantidade_dependentes
from funcionario func
inner join dependente depen
on func.id = depen.id_funcionario
group by func.nome
having count(depen.id) > 1;


-- Exercício 2
select dep.nome nome_departamento, func.nome nome_funcionario
from departamento dep
inner join funcionario func
on dep.id = func.id_departamento
order by func.nome asc;

-- Exercício 3
select func.nome nome_funcionario, depen.nome nome_dependente
from funcionario func
left join dependente depen
on func.id = depen.id_funcionario;

-- Exercício 4
select dep.nome nome_departamento, avg(func.salario) media_salarial
from departamento dep
inner join funcionario func
on dep.id = func.id_departamento
group by dep.nome;

-- Exercício 5
select dep.nome nome_departamento, func.nome nome_funcionario
from departamento dep
left join funcionario func
on dep.id = func.id_departamento;

-- Exercício 6
select sum(salario) total_salarios
from funcionario;

-- Exercício 7
select dep.nome nome_departamento, sum(func.salario) custo_setor
from departamento dep
inner join funcionario func
on dep.id = func.id_departamento
group by dep.nome;