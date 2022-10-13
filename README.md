# Frontend Runtime

> This repository contains an example react application created with the vite cli to allow testing deployments to different azure services using terraform

## Context and Problem Statement

We need to decide how we want to run frontend applications in production in the new setup. We might stick to how it was done before but also find that other approaches might make more sense in the future. Given the fact that we might move away from dedicated applications on a dashboard to a more device centric concept that might not consist of x applications but one coherent suite certain limitations or former requirements might not apply.

## Decision Drivers

* Easy to provision and configure using github and/or terraform
  * (if the solution allows it, we should dismiss terraform with simple github integration?)
* Supports global distribution
* Supports custom domains
* Built in SSL
* Good Dx at low cost
* Low Complexity
* (offers preview apps?)
  * not sure if needed at all if we want to do trunk based development

#### Requirements given by legacy

* Domains: We want to run our applications in the Eppendorf directoy while the main configuration for our custom domains is done in the dasgip directory. Will this work as intended?
* Environments: How do we "map/couple" our environments with the legacy environment
* Deployment/Release: we might need to make changes in the core frontend application. This application is currently living in a Storage Account and is Deliverd using Azure CDN

## Considered Options

### Option 1: Storage Account + CDN

This is the option that is in place for all frontend applications today. Given that the environment (azure directory & subscriptions) changes, we have the option to go other ways here. This setup basically uses a azure storage account and puts azure cdn in front of it for distribution. Back then, when we used pulumi in gitlab, this was a decision that allowed us to create new applications relatively fast, given that we already had IAC written in pulumi that handled this use case. Given that we don't want to use pulumi any longer and our source code lives in github this option gets less developer friendly in comparison to other solutions.

#### Cost

> see [this](https://confluence.dasgip.de/display/VNCAFM/Frontend+Deployment+Infrastructure) for the calculations that were done by the former colleagues.

I will try to gather the actual costs we have currently from the azure portal but tbh the ressource names etc are all soo intransparent that i have a real hard time whats going on in the dasgip directory

* CDN ([revisit](https://azure.microsoft.com/de-de/pricing/details/cdn/))
* Storage ([revisit](https://azure.microsoft.com/en-us/pricing/details/storage/blobs/))

#### Pro's

* solution might be the cheapest way
* "battle-tested", already in use in parts of more recent development on the eppendorf side

#### Con's

* developer experience
  * need to setup storage + cdn

### Option 2: Azure Static Web App

This repository contains an example workflow that interacts with a static web app setup in azure. It's not fully configured and the initall setup was done "manually" by creating a static web app through azures static web app extension in vsocde. This created the base repository (you can also reuse an existing one) assigned it to a ressource group inside of a subscription, added necessary environment variables in github and added the necessary action to deploy. All of the stup took less than 5 minutes.
You can see the running app here: <https://orange-moss-087cd8e03.2.azurestaticapps.net/>

## Open questions

* Will every project/repository have it's own resource group?

## References

* [Azure Static Web Apps vs Others](<https://devblogs.microsoft.com/devops/comparing-azure-static-web-apps-vs-azure-webapps-vs-azure-blob-storage-static-sites/>)
* [Terraform](https://www.terraform.io/)
* [Vite](https://vitejs.dev/)
* Feature Flags using

## Developing this project

### Requirements

* [Node(LTS)](https://nodejs.org/en/)

  * v16.17.1 is required

* [NPM](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)

* [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/azure-get-started)
