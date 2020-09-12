set -x -e

# CREATE ZIP FILE
cd function
zip ../function.zip *
cd ..

# UPDATE FUNCTION CODE
aws lambda update-function-code \
  --function-name $DEPLOY_FUNCTION_NAME \
  --zip-file fileb://function.zip \
  --publish \
  > output.json
LATEST_VERSION=$(cat output.json | jq -r '.Version')

# CREATE APPSPEC FILE IN S3 BUCKET
cat > appspec.yml <<- EOM
version: 0.0
Resources:
  - myLambdaFunction:
      Type: AWS::Lambda::Function
      Properties:
        Name: "$DEPLOY_FUNCTION_NAME"
EOM
