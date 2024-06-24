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

## Deploy to Azure Container Apps with the Azure Developer CLI

Make sure you're logged in to Azure, or login

```bash
azd auth login
```

To initialize an identical application to be deployed with the Azure Developer CLI, run

```bash
azd init
```

Provision and deploy your application, including container registration and enabling ingress

```bash
azd up
```
Then navigate to the URL provided in the output of the last command.

To clean up your resources, run

```bash
azd down --purge
```

## Further help

To get more help on the Angular CLI use `ng help` or go check out the [Angular CLI Overview and Command Reference](https://angular.dev/tools/cli) page.
