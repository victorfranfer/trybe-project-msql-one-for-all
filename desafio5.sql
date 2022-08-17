SELECT
	ca.cancao AS cancao,
    COUNT(re.cancao_id) AS reproducoes
FROM SpotifyClone.cancoes ca
JOIN SpotifyClone.reproducoes re
	ON ca.cancao_id = re.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;