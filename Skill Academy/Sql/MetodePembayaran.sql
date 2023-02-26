-- Jumlah pengguna metode pembayaran
SELECT payment_method metode_pembayaran, COUNT(payment_method) total_pengguna FROM db_sample_order2
GROUP BY payment_method
ORDER BY total_pengguna DESC;

--Cek jumlah user dan total pengguna(metode ) pembayaran
SELECT COUNT(payment_method) total_pengguna, COUNT(nama) total_user FROM db_sample_order2;

--Jumlah penerimaan berdasarkan metode pembayaran
SELECT payment_method metode_pembayaran, COUNT(payment_method) total_pengguna, SUM(total_amount) Revenue FROM db_sample_order2
GROUP BY payment_method
ORDER BY total_pengguna DESC limit 5;

--Cek apakah pengguna metode Visa berasal dari Luar negeri
SELECT a.payment_method metode_pembayaran, b.nama, b.region wilayah, SUM(A.total_amount) total_pembayaran
FROM db_sample_order2 a
INNER JOIN db_customer b
ON a.user_id = b.user_id 
WHERE a.payment_method = 'VISA'
GROUP BY 1,2,3
ORDER BY 4 DESC;

/*
SELECT SUM(total_amount), payment_method 
FROM db_sample_order2
WHERE payment_method = 'VISA'
GROUP BY 2
*/

--User dengan jumlah pembelian dan metode pembayaran
SELECT nama, COUNT(payment_method) jmh_beli, payment_method
FROM db_sample_order2
GROUP BY nama, payment_method
ORDER BY jmh_beli DESC;

--Buat tabel pembayaran
create table db_payment_method
as 
SELECT payment_method metode_pembayaran, COUNT(payment_method) total_pengguna, SUM(total_amount) Revenue FROM db_sample_order2
GROUP BY payment_method
ORDER BY total_pengguna DESC;



