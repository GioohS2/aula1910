create database projetobanco2;
use projetobanco2;

create table tbvendedor(
	cdvdd integer primary key auto_increment,
    nmvdd varchar(20),
    sxvdd integer,
    perccomissao decimal(19,2)
);

create table tbestoqueproduto(
   cdpro integer primary key auto_increment,
   qtdpro integer,
   statu varchar(15)
);

create table tbdependente(
	cddep integer primary key auto_increment,
    nmdep varchar(20),
    dtnasc datetime,
    sxdep varchar(10),
    inepescola varchar(10),
    cdvdd integer,
     foreign key(cdvdd) references tbvendedor(cdvdd)
);

create table tbvendas(
    cdven integer primary key auto_increment,
    dtven datetime,
    cdcli integer,
    nmcli varchar(100),
    cidade varchar(100),
    estado varchar(45),
    pais varchar(45),
    nmpro varchar(45),
    tppro varchar(5),
    qtd integer,
    und varchar(5),
    vrunt decimal(19,2),
    cdcanalvendas integer,
    nmcanalvendas varchar(20),
    stat varchar(15),
    deletado char(1),
    cdpro integer,
	foreign key(cdpro) references tbestoqueproduto(cdpro),
    cdvdd integer,
    foreign key(cdvdd) references tbvendedor(cdvdd)
);
