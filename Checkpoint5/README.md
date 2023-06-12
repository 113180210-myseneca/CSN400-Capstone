# Checkpoint5 Submission

- **COURSE INFORMATION: CSN400-2234**
- **STUDENT’S NAME: Parkhi Sharma**
- **STUDENT'S NUMBER: 113180210**
- **GITHUB USER ID: 113180210-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

### Table of Contents
1. [Part A - Containerize an application](#part-a)
2. [Part B - Share the application](#part-b)
3. [Part C - Persist the D](#part-c)
4. [Part D - Multi container apps](#part-d)

## Part A

### Question 1 
If you run docker build -t getting-started . for a second time, the build time will be different from first time, why? Why the number of steps are also different? Explain your answers in detail.
### Answer
During the execution of docker build -t getting-started. The second build may take longer to complete and involve more stages than the first due to a variety of circumstances. These discrepancies primarily result from:
Layer Caching: When building images, Docker makes use of layer caching. Docker can re-use previously cached layers if the context (the files and folders used during the build) and the layers in the Dockerfile haven't changed since the last build. Due to Docker not having to rebuild those unchanged layers, the build time is greatly decreased.
Incremental Builds: Docker carries out incremental builds by examining the context and Dockerfile modifications. Based on the alterations, it indicates the stages or steps that need to be rebuilt. If only a portion of your code or Dockerfile has been modified, Docker will only carry out the operations required to incorporate those changes rather than rebuilding the complete image. The build time is significantly reduced by this optimisation.
Build Cache: Docker maintains a build cache where it caches the metadata and intermediate images from earlier builds. Docker can reuse the cache from a previous build to expedite the build process if the cache is accessible and still valid. However, Docker may need to invalidate the cache and rebuild from start if you made significant changes, like changing the Dockerfile or adding new dependencies.
If there are different steps, it can be because the build context or Dockerfile have changed. The number of steps Docker must carry out throughout the build may change if you made changes to the Dockerfile, for as by adding or removing instructions. The build procedure and the number of steps required can be affected by modifications to the build context, such as the addition or deletion of files.

### Question 2
What does -t flag do? If you do not use it what is the error? embed the error in your answer.
### Answer 
The Docker image is given a name and an optional tag when the -t flag is used in the docker build command. A notice advising that a repository name must be provided will be displayed by Docker if the -t parameter is omitted and you do not specify a name and tag. The requirement for the -t flag and a repository name will be noted in the error message.
```
$ docker build .
...
ERROR: Cannot build image: missing -t, repository name must be specified
```

### Question 3
Run docker build -t getting-started . a few times and then run docker image ls to get the list of your images, why do you still one image listed even though you have tried building image many times?
### Answer
Layer caching is used by Docker when building images. Docker reuses the layers from the cache rather than recreating them if they haven't changed. Due to Docker's clever reuse of the preexisting layers, this optimisation makes it possible for subsequent builds to be completed more quickly and only produces one image listed in docker image ls.

### Question 4
What are -d and -p flags? What does each flag do? Start another git bah or wsl terminal and run docker run -p 1000:3000 getting-startedin it, Notice that -d is missing. What is the output?Embed it in your submission. Explain why this happened?
### Answer
You can use your terminal without being connected to the container's console by using the docker run command's -d flag to start a Docker container in the background (detached mode).
A container's port can be published to the host using the -p flag. The port mapping between the host system and the container is specified.
Without the -d flag, if you type docker run -p 1000:3000 getting-startedin, the container's logs will be shown in your terminal and the command prompt won't reopen until the container is stopped.
```
$ docker run -p 1000:3000 getting-started

Listening on port 3000
```
### Question 5
The previous question has created a new container with your app running in it. Which port in localhost must be used to reach it?
### Answer 
Use port 1000 on the localhost to access the application running in the Docker container: http://localhost:1000.

### Question 6
Run docker ps and embed the output in your answer. If you have completed previous questions, you should have at least two containers running in your system. What is their difference? Can you explain how and why this was necessary?
### Answer 
```
$ docker ps
CONTAINER ID   IMAGE             COMMAND                  CREATED             STATUS             PORTS                    NAMES
6bacf47ac5dc   ubuntu            "bash -c 'shuf -i 1-…"   20 seconds ago      Up 17 seconds                               tender_matsumoto
0c01b2256580   getting-started   "docker-entrypoint.s…"   About an hour ago   Up About an hour   0.0.0.0:3000->3000/tcp   peaceful_faraday
```
#### Difference:
Docker Image: A Docker image is often used to generate each container. The containers' configurations, dependencies, and underlying software may vary because they may be running various images.

Container configuration: Environment variables, volume mounts, networking, and special command overrides are just a few of the parameters that can be configured for containers. Different behaviours may result from these configuration variations between the containers.

#### It is necessary because:
Microservices Architecture: Microservices architecture allows for fault isolation, scalability, and maintainability by separating services into their own containers.

Applications that use numerous containers must do so in order to run efficiently. Examples include web servers, databases, and cache services.

Testing and development: To test various configurations and accurately recreate complex system environments, developers use a number of containers.

### Question 7
How long did it take to create the image after you updated the code? It is still shorter than the first time you did it, why?
### Answer
#### A few reasons:
Cached Layers: Docker builds images via layering. It reduces build time by reusing cached layers for areas that haven't changed.

Incremental Build: Docker avoids rebuilding unaffected layers by performing incremental builds solely on changing components.

Build optimisation techniques include using.dockerignore and build caches speed up builds by reducing the amount of data processing required.

### Question 8
What is the error message you get when you try to run the app container? Embed the error in your submission and explain why do you get this error at all?
### Answer
```
$ docker run -dp 3000:3000 getting-started
f93c4c308142feb810565ba6a1f759a35840aa13e9c8ba866ce9570a2c0ad03e
docker: Error response from daemon: driver failed programming external connectivity on endpoint intelligent_hopper (b5cc0f04d6b2f20713f780ff2c5fe0bb3ea8f8188b0e4abe3e7cd4a1e6990d69): Bind for 0.0.0.0:3000 failed: port is already allocated.
```
#### The may occur because:
Dependencies that are incorrectly specified or missing: The application inside the container may need particular dependencies or configurations that are incorrectly set up. The container can exit incorrectly as a result of this.

Starting Error: The application may experience a starting error that prevents it from running properly. This may be the result of problems like improper command execution, missing files, or inconsistent settings.

Resource Restrictions: The container may be unable to start or exit if not enough CPU or RAM are allotted to it.

### Question 9
Repeat all the step for app update for: <p className="text-center">What tasks no to do for CSN400 yet! Add one above!</p> and embed a screenshot of your app in your submission.
### Answer
![Question 9 Screenshot](https://github.com/113180210-myseneca/CSN400-Capstone/assets/133024891/c8946c3c-00de-4696-87b6-d585013c68e4)




