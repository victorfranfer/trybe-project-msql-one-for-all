SELECT
	MIN(pl.plano_valor) AS faturamento_minimo,
  MAX(pl.plano_valor) AS faturamento_maximo,
  ROUND(AVG(pl.plano_valor), 2) AS faturamento_medio,
  SUM(pl.plano_valor) AS faturamento_total
FROM SpotifyClone.planos pl
JOIN SpotifyClone.usuarios us
	ON pl.plano_id = us.plano_id;