!#/bin/bash

###################################################################
# This script will list all the resources in aws account
# Author : Atharva Dankhade
# version : v0.0.1

# Following are the servies supported by this script
# 1. EC2
# 2. S3
# 3. RDS
# 4. Lambda
# 5. CloudFormation
# 6. CloudWatch
# 7. IAM
# 8. VPC
# 9. CloudFront
# 10. Route53

# usage : ./TestScript.sh <region> <service_name>
# example : ./TestScript.sh us-east-1 ec2

###################################################################


# step 1 : validate the input parameters
if [ $# -ne 2 ]; then
    echo "Usage: $0 <region> <service_name>"
    exit 1
fi

# step 2 : check if aws cli is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI not found. Please install AWS CLI to use this script."
    exit 1
fi

# step 3 : Execute the command based on the service names
case $2 in
    ec2)
        aws ec2 describe-instances --region $1
        ;;
    s3)
        aws s3 ls --region $1
        ;;
    rds)
        aws rds describe-db-instances --region $1
        ;;
    lambda)
        aws lambda list-functions --region $1
        ;;
    cloudformation)
        aws cloudformation describe-stacks --region $1
        ;;
    cloudwatch)
        aws cloudwatch describe-alarms --region $1
        ;;
    iam)
        aws iam list-users
        ;;
    vpc)
        aws ec2 describe-vpcs --region $1
        ;;
    cloudfront)
        aws cloudfront list-distributions
        ;;
    route53)
        aws route53 list-hosted-zones
        ;;
    *)
        echo "Invalid service name. Supported services are: ec2, s3, rds, lambda, cloudformation, cloudwatch, iam, vpc, cloudfront, route53"
        exit 1
esac
