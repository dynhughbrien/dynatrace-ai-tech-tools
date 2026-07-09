#! /bin/sh 

brew install claude-code 

brew install dynatrace-oss/tap/dtctl

dtctl auth login 

dtctl skills  install --for claude 

npx skills add dynatrace/dynatrace-for-ai

