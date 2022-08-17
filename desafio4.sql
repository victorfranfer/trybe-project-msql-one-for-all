SELECT
	DISTINCT us.usuario_nome AS usuario,
    CASE
		  WHEN MAX(YEAR(re.data_reproducao)) <= 2020 THEN 'Usuário inativo'
      WHEN MAX(YEAR(re.data_reproducao)) >= 2021 THEN 'Usuário ativo'
	END AS status_usuario
FROM SpotifyClone.usuarios us
JOIN SpotifyClone.reproducoes re
	ON us.usuario_id = re.usuario_id
GROUP BY usuario
ORDER BY usuario;