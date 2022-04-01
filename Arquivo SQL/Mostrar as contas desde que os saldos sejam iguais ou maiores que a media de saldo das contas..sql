/*Mostrar as contas desde que os saldos sejam iguais ou maiores que a media de saldo das contas.*/ 
SELECT FORMAT (AVG (saldo),2) AS "Media" FROM conta ; 
SELECT *FROM conta WHERE saldo >= (SELECT AVG (saldo) FROM conta); 
