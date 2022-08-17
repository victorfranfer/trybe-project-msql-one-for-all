SELECT
	us.usuario_nome AS usuario,
    COUNT(re.cancao_id) AS qt_de_musicas_ouvidas,
    ROUND(SUM(ca.duracao_segundos / 60), 2) AS total_minutos
FROM SpotifyClone.usuarios us
JOIN SpotifyClone.reproducoes re
	ON us.usuario_id = re.usuario_id
JOIN SpotifyClone.cancoes ca
	ON re.cancao_id = ca.cancao_id
GROUP BY us.usuario_nome;