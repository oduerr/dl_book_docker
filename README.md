# dl_book_docker
This docker container is for the book:

<a href="https://www.manning.com/books/probabilistic-deep-learning-with-python?a_aid=probabilistic_deep_learning&a_bid=78e55885">
<img src="https://images.manning.com/720/960/resize/book/f/433a556-0816-4a6d-aa1a-6c199f368b1a/Durr-PDLP-MEAP-HI.png" width="20%">
</a>

This is the docker container for the code examples in https://github.com/tensorchiefs/dl_book

## Installation of docker

* The official installation guide can be found at: [https://docs.docker.com/engine/installation/](https://docs.docker.com/engine/installation/)


## Running the container
In the docker command line execute:
```{bash}
docker run -p 8080:8888 -p 6006:6006 -it oduerr/dl_book_docker
```
open [http://localhost:8888/?token=tensorchiefs](http://localhost:8888/?token=tensorchiefs) or [http://192.168.99.100:8888/tree?token=tensorchiefs](http://192.168.99.100:8888/tree?token=tensorchiefs)(for some windows versions) in the browser. If you are asked for a password it's `tensorchiefs`

## Running with a linked file system.
If you want to access a directory here (/Users/oli/Documents/workspace/dl_book/) from inside the docker container execute:

```
docker run -p 8888:8888 -p 6006:6006 -v /Users/oli/Documents/workspace/dl_book/:/notebooks -it oduerr/dl_book_docker
```

## Updating
Please make sure to use the latest container by updating it using 

```
docker pull oduerr/dl_book_docker
```

# Other useful hints for docker

### Starting in bash
In case you want to not start the jupyter notebook sever automatically but want a bash shell do:

```
docker run -p 8888:8888 -p 6006:6006 -it oduerr/dl_book_docker bash
```

### Local vs Inside container
The entry before the colon ':' is on the local machine, the one after it inside the container. Examples:

```
  docker run -p 4242:8888 -it oduerr/dl_book_docker #4242 is the port on the local machine, 8888 inside the container
  docker run -v /tmp/dl_book/:/notebooks/dl_book/ #/tmp/dl_book is on local machine
```



## Building the container 
This repository is linked to dockerhub, however sometimes during debugging it might be faster to localy build the container. You can do this via 

```
docker build https://raw.githubusercontent.com/oduerr/dl_book_docker/master/Dockerfile
```

You can replace `master` with the branch you want to build.

