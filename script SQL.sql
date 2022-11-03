create schema blog;

create table usuarios(
	id int primary key auto_increment,
    nome varchar(50),
    email varchar(100),
    usuario varchar(20),
    senha varchar(35)
);

create table moderadores(
	id int primary key auto_increment,
    nome varchar(50),
    email varchar(100),
    usuario varchar(20),
    senha varchar(35)
);


create table post(
	id int primary key auto_increment,
    titulo varchar(35),
    descricao varchar(500)
);

create table comentarios(
	id int primary key auto_increment.
	comentario varchar(200),
    usuarioComentario int,
	constraint fk_usuario foreign key (usuarioComentario) references usuarios(id),
    idPost int,
    constraint fk_post foreign key (idPost) references post(id),
    autorizado varchar(10) default false
);
insert into usuarios(nome, email, usuario, senha, tipo) values("moderador1", "moderacao@gmail.com", "mod1", "111111", "admin");

select * from moderadores;
select * from usuarios;
select * from post;
select * from comentarios;