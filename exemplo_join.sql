create database empresa_join_exemplo;
use empresa_join_exemplo;

create table departamento(
	depcodigo int primary key auto_increment,
    depnome varchar(50)
);

create table funcionario(
	funcodigo int primary key auto_increment,
    depcodigo int not null,
    funnome varchar(100) not null,
    funnascimento date not null,
    funsalario decimal(10,2) not null,
    constraint fun_dep foreign key (depcodigo) references departamento(depcodigo)
);

create table dependente(
	depencodigo int primary key auto_increment,
    funcodigo int not null,
    depennome varchar(100) not null,
    constraint depen_fun foreign key (funcodigo) references funcionario(funcodigo)
);

insert into departamento(depnome)
values ('Financeiro'),
('Contabilidade'),
('Marketing'),
('RH'),
('TI');

select * from departamento;

insert into funcionario(depcodigo, funnome, funnascimento, funsalario)
values (3, 'Mateus', '1980-07-20', 4000.00),
(4, 'Giovanna', '2000-05-25', 4500.00),
(1, 'José', '1990-02-17', 3900.00),
(5, 'João', '2000-08-18', 6000.00),
(2, 'Luana', '1997-03-22', 3500.00);

select * from funcionario;

insert into dependente(funcodigo, depennome)
values (2, 'Rafaela'),
(5, 'Gabriel'),
(4, 'Felipe'),
(1, 'Izabela'),
(3, 'Rodrigo');

select * from dependente;

#inner join
select func.funnome nome_funcionario, depen.depennome nome_dependente
from funcionario func
inner join dependente depen
on func.funcodigo = depen.funcodigo;