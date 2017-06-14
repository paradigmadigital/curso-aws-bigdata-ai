#!/bin/sh

while true
do
    VendorID=$(( ( RANDOM % 4) + 1 ))
    tpep_pickup_datetime=$(date +"%Y-%m-%d %T")
    tpep_dropoff_datetime=$(date +"%Y-%m-%d %T" -d "+$(( RANDOM % 60 ))minutes")
    passenger_count=$(( ( RANDOM % 9) + 1 ))
    trip_distance=$(( ( RANDOM % 10) + 1 ))
    pickup_longitude=$(printf "%s73.%05d%05d%05d" "-" $(( $RANDOM % 10000 )) $(( $RANDOM % 10000 )) $(( $RANDOM % 10000 )))
    pickup_latitude=$(printf "40.%05d%05d%05d" $(( $RANDOM % 10000 )) $(( $RANDOM % 10000 )) $(( $RANDOM % 10000 )))
    RatecodeID=$(( ( RANDOM  % 6) + 1 ))
    store_and_fwd_flag="N"
    dropoff_longitude=$(printf "%s73.%05d%05d%05d" "-" $(( $RANDOM % 10000 )) $(( $RANDOM % 10000 )) $(( $RANDOM % 10000 )))
    dropoff_latitude=$(printf "40.%05d%05d%05d" $(( $RANDOM % 10000 )) $(( $RANDOM % 10000 )) $(( $RANDOM % 10000 )))
    payment_type=$(( ( RANDOM  % 5) + 1 ))
    fare_amount=$(( ( RANDOM % 100) + 1 ))
    extra=$(( ( RANDOM  % 3) ))
    mta_tax=$(printf "0.%02d" $(( $RANDOM % 10 )))
    tip_amount=$(( ( RANDOM  % 200) ))
    tolls_amount=$(( ( RANDOM  % 20) ))
    improvement_surcharge=0.3
    total_amount=`echo $fare_amount + $extra + $mta_tax + $tip_amount + $improvement_surcharge + $tolls_amount | bc`
    echo "$VendorID,$tpep_pickup_datetime,$tpep_dropoff_datetime,$passenger_count,$trip_distance,$pickup_longitude,$pickup_latitude,$RatecodeID,$store_and_fwd_flag,$dropoff_longitude,$dropoff_latitude,$payment_type,$fare_amount,$extra,$mta_tax,$tip_amount,$tolls_amount,$improvement_surcharge,$total_amount"
    aws kinesis put-record --stream-name <tu stream name> --data "$VendorID,$tpep_pickup_datetime,$tpep_dropoff_datetime,$passenger_count,$trip_distance,$pickup_longitude,$pickup_latitude,$RatecodeID,$store_and_fwd_flag,$dropoff_longitude,$dropoff_latitude,$payment_type,$fare_amount,$extra,$mta_tax,$tip_amount,$tolls_amount,$improvement_surcharge,$total_amount"$'\n' --partition-key $VendorID --region eu-west-1
done