create database exam_dtm;
\c exam_dtm;

create extension pgcrypto;

create type gender_enum as enum('Erkak', 'Ayol');

create table users(
    user_id serial primary key,
    full_name varchar(60) not null,
    email varchar(35) not null,
    username varchar(32) not null,
    password text not null,
    gender gender_enum not null
);

insert into users(full_name, email, username, password, gender) values('Ali Candan', 'ali@gmail.com', 'ali', crypt('123456789', gen_salt('bf')), 'Erkak');


drop table if exists university cascade;
create table university(
    university_id serial primary key,
    university_name text not null
);

insert into university(university_name) values('Toshkent Tibbiyot Akademiysi'), ('Toshkent Axborot Texnologiyalari Universiteti'), ('Toshkent Moliya Instituti'), ('O''zbekiston Milliy Universiteti'), ('Toshkent Pediatriya Tibbiyot Instituti');

drop table if exists fan cascade;
create table fan(
    fan_id serial primary key,
    fan_name varchar(32) not null
);
insert into fan(fan_name) values('Matematika, Ingliz Tili'), ('Matematika, Fizika'), ('Biologiya, Kimyo');

drop table if exists fakultet cascade;
create table fakultet(
    fakultet_id serial primary key,
    fakultet_name text not null,
    university_id int references university(university_id) not null,
    fan_id int references fan(fan_id) not null
);
insert into fakultet(fakultet_name, university_id, fan_id) values('Davolash fakulteti', 1, 3), ('Tibbiy profilaktika fakulteti', 1, 3), ('Dasturiy injiniring', 2, 2), ('Axborot xavfsizligi (sohalar bo''yicha)', 2, 2), ('Bank ishi va auditi', 3, 1), ('Birja ishi', 3, 1), ('Agrokimyo va agrotuproqshunoslik', 4, 3), ('Amaliy matematika', 4, 2), ('Oliy hamshiralik ishi', 5, 3), ('Pediatriya ishi', 5, 3);

drop table if exists questions cascade;
create table questions(
    question_id serial primary key,
    question text not null,
    question_variant_1 text not null,
    question_variant_2 text not null,
    question_variant_3 text not null,
    answer text not null,
    fan_id int references fan(fan_id) not null
);







insert into questions(question, question_variant_1, question_variant_2, question_variant_3, answer, fan_id)
values 
('Quyidagi sonlardan qaysi biri 15 ga qoldiqsiz bo''linmaydi ?', '6525', '3145', '3105', '3145', 2),
('Berilgan p = 1018978560, q = 8976119441 va r = 987610734 sonlardan qaysilari 16 ga qoldiqsiz bo''linadi ?', 'p va q', 'p', 'r', 'p', 2),
('Soddalashtiring:  (a+b)(a-b+1)-(a-b)(a+b-1)', '2a^2 + 2b^2', '2b^2 - 2a', '2a', '2a', 2),
('log4(x+3)+log4(x-3) = 2', '5', '3', '+- 5', '5', 2),
('2m^2, 3dm^2, 4sm^2 nex=cha sm^2 ga teng ?', '21034', '20304', '20244', '20304', 2),
('Neksiya avtomobili 15 sekundda o''z tezligini noldan 108km/soat gacha yetkazdi. Avtomobilning tezlanishini aniqlang(m/s^2)', '2', '4', '7.2', '2', 2),
('Soatning minut mili aylanishining chastotasini (Hz) toping.', '0.0028', '2.8', '0.00028', '0.00028', 2),
('Ko''ndalang magnit maydonda aylanayotgan zaryadning kinetik energiyasi 9 marta ortsa, uning aylanish davri qanday o''zgaradi? Zaryad tezligi v', '3 marta ortadi', '3 marta kamaydi', '9 marta ortadi', '3 marta kamaydi', 2),
('Ebonit tayoqchasi (metall tayoqcha) manfiy zaryadlandi. Bunda uning massasi qanday o''zgargan?', 'o''zgarmagan', 'ortgan', 'tp''g''ri javob yoq', 'o''zgarmagan', 2),
('Bikrligi 6000 N/m bo''lgan prujinaning uchdan bir qismi qanday bikrlikka ega bo''ladi?', '12kN/m', '2kN/m', '3kN/m', '2kN/m', 2);



