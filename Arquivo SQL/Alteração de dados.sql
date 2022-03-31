#Sintaxe básica de alteração de dados 
# UPDATE tabela SET campo=valor WHERE campo=valor; 
# UPDATE tabela SET campo=valor WHERE condição; 

#Atualização de 5% no saldo das contas do tipo Poupança
SELECT * from conta;
UPDATE conta SET saldo = saldo * 1.05 WHERE tipo = "Poupança"; 
SELECT * from conta;