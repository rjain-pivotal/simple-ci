# simple-ci
The purpose of this project is to demonstrate a basic CI/CD pipeline. This pipeline use a pure web application written using the yeoman and php application. The PHP application uses composer for package management and the Web uses bower and gulp. 

# Load properties file, but pass all credentials during the install/update of the pipeline
```
fly -t ci set-pipeline -p simple -c pipeline.yml -v "git-private-key=$(cat id_rsa)" -v "cf-password=YOUR_PASSWORD" -v "aws-access-key-id=YOUR_ACCESS_KEY_ID" -v "aws-secret-access-key=YOUR_SECRET_ACCESS_KEY" -l properties.yml
```
