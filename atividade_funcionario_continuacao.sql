use bd_ativ_funcao;

select sum(salfunc) as soma_salarios
from funcionario;

select count(*) as total_funcionarios_mkt
from funcionario
where setorfunc = 'Marketing';

select setorfunc, avg(salfunc) as media_salarios
from funcionario
group by setorfunc
order by media_salarios desc;

select count(*) as salario_e_bairro
from funcionario
where bairrofunc = 'Socorro'
and salfunc < 3000;

select setorfunc, count(*) as quantia_func_setor
from funcionario
group by setorfunc
having count(*) > 3;