# Selfhost Outline with sensible SSO for your club

## Why

Knowledge managament in student organisations becomes more important as they age and people finish studies.

Outline is quite nice and modern wiki software. It is simple and integrates well with a lot of cloud based tools that we use in our operation.

## How

- single docker-compose file
- no magic yaml generation
- no searching through configs for relevant variables
- parametrize through .env docker-file
- services should share resources like database, redis, media storage
- it should serve beyond wiki: authentik can be used for different self-hosted apps

Work in progress, secrets will be removed. I took them for different project ¯\_(ツ)_/¯
https://github.com/vicalloy/outline-docker-compose
