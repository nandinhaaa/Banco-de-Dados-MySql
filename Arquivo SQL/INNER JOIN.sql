#Relatório com o nome do cliente, saldo,data de abertura e o tipo de conta. 
SELECT cli.nome, con.saldo,
date_format(cv.dataAbertura,"%d/%m/%Y") AS "Data de Abertura",
con.tipo
FROM cliente AS cli INNER JOIN conta AS con
INNER JOIN contasvinculadas AS cv
ON cli.idCLIENTE = cv.CLIENTE_idCLIENTE AND con.idCONTA = cv.CONTA_idCONTA;
