#Cálculo de idade 
SELECT nome,
DATE_FORMAT (dataNascimento,"%d/%m/%Y") AS nascimento,
(YEAR(CURDATE()) - YEAR (dataNascimento) )-
(RIGHT (CURDATE(),5) <RIGHT (dataNascimento,5)) AS idade
FROM cliente; 