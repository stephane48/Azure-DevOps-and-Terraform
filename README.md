# Azure-DevOps-and-Terraform

## Azure Devops: Provisioning API Infrastructure using Terraform
In this project we have build a fully automated CI/CD pipeline using:
### .NET Core 3.1
The API has been designed using the .NET Core framework of C#. The API is about providing the date, time and various temperature (Celcius and Fahrenheit).
### Github 
Once we commit and push our code written on VS Code, Github will trigger our build in Azure Devops, now the CI sill start now. Github will tell us 
if the build is passed or failed.
### Docker 
In our Azurepieplie file, docker is going to build our docker image and push it in Docker Hub
### Docker Hub
In the pipeline, docker hub is going to store the docker image built
### Terraform
We use Terraform to create/update the infrastructure automatically for our API
- It helps us to create our resource group "tfminrg", under this resource group,it will create a container "weatherapi",
the container created will pull the docker image saved in docker hub and run it in the container
- Next, another resource group "tf_rd_blobstore" will be created, under that resource group, there will be a "Blob storage" created,
and another container will be created to store the terraform state file, kind of a backend
### Azure & Azure Devops
