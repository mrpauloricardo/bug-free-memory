SELECT usuario.nome AS Usuário, postagem.texto_postagem AS Postagem, postagem.data_hora_postagem AS 'Data e Hora da Postagem'
FROM postagem
JOIN usuario ON postagem.usuario_id = usuario.usuario_id
ORDER BY postagem.data_hora_postagem DESC;