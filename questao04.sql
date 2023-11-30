SELECT postagem.texto_postagem AS Postagem, COUNT(curtida.postagem_id) AS Curtidas
FROM postagem
JOIN curtida ON postagem.postagem_id = curtida.postagem_id
GROUP BY postagem.postagem_id
ORDER BY Curtidas DESC;