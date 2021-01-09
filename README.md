
# Generic Server

## Motivation

This is a generic server made with NestJS to prevent constant rewrites when working on local development.

## Installation

### Scripts

To run application on local machine in development mode

    npm run start

To run application on local machine in watch mode

    npm run start:dev

To run application on local machine in production mode

    npm run start:prod

### Makefile

To run application Docker automation scripts

    make docker

### Docker

To [create](https://docs.docker.com/engine/reference/commandline/image_build/) Docker image

    docker build -t <image-name>:<tag> .

To [list](https://docs.docker.com/engine/reference/commandline/images/) available Docker image(s)

    docker images

To [run](https://docs.docker.com/engine/reference/run/) Docker container

    docker run -d -p <localhost-port>:<container-port> <image-name>:<tag>

To [list](https://docs.docker.com/engine/reference/commandline/ps/) running Docker container(s)

    docker ps

To [stop](https://docs.docker.com/engine/reference/commandline/stop/) running Docker container(s)  

    docker stop <container-id>

To [remove](https://docs.docker.com/engine/reference/commandline/image_rm/) Docker image(s)

    docker image rm <image-id>

## Documentation

### Conventions

#### Commits

The [commitlint](https://commitlint.js.org/#/) enforces best practices together with [commitlint Jira rules](https://github.com/Gherciu/commitlint-jira). In general the commit message issue prefix / label must comply with [default Jira status labels](https://confluence.atlassian.com/adminjiracloud/issue-statuses-priorities-and-resolutions-973500867.html) which follow task ID (from Jira board or similar), task description (as abbreviation), and commit message which must be in present tense. These must all be in capital letters.

Format

    git commit -m "[<ISSUE-PREFIX>]<TASK-ID>: [<TASK-DESCRIPTION>] <message>"

As an example

    git commit -m "[CLOSED]TASK-1: [CONF] Create .gitlab-ci.yml production branch CI / CD pipeline

The exception to this are situations when there are merge conflicts which require resolution in main branches (see **Branches**). In order to comply with commitlint rules task ID must contain branch name which follows branch name and postfix calendar date as [ISO 8601 -standard](https://en.wikipedia.org/wiki/ISO_8601) (YYYYMMDD).

Format

    git commit -m "<BRANCH>-<YYYYMMDD>: [MERGE] <message>"

As an example

    git commit -m "DEVELOPMENT-20200101: [MERGE] Preserve .gitlab-ci.yml deploy-production block"

##### Task descriptions

 - [CONF] Informs that the ticket task description concerns configuration
 - [FEAT]	Informs that the ticket task description concerns feature / capability
 - [UPDT] Informs that the ticket task description concerns update to an existing feature / capability
 - [FIX] Informs that the ticket task description concerns fix to a particular known issue / bug

*The option to include custom commit rules to include all possible scenarios is up to later consideration*

#### Branches

##### Overview

There are three main branches — development, staging, and production. These branches contain CI / CD pipeline which builds to corresponding domain / FQDN ex. https://<branch>.<domain>.<domain-extension>
```mermaid

graph LR

T(Ticket) --> D(Development)
T(Ticket) --> F(Feature)
F --> D
D --> M(Master)
M --> S(Staging)
S --> P(Production)

```

#####  Ticket

The ticket branch can branch out from either development branch or feature branch. Once complete the ticket branch merges always back to its parent branch.

The only exceptions are unconventional situations where there is requirement to ex. cherry pick a particular commit higher in the tree to patch issues which require immediate attention.

The ticket branch name derives from Jira board in use.

##### Feature

The feature branch can branch out only from the development branch. Once complete the feature branch merges always back to its parent branch.

The feature branch name has "feature-" prefix which follows brief feature description ex. feature-password-reset.

##### Development

The development branch contains latest code.

##### Master

The master branch must contain at all times ready code ready for release to staging.

##### Staging

The staging branch must contain at all time ready code ready for release to production. Releases to this branch require appropriate version tag as a release candidate postfix and message.

Format

    git tag -a <semver>_rc<number> -m "<message>"

As an example

    git tag -a 1.0.0_rc1 -m "Release 1.0.0~rc1 to staging"

##### Production

The production branch contains latest official release. Releases to this branch require appropriate version tag and message.

Format

    git tag -a <semver> -m "<message>"

As an example

    git tag -a 1.0.0 -m "Release 1.0.0 to production"

#### Versions

The [Semantic Versioning](https://semver.org/) applies.
