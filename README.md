# app
Dokcer-AWS-ECS
* Create AWS ECR repository command*
  $aws  ecr create-repository  --repository-name  <<he name of repository>>
* to loggin to AWS 
  $aws  ecr  get-login  --no-include-email  |  sh 
* create AWS VPC network Run cloudfomation command *
   $aws cloudformation create-stack --stack-name vpc --template-body file://$PWD/infrs/vpc.yml
* If you want to look and copy repository URL in to ecr describe repository do below command *
  $aws  ecr  describe-repositories  --repository-name  << The name of repository >>
** tag docker image file **
  $docker  tag <<the name of image>>   repository_URL/<<Repository_Name>>:v_${BUILD_NUMBER}
** Push to ECR **
  $docker push repository_URL/<<Repository_Name>>:v_${BUILD_NUMBER}
** Build IAM roles with iam.yml file , and do command as below**
  aws cloudformation create-stack --stack-name iam --template-body file://$PWD/iam.yml --capabilities  CAPABILITY_IAM
** Create app-clude yaml file then run **
  aws cloudformation create-stack --stack-name  app-cluster.yml file://$PWD/app-cluster.yml
