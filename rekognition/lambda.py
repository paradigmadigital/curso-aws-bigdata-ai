from __future__ import print_function

import sys
import tempfile

import boto3
import json
import urllib
import datetime

print('Loading function')

rekognition = boto3.client('rekognition')
s3client = boto3.client('s3')


# --------------- Helper Functions to call Rekognition APIs ------------------


def detect_faces(bucket, key):
    return rekognition.detect_faces(Image={"S3Object": {"Bucket": bucket, "Name": key}}, Attributes=['ALL'])


def detect_labels(bucket, key):
    return rekognition.detect_labels(Image={"S3Object": {"Bucket": bucket, "Name": key}})


def index_faces(bucket, key):
    return rekognition.index_faces(Image={"S3Object": {"Bucket": bucket, "Name": key}},
                                   CollectionId="BLUEPRINT_COLLECTION")


def transform_json_to_csv(bucket, key, rekognition_faces_response):
    face_details_mapping = [
        ('Gender', 'Value'),
        ('Smile', 'Value'),
        ('Beard', 'Value'),
        ('Mustache', 'Value'),
        ('Quality', 'Sharpness'),
        ('Quality', 'Brightness'),
        ('MouthOpen', 'Value'),
        ('EyesOpen', 'Value'),
        ('AgeRange', 'Low'),
        ('AgeRange', 'High'),
        ('Eyeglasses', 'Value'),
        ('Sunglasses', 'Value')
    ]

    rekognition_faces_response_csv = ','.join([unicode(rekognition_faces_response['FaceDetails'][0][key_name][value_name])
                                               for key_name, value_name in face_details_mapping])

    now = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    rekognition_faces_response_csv = '{}/{},{},{}'.format(bucket, key, now, rekognition_faces_response_csv)

    return rekognition_faces_response_csv


def write_s3(bucket, key, rekognition_faces_response_json, rekognition_faces_response_csv):
    print('inside write s3 function (bucket: {}, key: {}, json: {}, csv: {})'
          .format(bucket, key, rekognition_faces_response_json, rekognition_faces_response_csv))

    tmp_filename = 'tmp{}'.format(next(tempfile._get_candidate_names()))
    print('tmp filename: {}'.format(tmp_filename))

    # write csv file
    f = open('/tmp/{}.csv'.format(tmp_filename), 'w')
    f.write(rekognition_faces_response_csv)
    f.close()

    f = open('/tmp/{}.csv'.format(tmp_filename), 'r')
    s3client.upload_fileobj(f, Bucket=bucket, Key='csv/' + key + '.csv')
    f.close()

    # write json file
    f = open('/tmp/{}.json'.format(tmp_filename), 'w')
    f.write(rekognition_faces_response_json)
    f.close()

    f = open('/tmp/{}.json'.format(tmp_filename), 'r')
    s3client.upload_fileobj(f, Bucket=bucket, Key='json/' + key + '.json')
    f.close()

# --------------- Main handler ------------------


def lambda_handler(event, context):
    """
    Demonstrates S3 trigger that uses Rekognition APIs to detect faces, labels and index faces in S3 Object.
    """

    # Get the object from the event
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = urllib.unquote_plus(event['Records'][0]['s3']['object']['key'].encode('utf8'))

    try:
        rekognition_faces_response = detect_faces(bucket, key)
        rekognition_faces_response_json = json.dumps(rekognition_faces_response, indent=4)
        rekognition_faces_response_csv = transform_json_to_csv(bucket, key, rekognition_faces_response)

        write_s3(bucket, key, rekognition_faces_response_json, rekognition_faces_response_csv)

        return rekognition_faces_response

    except Exception as e:
        print("Error processing object {} from bucket {}".format(key, bucket))
        print("Exception: {}. {}".format(e, sys.exc_info()[0]))
        raise
