#import boto3
import boto3


#create client of rekognition, s3, and dynamodb
s3_client = boto3.client('s3')
reko_client = boto3.client('rekognition', region_name=AWS_REGION)
dynamo_client = boto3.client('dynamodb', region_name=AWS_REGION)


#user has to be logged in to so we are going to grab the id, token, 

#use to detect the object in the image aka detect labels
#detect face method
#when picture taken and uploaded on s3 then lambda will be triggered
reko_client.detect_faces(Image={'S3Object':{'Bucket':bucket,'Name':photo}},
                                   Attributes=['ALL'])
