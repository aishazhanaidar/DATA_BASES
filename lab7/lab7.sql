--a
create function first(a numeric) returns numeric as
$$
begin return a + 1;
end;
$$
language plpgsql;

--select first(33);

--b
create function second(a numeric, b numeric) returns numeric as
$$
begin return a + b;
end;
$$
language plpgsql;

--select second(51, 6);

--c
create function third(a integer) returns boolean as
$$
begin return if a % 2 = 0
end;
$$
language plpgsql;

--select third(45);

--d
create function fourth(d varchar) returns boolean as
$$
begin return length(d) < 11;
end;
$$
language plpgsql;

--e
create function fifth(a integer, out first integer, out second integer) as
$$
begin
    first = a + 17;
    second = a * 3;
end;
$$
language plpgsql;

--select fifth(4);

-------------------------------------------------------------------------------------------------------------------------------------------

--a
create function a() returns trigger as
$$
begin
    raise notice '%', now();
    return new;
end;
$$
language plpgsql;

create trigger aa
    before insert on table1 
    for each row 
    execute procedure a();

--b
create function b() returns trigger as
$$
begin
    raise notice '%', b(now(),new.t);
    return new;
end;
$$
language plpgsql;

create trigger bb
    before insert on table2
    for each row
    execute procedure b();

--c
create function c() returns trigger as
$$
begin
    new.cost = new.cost * 1.12;
    return new;
end;
$$
language plpgsql;

create trigger cc
    before insert on table3
    for each row
    execute procedure c();

--d
create function d() returns trigger as
$$
begin raise exception 'Deletion is not allowed';
end;
$$
language plpgsql;

create trigger dd
    before delete on table4
    execute procedure d();

--e
create function e() returns trigger as
$$
begin
    raise notice '%', fourth(new.s);
    raise notice '%', fifth(new.a);
    return new;
end;
$$
language plpgsql;

create trigger ee
    before insert on table5
    for each row
    execute procedure e();

---------------------------------------------------------------------------------------------------------------------------------------------

create table aaa(
    id integer,
    name varchar,
    date_of_birth date,
    age integer,
    salary numeric,
    discount numeric,
    workexperience integer);
--a
create function a(id int, name varchar, date_of_birth date, age int, inout salary numeric, out discount numeric, workexperience int) as
$$
declare count int;
begin
    discount = 10;
    count = workexperience/2;
    for step in 1..count loop
        salary = salary * 1.1;
    end loop;
    count = workexperience/5;
    for step in 1..count loop
        discount = discount * 1.01;
    end loop;
    insert into work values(id, name, date_of_birth, age, salary, discount, workexperience);
end;
$$
language plpgsql;

--select * from a(190, 'Aisha', '2004-07-05', 22, 1000, 100);

--b
create function b(id int, name varchar, date_of_birth date, age int, inout salary numeric, workexperience int, out discount numeric) as
$$
declare count int;
begin
    if age >= 40 then salary = salary * 1.15;
    end if;
    discount = 10;
    count = workexperience/2;
    for step in 1..count loop
        salary = salary * 1.1;
    end loop;
    count = workexperience/5;
    for step in 1..count loop
        discount = discount * 1.01;
    end loop;
    if workexperience > 8 then discount = 20;
    end if;
    if workexperience > 8 then salary = salary * 1.15;
    end if;
    insert into work values(id, name, date_of_birth, age, salary, workexperience, discount);
end;
$$
language plpgsql;

--select * from b(212, 'Beka', '1999-09-11', 32, 890, 10);
