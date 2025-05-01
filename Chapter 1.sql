-- 테이블 생성
create table users (
	user_pk INT primary key,
	user_id VARCHAR(80),
	user_pw VARCHAR(12),
	register_date DATE
);

create table board (
	board_pk int primary key,
	board_user int,
	register_date date,
	title varchar(30),
	description varchar(3000),
	likes int,
	image_name varchar(50)
);

-- Insert Query
select * from users;

insert into users (user_pk, user_id, user_pw, register_date) values
	(1, 'Carvinus', 'car1234', '2020-04-23'),
	(2, 'Jenna', 'kk3375', '2020-07-12'),
	(3, 'Wlfur', 'fur0022', '2020-08-31');


select * from board;

insert into board (board_pk, board_user, register_date, title, description, likes, image_name) values
	(1, 1, '2020-05-02', 'Developer''s essay', 'Perhaps the reason we develop is because of th sense of accomplishment when we create something useful.', NULL, NULL),
	(2, 3, '2020-09-28', 'Why the earth is round', 'I took a picture myself from space and saw that the earth is round.', NULL, 'er.png'),
	(3, 2, '2020-07-13', 'Coffee time', 'I had a vanilla latte this afternoon at the blue signboard cafe on the boulevard.', NULL, 'coffee.jpeg'),
	(4, 2, '2020-08-14', 'Chicken is inefficient', 'This is because fried chicken is more expensive than other chicken dishes.', NULL, NULL),
	(5, 1, '2020-06-22', 'When bothering', 'Let''s get someone else to work.', NULL, NULL);

-- 데이터 필터링 (날짜 순 정렬 후, 최근 3개 조회)
select title, description from board
order by register_date desc
limit 3;

-- 데이터 업데이트
update users
	set user_pw = 'car4321'
	where user_id = 'Carvinus'
returning *; -- 수정한 내용 바로 조회

-- 일부 데이터 삭제
select * from board

delete from board where title = 'When bothering'
