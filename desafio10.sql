SELECT
	ca.cancao AS nome,
    COUNT(re.cancao_id) AS reproducoes
FROM SpotifyClone.cancoes ca
JOIN SpotifyClone.reproducoes re
	ON ca.cancao_id = re.cancao_id
JOIN SpotifyClone.usuarios us
	ON us.usuario_id = re.usuario_id
JOIN SpotifyClone.planos pl
	ON pl.plano_id = us.plano_id
WHERE pl.plano IN ('Gratuito', 'Pessoal')
GROUP BY nome
ORDER BY nome;