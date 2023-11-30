INSERT INTO `rede_social`.`chat` (`remetente_id`, `destinatario_id`, `texto_chat`, `data_hora_chat`)
SELECT c1.usuario_id AS remetente_id, c2.amigo_id AS destinatario_id, CONCAT('Mensagem de ', u1.nome, ' para ', u2.nome), TIMESTAMPADD(SECOND, FLOOR(RAND() * 86400), c1.data_conexao)
FROM `rede_social`.`conexao` c1
JOIN `rede_social`.`conexao` c2 ON c1.usuario_id <> c2.amigo_id AND c1.usuario_id < c2.amigo_id
JOIN `rede_social`.`usuario` u1 ON c1.usuario_id = u1.usuario_id
JOIN `rede_social`.`usuario` u2 ON c2.amigo_id = u2.usuario_id
LEFT JOIN `rede_social`.`chat` ch ON (ch.remetente_id = c1.usuario_id AND ch.destinatario_id = c2.amigo_id) OR (ch.remetente_id = c2.amigo_id AND ch.destinatario_id = c1.usuario_id)
WHERE ch.chat_id IS NULL AND c1.data_conexao IS NOT NULL AND c2.data_conexao IS NOT NULL
ORDER BY RAND()
LIMIT 40;