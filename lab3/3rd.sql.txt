create table students(
    full_name    varchar(50) primary key,
    age          smallint,
    birth_date   DATE,
    gender       sex,
    av_grade     real,
    info_about_yourself text,
    add_info text,
    dormitory_need boolean
);

create table instructors(
    name varchar(50) primary key,
    languages text,
    work_exp text,
    remote_lessons boolean
);

create table lesson_participants(
    lesson_title varchar(50) primary key,
    teaching_instructor varchar(50),
    studying_students int,
    room_number int,
    foreign key (teaching_instructor) references instructors(name)
);
