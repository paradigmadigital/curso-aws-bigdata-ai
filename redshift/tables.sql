-- Crear tabla

CREATE TABLE trips (
  VendorID INTEGER,
  tpep_pickup_datetime TIMESTAMP,
  tpep_dropoff_datetime TIMESTAMP,
  passenger_count INTEGER,
  trip_distance FLOAT,
  pickup_longitude FLOAT,
  pickup_latitude FLOAT,
  RatecodeID INTEGER,
  store_and_fwd_flag CHAR(1),
  dropoff_longitude FLOAT,
  dropoff_latitude FLOAT,
  payment_type INTEGER,
  fare_amount FLOAT,
  extra FLOAT,
  mta_tax FLOAT,
  tip_amount FLOAT,
  tolls_amount FLOAT,
  improvement_surcharge FLOAT,
  total_amount FLOAT
) DISTKEY(VendorID);

-- Cargar datos desde S3

COPY trips
FROM 's3://<tu bucket de S3>'
DELIMITER ','
CREDENTIALS 'aws_iam_role=arn:aws:iam::534508164501:role/redshift-role-curso-bigdata-ai';

-- Algunas consultas de ejemplo

SELECT * FROM trips LIMIT 10;

-- pasajeros totales por proveedor
SELECT VendorID, RatecodeID, count(passenger_count) as passengers
FROM trips
GROUP BY VendorID, RatecodeID
ORDER BY VendorID;

-- distancia media de los viajes respecto al número de pasajeros
SELECT passenger_count, avg(trip_distance) as avg_distance
FROM trips
GROUP BY passenger_count
ORDER BY passenger_count;

-- módulo de las coordenadas de origen y destino respecto del tipo de pago
SELECT payment_type, avg(sqrt((dropoff_longitude-pickup_longitude)^2 + (dropoff_latitude-trips.pickup_latitude)^2))
FROM trips
GROUP BY payment_type
ORDER BY payment_type;

-- máxima propina respecto al número de pasajeros
SELECT passenger_count, max(tip_amount) as max_tip
FROM trips
GROUP BY passenger_count
ORDER BY passenger_count;