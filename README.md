# coderepository

## githubを利用するのAWSCodePipeline

https://docs.aws.amazon.com/codepipeline/latest/userguide/connections-github.html


## AWS connection

github.com/zhangsdjp/coderepository
60621933



### Source：codestar-connections:UseConnection

 - https://github.com/zhangsdjp/coderepository
 
 - Public repository


### codebuild

  ```
  build:
    commands:
      - echo Build started on `date`
      - echo Get latest ./cfn/sonarqube-ec2.yml from CodeCommit

  post_build:
    commands:
      - echo Build completed on `date`

artifacts:
  files: 
    - ./cfn/*  
  ```


### codedeploy

        - Name: Deploy
          Actions:
            - Name: CreateChangeSet
              ActionTypeId:
                Category: Deploy
                Owner: AWS
                Version: "1"
                Provider: CloudFormation
              Configuration:
                ActionMode: CHANGE_SET_REPLACE
                RoleArn: !GetAtt PipelineDeployRole.Arn
                Capabilities: CAPABILITY_NAMED_IAM
                StackName: !Ref DeployStack
                ChangeSetName: !Sub ${DeployStack}-changeset
                TemplatePath: !Sub BuildOutput::${PackagedTemplateFile}
              InputArtifacts:
                - Name: BuildOutput
              OutputArtifacts: []
              RunOrder: 1

