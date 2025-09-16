# Go Hello World with CI/CD to Docker Hub

This project demonstrates a simple "Hello World" application written in Go (Golang) and deployed to Docker Hub using a GitHub Actions CI/CD pipeline.

## Prerequisites

Before you begin, ensure you have the following:

1.  **GitHub Account**: For hosting your code and running GitHub Actions.
2.  **Docker Hub Account**: For storing your Docker images.
3.  **Go (Golang)**: Installed locally if you want to run or test the application outside Docker.
4.  **Git**: Installed locally for version control.

## Project Structure

```
.github/
└── workflows/
    └── main.yml      # GitHub Actions workflow for CI/CD
Dockerfile            # Dockerfile to build the Go application
main.go               # Go "Hello World" source code
go.mod                # Go module file
go.sum                # Go checksum file
README.md             # This documentation
```

## Step-by-Step Deployment Guide

Follow these steps to get your Go "Hello World" application deployed to Docker Hub.

### Step 1: Clone the Repository

First, clone this repository to your local machine:

```bash
git clone <your-repository-url>
cd hello-world-go
```

### Step 2: Create a Go Module

Initialize the Go module. This will create `go.mod` and `go.sum` files.

```bash
go mod init hello-world
go mod tidy
```

### Step 3: Set up Docker Hub Credentials as GitHub Secrets

For the GitHub Actions workflow to push images to Docker Hub, you need to provide your Docker Hub username and password as GitHub Secrets.

1.  Go to your GitHub repository.
2.  Navigate to **Settings** > **Secrets and variables** > **Actions**.
3.  Click on **New repository secret**.
4.  Create two new secrets:
    *   **Name**: `DOCKER_USERNAME`
        **Value**: Your Docker Hub username
    *   **Name**: `DOCKER_PASSWORD`
        **Value**: Your Docker Hub password (or an access token for better security)

### Step 4: Push to GitHub

Commit your changes and push them to your GitHub repository. This will trigger the GitHub Actions workflow.

```bash
git add .
git commit -m "Initial commit: Go Hello World with Docker and CI/CD"
git branch -M main
git push -u origin main
```

### Step 5: Verify Deployment

1.  **Check GitHub Actions**: Go to your GitHub repository, click on the **Actions** tab. You should see a workflow run in progress or completed successfully.
2.  **Check Docker Hub**: After the workflow completes, log in to your Docker Hub account. You should find a new repository named `hello-world-go` (or `your-docker-username/hello-world-go`) with the `latest` tag.

## Running the Docker Image

You can pull and run your Docker image from Docker Hub using the following commands:

```bash
docker pull <your-docker-username>/hello-world-go:latest
docker run <your-docker-username>/hello-world-go:latest
```

This will output `Hello, World!` to your console.

## Conclusion

You have successfully set up a CI/CD pipeline that automatically builds your Go application, creates a Docker image, and pushes it to Docker Hub every time you push changes to the `main` branch of your GitHub repository. This provides a robust and automated way to manage your application's deployment.



