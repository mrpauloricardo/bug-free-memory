INSERT INTO `rede_social`.`conexao` (`usuario_id`, `amigo_id`, `data_conexao`)
SELECT u1.usuario_id, u2.usuario_id, CURDATE() - INTERVAL FLOOR(RAND() * 30) DAY
FROM `rede_social`.`usuario` u1
JOIN `rede_social`.`usuario` u2 ON u1.usuario_id < u2.usuario_id
LEFT JOIN
	`rede_social`.`conexao` c ON (c.usuario_id = u1.usuario_id AND c.amigo_id = u2.usuario_id) OR (c.usuario_id = u2.usuario_id AND c.amigo_id = u1.usuario_id)
WHERE
	c.conexao_id IS NULL
ORDER BY RAND()
LIMIT 40;