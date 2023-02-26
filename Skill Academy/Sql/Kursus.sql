--User dengan jumlah kursus yang ambil dan total pembayaran
SELECT nama, COUNT(course_name) jmh_kursus,SUM(total_amount) jmh_bayar
FROM db_sample_order2
GROUP BY nama, total_amount
ORDER BY 3 DESC;

--Jumlah kursus yang ambil dan total penerimaan
SELECT course_name, COUNT(course_name) jmh_kursus,SUM(total_amount) jmh_penerimaan
FROM db_sample_order2
GROUP BY 1, course_name , total_amount
ORDER BY 2 DESC;


