--Revenue setiap kursus
SELECT A.course_name Kursus, B.category Kategori, SUM(total_amount) Revenue
FROM db_sample_order2 A
JOIN db_course B
ON A.course_id = B.course_id
GROUP BY A.course_name, B.category
ORDER BY A.course_name

SELECT A.course_name Kursus, B.category Kategori, SUM(total_amount) Revenue
FROM db_sample_order2 A
INNER JOIN db_course B
ON A.course_id = B.course_id
GROUP BY 1, 2
ORDER BY 3 DESC;

--Pendapatan total Revenue
SELECT SUM(total_amount) Total_Revenue
FROM db_sample_order2 A
INNER JOIN db_course B
ON A.course_id = B.course_id

--Revenue Tertinggi TOP 5
SELECT A.course_name Kursus, B.category Kategori, SUM(total_amount) Revenue
FROM db_sample_order2 A
INNER JOIN db_course B
ON A.course_id = B.course_id
GROUP BY 1, 2, A.total_amount
ORDER BY 3 DESC LIMIT 5

SELECT A.course_name Kursus, B.category Kategori, MAX(total_amount) Revenue
FROM db_sample_order2 A
INNER JOIN db_course B
ON A.course_id = B.course_id
GROUP BY 1, 2, A.total_amount
ORDER BY 3 DESC LIMIT 5

--Revenue Terendah TOP 5
SELECT A.course_name Kursus, B.category Kategori, MIN(total_amount) Revenue
FROM db_sample_order2 A
INNER JOIN db_course B
ON A.course_id = B.course_id
GROUP BY A.course_name, B.category, A.total_amount
ORDER BY total_amount ASC LIMIT 5

SELECT A.course_name Kursus, B.category Kategori, MIN(total_amount) Revenue
FROM db_sample_order2 A
JOIN db_course B
ON A.course_id = B.course_id
GROUP BY A.course_name, B.category, A.total_amount
ORDER BY 3 ASC LIMIT 5

/*
SELECT A.course_name Kursus, B.category Kategori, SUM(total_amount) Revenue
FROM db_sample_order2 A
INNER JOIN db_course B
ON A.course_id = B.course_id
GROUP BY A.course_name, B.category, A.total_amount
ORDER BY total_amount ASC LIMIT 5
*/


--Buat Tabel Pendapatan
create table db_revenue_course
as 
SELECT A.course_name Kursus, B.category Kategori, SUM(total_amount) Revenue
FROM db_sample_order2 A
INNER JOIN db_course B
ON A.course_id = B.course_id
GROUP BY 1, 2
ORDER BY 3 DESC;

