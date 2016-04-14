select a, b, c from table_a 
	where c > 3 
	order by a desc

<>
same the !=

select a, b, c from table_a 
	where c > 3 and a > 2

insert into movies 
	(id, title, genre, duration)
	values
		(5, 'The Circus', 'Comedy', 71);

insert into movies 
	values
		(5, 'The Circus', 'Comedy', 71);

update movies set a=2, b=3
	where a>3;

delete from movies where a=2;

create database Chaplin Theaters

drop database Chaplin Theaters
remove

create table movies (
	id int,
	title varchar(20),
	genre varchar(100),
	duration int
);

drop table movies;

alter table movies
	add column ratings int;

alter table movies
	drop column ratings;