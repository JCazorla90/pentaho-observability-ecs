#!/bin/bash

REPO_NAME=pentaho-pentaho
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
REGION=eu-west-1

docker build -t $REPO_NAME .
docker tag $REPO_NAME:latest $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:latest
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com
docker push $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:latest
