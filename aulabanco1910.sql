create database bd_clientes;
use bd_clientes;

create  table tbl_clientes (
      codigo int not null primary key auto_increment,
      nome varchar(40) not null,
      sexo char(1) not null
);

insert into tbl_clientes(nome, sexo)
values ("Humberto", "M"),("Ayrton Sena", "M"),("Xuxa", "F");

Delimiter $$
create procedure sp_lista_clientes(in opcao int)
begin
    if opcao = 0 then
        select * from tbl_clientes where sexo = "F";
	elseif opcao = 1 then
        select * from tbl_clientes where sexo = "M";
	else
        select * from tbl_clientes;
	end if;
end $$

Delimiter ;

Call sp_lista_clientes (0);
Call sp_lista_clientes (1);
Call sp_lista_clientes (25);

create table tbl_clientes2 (
     id int not null primary key auto_increment,
     nome varchar(100) not null,
     idade int not null,
     sexo char(1) not null,
     email varchar(100) not null,
     telefone varchar(15) not null,
     endereco varchar(255) not null
);

insert into tbl_clientes2(nome,sexo,idade, email, telefone, endereco)
values ("Xuxa","F", 63, "xuxa@gmail.com", 000, "rua da xuxa"), ("João","M", 15, "joao@gmail", 111, "rua do joao");

Delimiter $$
create procedure verificar_idade(in opcao int)
begin
    if opcao >= 18 then
	   select * from tbl_clientes2 where idade >= 18;
	else
       select * from tbl_clientes2 where idade < 18;
	end if;
end $$

Delimiter ;

Call verificar_idade(18);

create table clientes_audit (
     id int not null primary key auto_increment,
     nome varchar(100) not null,
     idade int not null,
     sexo char(1) not null,
     data_exclusao timestamp not null
);

Delimiter $$
create trigger trg_cliente_delete
after delete on tbl_clientes2
for each row
begin
     insert into clientes_audit (nome, idade, sexo)
     values (OLD.nome, OLD.idade, OLD.sexo);
end $$

Delimiter ;

insert into clientes_audit(nome, idade, sexo, data_exclusao)
values ("Rodrigonia", 47, "F", "2026-10-19");

select * from clientes_audit;

Delimiter $$
create trigger trg_padroniza_sexo
after insert on tbl_clientes2
for each row 
begin
	 insert into clientes_audit(sexo)
     
     







    
    


