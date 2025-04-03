#!/bin/bash

REPO_NAME=pentaho-exporter
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
REGION=eu-west-1

# Build the image
docker build -t $REPO_NAME .

# Tag it for ECR
docker tag $REPO_NAME:latest $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:latest

# Authenticate and push
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com
docker push $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:latest
