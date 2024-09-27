#!/bin/bash

vpc_cidr="10.10.0.0/16"
subnet_cidr="10.10.1.0/24"
region="us-east-1"

vpc_id=$(aws ec2 create-vpc --cidr-block $vpc_cidr --region $region --query Vpc.VpcId --output text)

aws ec2 create-subnet --vpc-id $vpc_id --cidr-block $subnet_cidr --region $region --query Subnet.SubnetId --output text

igw_id=$(aws ec2 create-internet-gateway --region $region --query InternetGateway.InternetGatewayId --output text)

aws ec2 attach-internet-gateway --vpc-id $vpc_id --internet-gateway-id $igw_id --region $region