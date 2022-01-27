import boto3
import os

region = 'us-east-1'
instances = os.environ.get('INSTANCES').split(',')
ec2 = boto3.client('ec2', region_name=region)

def lambda_handler(event, context):
    ec2.stop_instances(InstanceIds=instances)
    for i in range(len(instances)):
        print('stopped your instance: ' + instances[i])