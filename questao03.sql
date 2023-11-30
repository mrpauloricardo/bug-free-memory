SELECT usuario.nome AS Usuário, postagem.texto_postagem AS Postagem, comentario.texto_comentario AS Comentário   
FROM comentario
JOIN usuario ON comentario.usuario_id = usuario.usuario_id
JOIN postagem ON comentario.postagem_id = postagem.postagem_id;