# GO PROJECT LAYOUT STANDARD - ARCHITECTURE

---
___#TREE___

```
/_/ (master)
 drwxr-xr-x ├── .circleci
 -rw-r--r-- │   └── config.yml
 drwxr-xr-x ├── api
 -rw-r--r-- │   ├── .../*.go
 -rw-r--r-- │   └── .../*.go
 drwxr-xr-x ├── bin
 -rw-r--r-x │   └── binary.exec
 drwxr-xr-x ├── cmd
 drwxr-xr-x │   └── application
 -rw-r--r-- │   │   └── main.go
 -rw-r--r-- │   └── .../*.go
 drwxr-xr-x ├── configs
 -rw-r--r-- │   ├── *.go
 -rw-r--r-- │   ├── *.yaml
 -rw-r--r-- │   └── *.json
 drwxr-xr-x ├── docs
 -rw-r--r-- │   ├── *.xlsx
 -rw-r--r-- │   ├── *.pdf
 -rw-r--r-- │   ├── *.doc
 -rw-r--r-- │   ├── *.yaml
 -rw-r--r-- │   └── *.json
 drwxr-xr-x ├── internal
 -rw-r--r-- │   ├── .../*.go
 -rw-r--r-- │   └── .../*.go
 drwxr-xr-x ├── mocks
 -rw-r--r-- │   ├── .../*.go
 -rw-r--r-- │   └── .../*.go
 drwxr-xr-x ├── pb
 -rw-r--r-- │   ├── .../*.go
 -rw-r--r-- │   └── .../*.go
 drwxr-xr-x ├── pkg
 -rw-r--r-- │   ├── .../*.go
 -rw-r--r-- │   └── .../*.go
 drwxr-xr-x ├── proto
 drwxr-xr-x │   ├── graphQL
 -rw-r--r-- │   │   └── .../*.go
 drwxr-xr-x │   ├── gRPC
 -rw-r--r-- │   │   └── .../*.go
 drwxr-xr-x │   ├── protobuf
 -rw-r--r-- │   │   └── .../*.go
 drwxr-xr-x │   └── SOAP
 -rw-r--r-- │       └── .../*.go
 drwxr-xr-x ├── script
 -rw-r--r-- │   ├── .../*.sh
 -rw-r--r-- │   ├── .../*.zsh
 -rw-r--r-- │   └── .../*.bash
 drwxr-xr-x ├── test
 -rw-r--r-- │   ├── .../*_test.go
 -rw-r--r-- │   └── .../*_test.go
 -rw-r--r-- ├── .dockerignore
 -rw-r--r-- ├── .gitignore
 -rw-r--r-- ├── Dockerfile
 -rw-r--r-- ├── go.mod
 -rw-r--r-- ├── go.sum
 -rw-r--r-- ├── LICENSE
 -rw-r--r-- ├── Makefile
 -rw-r--r-- ├── README.md
 -rw-r--r-- └── tools.go
```

___#DIRECTORIES:___
* .circle: contains all files config of circle CI/CD to run
* cmd: contains all entry points of the application
* configs: stores all the configurations of the application
* docs: all the available documents of the application. (May be use 'Documents' to the same purpose).
* internal: private packages of the project
* pkg: public packages of the project
* local: all the additional things that allow everyone to run your code in the local environment.
* mocks: mocking stuff for unit testing your application
* proto: protobuf definition for your microservices (I used it with the gRPC communication method for my company’s internal service communication, you can store another contract like jsonschema, graphQL or SOAP contract)
* pb (maybe api): generated code from protobuf
* test: for your microservices’ integration

___#FILES:___
* Dockerfile & .dockerignore: containerize your application to make it perfectly easy to be runnable at any present infrastructure.
* .git & .gitignore: git version control is currently the best choice for managing your project.
* Makefile: create an incredibly convenient quick command.
* README.md: definitely the soul of your project.
* tools.go: add your go build tools dependency.

---
# END