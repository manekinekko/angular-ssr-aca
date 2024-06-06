# AngularSsrAzure

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 18.0.3.

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The application will automatically reload if you change any of the source files.

## Code scaffolding

Run `ng generate component component-name` to generate a new component. You can also use `ng generate directive|pipe|service|class|guard|interface|enum|module`.

## Build

Run `ng build` to build the project. The build artifacts will be stored in the `dist/` directory.

## Running unit tests

Run `ng test` to execute the unit tests via [Karma](https://karma-runner.github.io).

## Running end-to-end tests

Run `ng e2e` to execute the end-to-end tests via a platform of your choice. To use this command, you need to first add a package that implements end-to-end testing capabilities.

## Deploy to Azure Container Apps

```bash
az login
az account set --subscription <subscription-id>
az extension add --name containerapp --upgrade
az provider register --namespace Microsoft.App
az provider register --namespace Microsoft.OperationalInsights

export RESOURCE_GROUP="<resource-group>"
export LOCATION="canadacentral"
export ENVIRONMENT="dev"
export API_NAME="angular-ssr"

az containerapp up \
  --name $API_NAME \
  --location $LOCATION \
  --environment $ENVIRONMENT \
  --source .

az containerapp ingress enable -n angular-ssr -g <resource-group> --type external --target-port 4000 --transport auto --output json --query fqdn
```

Then navigate to the URL provided in the output of the last command.

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI Overview and Command Reference](https://angular.dev/tools/cli) page.
