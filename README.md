# app
Dokcer-AWS-ECS
* Create AWS ECR repository command*
  $aws  ecr create-repository  --repository-name  <<he name of repository>>
* to loggin to AWS 
  $aws  ecr  get-login  --no-include-email  |  sh 
* If you want to look and copy repository URL in to ecr describe repository do below command *
  $aws  ecr  describe-repositories  --repository-name  << The name of repository >>
** tag docker image file **
  $docker  tag <<the name of image>>   repository_URL/<<Repository_Name>>:v_${BUILD_NUMBER}
