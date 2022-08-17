DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.usuarios(
      usuario_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      usuario_nome VARCHAR(20) NOT NULL,
      idade INT NOT NULL,
      plano_id INT,
      data_assinatura DATE NOT NULL,
      FOREIGN KEY (plano_id) REFERENCES planos (plano_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.planos(
      plano_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      plano VARCHAR(20) NOT NULL,
      plano_valor DECIMAL(2, 2)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artistas(
      artista_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      artista VARCHAR(30) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.cancoes(
      cancao_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      cancao VARCHAR(100) NOT NULL,
      duracao_segundos INT
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.albuns(
      album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      album VARCHAR(50) NOT NULL,
      ano_lancamento YEAR
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artista_album(
      artista_id INT,
      album_id INT,
      CONSTRAINT PRIMARY KEY (artista_id, album_id),
      FOREIGN KEY (artista_id) REFERENCES artistas (artista_id),
      FOREIGN KEY (album_id) REFERENCES albuns (album_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.cancao_album(
      cancao_id INT,
      album_id INT,
      CONSTRAINT PRIMARY KEY (cancao_id, album_id),
      FOREIGN KEY (cancao_id) REFERENCES cancoes (cancao_id),
      FOREIGN KEY (album_id) REFERENCES albuns (album_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.reproducoes(
      usuario_id INT,
      cancao_id INT,
      data_reproducao DATETIME,
      CONSTRAINT PRIMARY KEY (usuario_id, cancao_id),
      FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
      FOREIGN KEY (cancao_id) REFERENCES cancoes (cancao_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.seguidores(
      usuario_id INT,
      artista_id INT,
      CONSTRAINT PRIMARY KEY (usuario_id, artista_id),
      FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
      FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.usuarios (usuario_nome, idade, plano_id, data_assinatura)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2017-01-17'),
    ('Sandi Metz', 58, 2, '2018-04-29'),
    ('Paulo Freire', 19, 3,'2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander', 85, 4, '2019-06-05'),
    ('Judith Butler', 45, 4, '2020-05-13'),
    ('Jorge Amado', 58, 4, '2017-02-17');

  INSERT INTO SpotifyClone.planos (plano, plano_valor)
  VALUES
    ('Gratuito', 0.00),
    ('Familiar', 7.99),
    ('Universitário', 5.99)
    ('Pessoal', 6.99);
  
  INSERT INTO SpotifyClone.artistas (artista)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina')
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  INSERT INTO SpotifyClone.cancoes (cancao, duracao_segundos)
  VALUES
    (`BREAK MY SOUL`, 279),
    (`VIRGO'S GROOVE`, 369),
    (`ALIEN SUPERSTAR`, 116)
    (`Don't Stop Me Now`, 203),
    (`Under Pressure`, 152),
    (`Como Nossos Pais`, 105),
    (`O Medo de Amar é o Medo de Ser Livre`, 207),
    (`Samba em Paris`, 267),
    (`The Bard's Song`, 244),
    (`Feeling Good`, 100);

  INSERT INTO SpotifyClone.albuns (album, ano_lancamento)
  VALUES
    (`Renaissance`, 2022),
    (`Jazz`, 1978),
    (`Hot Space`, 1982)
    (`Falso Brilhante`, 1998),
    (`Vento de Maio`, 2001),
    (`QVVJFA?`, 2003),
    (`Somewhere Far Beyond`, 2007),
    (`I Put A Spell On You`, 2012);

  INSERT INTO artista_album (artista_id, album_id)
  VALUES
    (1, 1),
    (2, 2),
    (2, 3),
    (3, 4),
    (3, 5),
    (4, 6),
    (5, 7),
    (6, 8);

  INSERT INTO cancao_album (cancao_id, album_id)
  VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 2),
    (5, 3),
    (6, 4),
    (7, 5),
    (8, 6),
    (9, 7),
    (10, 8);

  INSERT INTO reproducoes (usuario_id, cancao_id, data_reproducao)
  VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');

  INSERT INTO seguidores(usuario_id, artista_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (8, null),
    (9, 3),
    (10, 2);