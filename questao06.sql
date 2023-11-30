SELECT usuario1.nome AS Usuário, usuario2.nome AS Amigo, conexao.data_conexao AS 'Data da Conexão'
FROM conexao
JOIN usuario usuario1 ON conexao.usuario_id = usuario1.usuario_id
JOIN usuario usuario2 ON conexao.amigo_id = usuario2.usuario_id
ORDER BY conexao.data_conexao;