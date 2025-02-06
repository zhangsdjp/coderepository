#!/bin/bash

aws batch register-job-definition \
  --job-definition-name superset-batch-job-collector-def \
  --type container \
  --container-properties file://cicd/batch-job-def.json \
  --platform-capabilities FARGATE \
  --timeout "attemptDurationSeconds"="3600"


if [ $? = 1 ]; then
    echo "Code Deploy Error."
    exit;
fi

echo "Code Deploy Success - DEMO."
exit 0;

