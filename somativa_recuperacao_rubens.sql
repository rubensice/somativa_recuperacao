use formativahogwarts;


create table autores (
	idAutor bigint not null auto_increment,
    nomeAutor varchar(150) not null,
	primary key(idAutor)
);

insert into autores (nomeAutor) values ('Claidsson Silva'),('Postgree Dias'),('MongoDB Alves'),('MariaDB Costa');


create table editora (
	idEdi bigint not null auto_increment,
    nomeEdi varchar(150) not null,
    UF enum ('RO','AC','AM','RR','PA','AP','TO','MA','PI','CE','RN','PB','PE','AL','SE','BA','MG','ES','RJ','SP','PR','SC','RS','MS','MT','GO','DF') not null,
	primary key(idEdi)
);

insert into editora (nomeEdi, UF) values ('Phyton Productions', 'SP'),('Java Evo', 'ES'),('R Int', 'RJ'),('SQL Live','MG');

create table livros (
	idLivro bigint not null auto_increment,
    titulo varchar(150) not null,
    dataPubli date not null,
    edition varchar(50) not null,
    editora_FK bigint not null,
	primary key(idLivro),
    foreign key(editora_FK) references editora(idEdi)
);

insert into livros (titulo, dataPubli, edition, editora_FK) values ('Lógica para programação', '2008-08-12', '2', 1),('Desenvolvimento real de códigos', '2020-04-12', '2', 2), ('Manuel de analise de dados', '2019-10-08', '1', 3), ('Introdução a banco de dados', '2015-09-08', '2', 4);

insert into livros (titulo, dataPubli, edition, editora_FK) values ('Orgulho e Preconceito', '2008-08-12', '1', 4),('Dom Casmurro', '2020-04-12', '1', 4), ('A Culpa É Das Estrelas', '2019-10-08', '1', 4);


create table autor_livro (
	idLivro_FK bigint not null,
    idAutor_FK bigint not null,
    foreign key(idLivro_FK) references livros(idLivro),
    foreign key(idAutor_FK) references autores(idAutor)
);

insert into autor_livro (idLivro_FK, idAutor_FK) values (1, 2),(2, 2),(3, 3),(4, 4);
insert into autor_livro (idLivro_FK, idAutor_FK) values (5, 1),(6, 1),(7, 1);

create table emprestimo (
	id bigint not null auto_increment,
	idLivro_FK bigint not null,
    idUser_FK bigint not null,
    idResp_FK bigint not null,
    dataInicio datetime not null default now(),
    dataPrevisao date not null,
    dataDevol datetime,
    primary key(id),
    foreign key(idLivro_FK) references livros(idLivro),
    foreign key(idUser_FK) references usuarios(id)
);

select * from usuarios;

insert into emprestimo (idLivro_FK, idUser_FK, idResp_FK, dataInicio, dataPrevisao) values (1, 2, 5, '2023-06-01 21:06:11', '2023-06-30'),(1, 6, 5, '2023-06-12 12:06:11', '2023-07-12'), (1, 3, 5, '2023-06-12 12:06:11', '2023-07-12'), (2, 6, 5, '2023-04-12 12:06:11', '2023-05-12'), (2, 4, 5, '2023-03-01 12:06:11', '2023-04-01'), (2, 1, 5, '2023-06-01 12:06:11', '2023-06-15');
insert into emprestimo (idLivro_FK, idUser_FK, idResp_FK, dataInicio, dataPrevisao, dataDevol) values (3, 2, 5, '2023-01-01 21:06:11', '2023-06-30', '2023-03-01 21:06:11'),(3, 6, 5, '2023-06-12 12:06:11', '2023-07-12', '2023-07-01 21:06:11'), (4, 3, 5, '2023-06-12 12:06:11', '2023-07-12', '2023-06-13 21:06:11'), (4, 6, 5, '2023-04-12 12:06:11', '2023-05-12', '2023-06-01 21:06:11'), (1, 4, 5, '2023-03-01 12:06:11', '2023-04-01', '2023-06-14 21:06:11'), (2, 1, 5, '2023-06-01 12:06:11', '2023-06-15', '2023-06-14 21:06:11');

select now();

## ETAPA 2

#1

select a.nomeAutor, l.titulo
from autor_livro al
join autores a
on a.idAutor = al.idAutor_FK
join livros l
on l.idLivro = al.idLivro_FK
order by a.nomeAutor;

#2

select livro, nomeLivro, avg(qtdUsuarios) as 'média de usuarios' from ( 	
	select e.idLivro_FK livro, l.titulo nomeLivro, count(*) qtdUsuarios from emprestimo e
	join livros l on l.idLivro = e.idLivro_FK
    join usuarios u on u.id = e.idUser_FK
	group by e.idLivro_FK) subtabela group by livro;


#3
select l.idLivro, l.titulo, a.nomeAutor 
from livros l
join autor_livro al on al.idLivro_FK = l.idLivro
join autores a on a.idAutor = al.idAutor_FK
where l.idLivro not in (select e.idLivro_FK from emprestimo e);


#4

select al.idAutor_FK, a.nomeAutor, count(*) producoes from autor_livro al
join autores a on a.idAutor = al.idAutor_FK
group by al.idAutor_FK;

#5
select e.idUser_FK, u.nome, count(*) as 'total de emprestimos não devolvidos' from emprestimo e
join usuarios u on u.id = e.idUser_FK
where e.dataDevol is null
group by e.idUser_FK;



