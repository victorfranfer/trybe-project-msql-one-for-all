SELECT COUNT(re.usuario_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.reproducoes re
JOIN SpotifyClone.usuarios us
	ON re.usuario_id = us.usuario_id
WHERE us.usuario_nome = 'Barbara Liskov';