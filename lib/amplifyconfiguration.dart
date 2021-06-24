const amplifyconfig = ''' {
  "UserAgent": "aws-amplify-cli/2.0",
  "Version": "1.0",
  "auth": {
      "plugins": {
          "awsCognitoAuthPlugin": {
              "IdentityManager": {
                  "Default": {}
              },
              "CredentialsProvider": {
                  "CognitoIdentity": {
                      "Default": {
                          "PoolId": "us-east-1:d65e8fa3-dcb3-473b-97e8-4305b5de777e",
                          "Region": "us-east-1"
                      }
                  }
              },
              "CognitoUserPool": {
                  "Default": {
                      "PoolId": "us-east-1_Mz01pYfa5",
                      "AppClientId": "5udbd5qi9775oksbipqf9mhk13",
                      "Region": "us-east-1"
                  }
              },
              "Auth": {
                  "Default": {
                      "authenticationFlowType": "USER_PASSWORD_AUTH"
                  }
              }
          }
      }
  },
  "api": {
      "plugins": {
          "awsAPIPlugin": {
              "apirest": {
                  "endpointType": "REST",
                  "endpoint": "https://apicelula4.qiip.com.mx/",
                  "region": "us-east-1",
                  "authorizationType": "AMAZON_COGNITO_USER_POOLS"
              }
          }
      }
  }
}''';