insert into questions(question, question_variant_1, question_variant_2, question_variant_3, answer, fan_id)
values
('Quyidagi sonlardan qaysi biri 15 ga qoldiqsiz bo''linmaydi ?', '6525', '3145', '3105', '3145', 1),
('Berilgan p = 1018978560, q = 8976119441 va r = 987610734 sonlardan qaysilari 16 ga qoldiqsiz bo''linadi ?', 'p va q', 'p', 'r', 'p', 1),
('Soddalashtiring:  (a+b)(a-b+1)-(a-b)(a+b-1)', '2a^2 + 2b^2', '2b^2 - 2a', '2a', '2a', 1),
('log4(x+3)+log4(x-3) = 2', '5', '3', '+- 5', '5', 1),
('2m^2, 3dm^2, 4sm^2 nex=cha sm^2 ga teng ?', '21034', '20304', '20244', '20304', 1),
('Choose the answer which correctly completes the sentence.
The ode was originally a ceremonial… written to celebrate public occasions or exalted subjects.', 'poems', 'poem', 'poem''s', 'poem', 1),
('John Keynes used his … of economics to help his college and himself.', 'knowledge', 'a knowledge', 'knowledges', 'knowledge', 1),
('Choose the best answer.
… is ready to answer?', 'Whom else', 'Whom still', 'Who else', 'Who else', 1),
('Complete the sentence.
… the results of your work.', 'this is', 'this was', 'those are', 'those are', 1),
('Complete the sentence.
… the results of your work.', 'this is', 'this was', 'those are', 'those are', 1);


insert into questions(question, question_variant_1, question_variant_2, question_variant_3, answer, fan_id)
values
('Quruqlikda yashovchilar yerdagi o''simlik va hayvonlarning necha foizini tashkil etadi?', '7', '50', '93', '93', 3),
('Barg hujayralariga havodagi karbonat angidrid uning qaysi qismi orqali kiradi?', 'o''tkazuvchi naylar', 'tolalar', 'epidermis', 'o''tkazuvchi naylar', 3),
('Choyning vatani qayer?', 'Seylon', 'Xitoy', 'Hindiston', 'Xitoy', 3),
('Qaysi zamburug''ning haqiqiy mitseliysi bo''lmaydi, hujayrasi oval shaklida, bir yadroli?', 'qorakuya', 'achitqi', 'zang zamburug''i', 'zang zamburug''i', 3),
('Qattiq bug''doy, sabzi kabi o''simliklar madaniy o''simliklarning qaysi markazidan kelib chiqqan?', 'Old Osiyo', 'Habashiston', 'Markaziy Amerika', 'Old Osiyo', 3),
('5.44 gramm kalsiy nitrat kristallogidrati qizdirilganda 3.28 gramm suvsiz tuz qoldi, kristallogidrat formulasini toping.', 'Ca(NO3)2 • 2H2O', 'Ca(NO3)2 • 4H2O', 'Ca(NO3)2 • 6H2O', 'Ca(NO3)2 • 4H2O', 3),
('Tarkibida 75% CaCO 3 bo''lgan 10 tonna ohaktoshdan qancha so''ndirilmagan ohak olinadi?', '7.5', '5.5', '4.2', '7.5', 3),
('29.4 gramm sulfat kislota 4.8 gramm magniy bilan reaksiyaga kirishdi, hosil bo''lgan tuz va gazning mol miqdorini toping.', '0.1;0.2', '0.2;0.4', '0.2;0.2', '0.2;0.2', 3),
('0.1 mol kislotani neytrallash uchun 250 ml 0.8 molyarli natriy gidroksid sarflansa, kislotaning formulasini aniqlang.', 'CH3COOH', '(OH)COOH', 'HOOCCOOH', 'CH3COOH', 3),
('13.4 gramm olma kislota mol miqdordagi o''yuvchi natriy bilan ta''sirlashganda hosil bo''lgan tuz massasini toping', '17.8', '20', '20.8', '17.8', 3);