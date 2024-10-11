# Automated CI/CD Pipeline for Node.js with Jenkins and Docker 🚀

This repository showcases an end-to-end **CI/CD pipeline** for a **Node.js** application, automating everything from code integration to deployment using **Jenkins** and **Docker**. The goal is to streamline the software delivery process, reducing manual intervention and minimizing errors. By automating the build, testing, and deployment of the application, developers can focus on writing code, while Jenkins and Docker handle the rest.

This setup ensures continuous integration (CI) with automated testing and continuous deployment (CD) into production, all through a defined Jenkins pipeline. The entire process is containerized using Docker, which enhances portability and scalability across different environments.

---

## Features:
- **Continuous Integration (CI)**: Automatically builds and tests the Node.js application whenever code changes are pushed.
- **Continuous Deployment (CD)**: Once tests pass, the application is deployed in a Docker container.
- **Automated Build**: Jenkins fetches the code, builds the Node.js app, and creates a Docker image.
- **Automated Testing**: Unit and integration tests are run as part of the pipeline to ensure quality.
- **Containerized Deployment**: The Node.js app is packaged in a Docker container for easy deployment and scalability.
- **Pipeline as Code**: The Jenkins pipeline is managed through a Jenkinsfile, making it maintainable and version-controlled.

## Project Structure:
- **Node.js Application**: The core application to be built, tested, and deployed.
- **Jenkinsfile**: Defines the stages of the CI/CD pipeline for Jenkins.
- **Dockerfile**: Configuration for creating the Docker image of the Node.js app.

## CI/CD Workflow:
1. **Code Commit**: Developers push their code changes to the Git repository.
2. **Build and Test**: Jenkins triggers the pipeline, which builds the app and runs tests.
3. **Dockerize**: Jenkins creates a Docker image if the tests pass successfully.
4. **Deploy**: The Docker container is deployed, making the updated Node.js app live.

## Technologies Used:
- **Jenkins**: To automate the CI/CD pipeline.
- **Docker**: For containerizing and deploying the Node.js application.
- **Node.js**: The core application being developed and deployed.
- **Git**: For version control and collaboration.

## Prerequisites:
- Jenkins installed and configured with Docker.
- Node.js and npm installed for local development and testing.

## How to Use:
1. Clone this repository.
2. Set up Jenkins on your system.
3. Configure the Jenkins pipeline using the provided Jenkinsfile.
4. Trigger the pipeline to automate the build, test, and deployment of the Node.js application.
