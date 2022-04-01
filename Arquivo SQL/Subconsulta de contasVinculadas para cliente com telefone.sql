#Subconsulta para mostrar as contas vinculadas aos cliente que informaram telefone no cadastro. 
SELECT * FROM contasvinculadas AS cv 
WHERE cv.CLIENTE_idCLIENTE IN (SELECT idCliente FROM cliente WHERE telefone IS NOT NULL);