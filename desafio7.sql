SELECT
	ar.artista AS artista,
    al.album AS album,
    COUNT(se.artista_id) AS seguidores
FROM SpotifyClone.artistas ar
JOIN SpotifyClone.albuns al
	ON ar.artista_id = al.artista_id
JOIN SpotifyClone.seguidores se
	ON ar.artista_id = se.artista_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista ASC, album ASC;