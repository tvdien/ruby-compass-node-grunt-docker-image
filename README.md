## How to use

### With docker-composer

* create a `docker-compose.yml` include the following code

```
version: '3.7'
services:
  frontend_builder:
    build:
      context: .docker/frontend_builder
    volumes:
      - ./:/data
    environment:
      FRONTEND_SOURCE_PATH: /data/frontend_src
```

* `docker-compose run --rm frontend_builder build-production` will run `build-production` task which defined in your grunt tasks.
(After grunt task has completed, this container will be removed.)
