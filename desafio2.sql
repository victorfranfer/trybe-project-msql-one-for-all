SELECT
	COUNT(can.cancao) AS cancoes,
    COUNT(DISTINCT art.artista) AS artistas,
    COUNT(DISTINCT alb.album) AS albuns
FROM SpotifyClone.cancoes can
JOIN SpotifyClone.albuns alb
	ON can.album_id = alb.album_id
JOIN SpotifyClone.artistas art
	ON alb.artista_id = art.artista_id;