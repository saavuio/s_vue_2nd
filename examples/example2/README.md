Native dependencies: Docker, Git and Bash.

NOTE: all yarn operations need to be ran through Docker, so don't use the
native versions (such as `yarn install`). The s_vue_2nd.sh script
works as a wrapper for commands to be ran within a Docker container. Use
`./s_vue_2nd.sh yarn ...` to run yarn with any arguments inside the container.

See `dependencies/s_vue_2nd/package.json` for available scripts that can be
ran through `./s_vue_2nd.sh yarn run <NAME>`.

## Quick start
```
./dependencies/init.sh
./scripts/build.sh
./scripts/dev.sh
```

## Build dependencies
Dependencies contain a generic template with good development tools already
included.
```
./dependencies/init.sh
```

## Build app packages
This also gets stuff from inside container to allow editors such as vscode work
correctly.
```
./dependencies/build.sh
```

### Compiles and hot-reloads for development
Maps ports from the docker container to the host so that you can access
the app.
```
./scripts/dev.sh
```

## Add packages or install all
```
./s_vue_2nd.sh yarn add package-name
./s_vue_2nd.sh yarn install
```

### Compiles and minifies for production
```
./scripts/bundle.sh
```

### Lints and fixes files
```
./scripts/format.sh
```
