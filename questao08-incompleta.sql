SELECT Usuário.nome AS Usuário, COUNT(Postagem.id) AS qtd_postagens
FROM Usuário
JOIN Postagem ON Usuário.id = Postagem.user_id
GROUP BY Usuário.id, Usuário.nome
ORDER BY qtd_postagens DESC;