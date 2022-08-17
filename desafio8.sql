SELECT
	ar.artista AS artista,
    al.album AS album
FROM SpotifyClone.artistas ar
JOIN SpotifyClone.albuns al
	ON ar.artista_id = al.artista_id
WHERE ar.artista = 'Elis Regina'
ORDER BY album;