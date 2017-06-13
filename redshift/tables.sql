-- Crear tabla

CREATE TABLE phones_accelerometer (
  index INTEGER,
  arrival_time TIMESTAMP,
  creation_time BIGINT,
  x FLOAT,
  y FLOAT,
  z FLOAT,
  user_code CHAR(1),
  model VARCHAR(20),
  device VARCHAR(20),
  gt VARCHAR(10)
)
DISTKEY(user_code);

DROP TABLE phones_accelerometer;

-- Cargar datos desde S3

COPY phones_accelerometer
FROM 's3://iniciativa-big-data/phones-data/'
DELIMITER ','
TIMEFORMAT AS 'epochmillisecs'
CREDENTIALS 'aws_iam_role=arn:aws:iam::129822709161:role/iniciativa-big-data-redshift';

-- Algunas consultas de ejemplo

SELECT * FROM phones_accelerometer LIMIT 10;

SELECT * FROM stl_load_errors ORDER BY starttime DESC;

SELECT model, device, count(*) as num_elem
FROM phones_accelerometer
GROUP BY model, device
ORDER BY model;

SELECT user_code, avg(x) as avg_x, avg(y) as avg_y, avg(z) as avg_z
FROM phones_accelerometer
GROUP BY user_code
ORDER BY user_code;

SELECT user_code, gt, max(sqrt(x^2 + y^2 + z^2))
FROM phones_accelerometer
GROUP BY user_code, gt
ORDER BY gt;