SELECT usuario.nome AS Usuário, COUNT(postagem.postagem_id) AS Postagens
FROM usuario
JOIN postagem ON usuario.usuario_id = postagem.usuario_id
GROUP BY usuario.usuario_id, usuario.nome
HAVING COUNT(postagem.postagem_id) = (SELECT COUNT(postagem_id) FROM postagem GROUP BY usuario_id ORDER BY COUNT(postagem_id) DESC LIMIT 1)
ORDER BY Postagens DESC;