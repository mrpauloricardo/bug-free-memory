INSERT INTO `rede_social`.`comentario` (`postagem_id`, `usuario_id`, `texto_comentario`, `data_hora_comentario`)
SELECT p.postagem_id, u.usuario_id, CONCAT('Comentário na postagem ', p.postagem_id), TIMESTAMPADD(SECOND, FLOOR(RAND() * 86400), NOW() - INTERVAL FLOOR(RAND() * 30) DAY)
FROM `rede_social`.`postagem` p
JOIN `rede_social`.`usuario` u ON p.usuario_id <> u.usuario_id
WHERE EXISTS (
    SELECT 1
    FROM `rede_social`.`postagem` p2
    WHERE p2.postagem_id = p.postagem_id
)
ORDER BY RAND()
LIMIT 30;