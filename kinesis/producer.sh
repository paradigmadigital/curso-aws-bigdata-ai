#!/bin/sh

v=0.3

echo $v
#
#while true
#do
#    VendorID=$(( ( RANDOM % 2) + 1 ))
#    tpep_pickup_datetime=$(date +"%Y-%m-%d %T")
#    tpep_dropoff_datetime=$(date +"%Y-%m-%d %T" -d "+$(( RANDOM % 60 ))minutes")
#    passenger_count=$(( ( RANDOM % 9) + 1 ))
#    trip_distance=$(( ( RANDOM % 10) + 1 ))
#    pickup_longitude=!!
#    pickup_latitude=!!
#    RatecodeID=$(( ( RANDOM  % 6) + 1 ))
#    store_and_fwd_flag=!!
#    dropoff_longitude=!!
#    dropoff_latitude=!!
#    payment_type=$(( ( RANDOM  % 5) + 1 ))
#    fare_amount=!!
#    extra=$(( ( RANDOM  % 3) ))
#    mta_tax=!!
#    tip_amount=!!
#    tolls_amount=!!
#    improvement_surcharge=0.3
#    total_amount=sumatorio
#
#  eventTime=$(date +"%Y-%m-%d-%T")
#  userId=$(( ( RANDOM % 100000 )  + 1 ))
#  appId=$(( ( RANDOM % 1000 )  + 1 ))
#  appScore=$(( ( RANDOM % 100 )  + 1 ))
#  appData=SomeTestData
#  echo "$eventTime,$userId,$appId,$appScore,$appData"
#  aws kinesis put-record --stream-name iniciativa-big-data --data "$eventTime,$userId,$appId,$appScore,$appData"$'\n' --partition-key $appId --region eu-west-1
#done
