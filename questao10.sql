SELECT Usuario1.nome AS Usuario, Usuario2.nome AS Amigo, YEAR(CURDATE()) - YEAR(Usuario2.data_nascimento) AS Idade
FROM Conexao
INNER JOIN Usuario Usuario1 ON Conexao.usuario_id = Usuario1.usuario_id
INNER JOIN Usuario Usuario2 ON Conexao.amigo_id = Usuario2.usuario_id
WHERE YEAR(CURDATE()) - YEAR(Usuario2.data_nascimento) = (SELECT MAX(YEAR(CURDATE()) - YEAR(data_nascimento)) 
FROM Usuario WHERE EXISTS(SELECT 1 FROM conexao WHERE amigo_id = Usuario.usuario_id));