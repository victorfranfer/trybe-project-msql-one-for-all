SELECT
	ca1.cancao AS nome_musica,
    CASE
		WHEN ca1.cancao LIKE '%Amar%' THEN REPLACE(ca1.cancao, 'Amar', 'Code Review')
        WHEN ca1.cancao LIKE '%SUPERSTAR%' THEN REPLACE (ca1.cancao, 'SUPERSTAR', 'SUPERDEV')
        WHEN ca1.cancao LIKE '%Bard%' THEN REPLACE (ca1.cancao, 'Bard', 'QA')
        WHEN ca1.cancao LIKE '%SOUL%' THEN REPLACE (ca1.cancao, 'SOUL', 'CODE')
        WHEN ca1.cancao LIKE '%Pais%' THEN REPLACE (ca1.cancao, 'Pais', 'Pull Requests')
	END AS novo_nome
FROM SpotifyClone.cancoes ca1
JOIN SpotifyClone.cancoes ca2
	ON ca1.cancao_id = ca2.cancao_id
GROUP BY nome_musica
HAVING novo_nome <> nome_musica
ORDER BY nome_musica DESC;