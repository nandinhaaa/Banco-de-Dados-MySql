#Ordenação - crescente 
SELECT * FROM conta ORDER by saldo asc;
#Ordenação - decrescente 
SELECT * FROM conta ORDER by saldo DESC;

#Agrupamento
SELECT tipo, FORMAT (SUM(saldo),2) FROM conta GROUP BY tipo;