SELECT usuario1.nome AS Remetente, usuario2.nome AS Destinatário, chat.texto_chat AS Mensagem 
FROM chat
JOIN usuario usuario1 ON chat.remetente_id = usuario1.usuario_id
JOIN usuario usuario2 ON chat.destinatario_id = Usuario2.usuario_id