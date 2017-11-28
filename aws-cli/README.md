This folder represents some snippets at aws-cli


######### IAM #########


aws iam create-instance-profile --instance-profile-name {profilename}

aws iam add-role-to-instance-profile --instance-profile-name {profilename} --role-name {role name}


######### EC2 #########

aws ec2 describe-instances --query "Reservations[].Instances[].[State.Name, InstanceId]"
aws ec2 describe-instances --query "Reservations[].Instances[].[NetworkInterfaces[0].Association.PublicIp]"


######### CODEDEPLOY #########

aws deploy push --application-name DemoApp --ignore-hidden-files\
      --s3-location s3://misha-cloudinary-codedeploy/Project3.zip \
      --source .

aws deploy register-application-revision --application-name DemoApp --s3-location bundleType=zip,eTag=a199ae2c04ce7f8aba87c23351ad5500,bucket=misha-cloudinary-codedeploy,key=revision_20171123_11_49_10.zip

aws deploy register-application-revision --application-name DemoApp --github-location commitId=323b569470dd6b969a37c83fb1d68c4e70739099,repository=moryachok/cloudguru-codedeploy

aws deploy create-deployment-config --deployment-config-name 10percent --minimum-healthy-hosts value=10,type=FLEET_PERCENT

aws deploy create-deployment-config --deployment-config-name 7hosts --minimum-healthy-hosts value=7,type=HOSTS_COUNT


######### S3 #########

aws s3 cp  {zip file} s3://{bucketname}/{path}
