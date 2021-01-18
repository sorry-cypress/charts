# Sorry Cypress (Helm Chart)

<div align="center">
<div><img src="https://sorry-cypress.dev/public/octolumbercat.png" width="256" /></div>
<div>:octocat: An open-source, on-premise, self-hosted alternative to Cypress dashboard :evergreen_tree:</div>
</div>

<br />

<a href="https://join.slack.com/t/sorry-cypress/shared_invite/zt-eis1h6jl-tJELaD7q9UGEhMP8WHJOaw" target="_blank">![Join slack](https://img.shields.io/badge/join-slack-orange?logo=slack)<a/><br />
<a href="https://artifacthub.io/packages/search?repo=sorry-cypress" target="_blank">![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/sorry-cypress)<a/><br />

## Get Repo Info

```console
$ helm repo add sorry-cypress https://sorry-cypress.github.io/charts
$ helm repo update
```

_See [helm repo](https://helm.sh/docs/helm/helm_repo/) for command documentation._

## Install Chart

```console
# Helm 3
$ helm install [RELEASE_NAME] sorry-cypress/sorry-cypress [flags]
```

_See [helm install](https://helm.sh/docs/helm/helm_install/) for command documentation._

## Uninstall Chart

```console
# Helm 3
$ helm uninstall [RELEASE_NAME]
```

This removes all the Kubernetes components associated with the chart and deletes the release.

_See [helm uninstall](https://helm.sh/docs/helm/helm_uninstall/) for command documentation._

## Upgrade Chart

Upgrade the chart deployment using:

```console
# Helm 3
$ helm upgrade [RELEASE_NAME] sorry-cypress/sorry-cypress [flags]
```

_See [helm upgrade](https://helm.sh/docs/helm/helm_upgrade/) for command documentation._

## Configuration

The following table lists the configurable parameters of the sorry-cypress chart and their default values.

### API service

https://sorry-cypress.dev/api#configuration

| Parameter                   | Description                           | Default                     |
| --------------------------- | ------------------------------------- | --------------------------- |
| `api.image.repository`      | Image repository                      | `agoldis/sorry-cypress-api` |
| `api.image.tag`             | Image tag                             | `latest`                    |
| `api.image.pullPolicy`      | Image pull policy                     | `Always`                    |
| `api.resources`             | Resources to initialize the container | `{}`                        |
| `api.podAnnotations`        | Set annotations for pods              | `{}`                        |
| `api.podLabels`             | Set additional labels for pods        | `{}`                        |
| `api.service.port`          | Kubernetes service port               | `4000`                      |
| `api.ingress.labels`        | Ingress labels                        | `{}`                        |
| `api.ingress.annotations`   | Ingress annotations                   | `{}`                        |
| `api.ingress.hosts[0].host` | Hostname to the service installation  | `api.chart-example.local`   |
| `api.ingress.tls`           | Ingress secrets for TLS certificates  | `[]`                        |

### Dashboard service

https://sorry-cypress.dev/dashboard#configuration

| Parameter                                         | Description                                                                    | Default                           |
| ------------------------------------------------- | ------------------------------------------------------------------------------ | --------------------------------- |
| `dashboard.image.repository`                      | Image repository                                                               | `agoldis/sorry-cypress-dashboard` |
| `dashboard.image.tag`                             | Image tag                                                                      | `latest`                          |
| `dashboard.image.pullPolicy`                      | Image pull policy                                                              | `Always`                          |
| `dashboard.resources`                             | Resources to initialize the container                                          | `{}`                              |
| `dashboard.environmentVariables.ciUrl`            | Set optional environment variable `CI_URL` to add a link to your CI tool       | `""`                              |
| `dashboard.environmentVariables.graphQlSchemaUrl` | Set the environment variable `GRAPHQL_SCHEMA_URL` with the URL of API service. | `""`                              |
| `dashboard.podAnnotations`                        | Set annotations for pods                                                       | `{}`                              |
| `dashboard.podLabels`                             | Set additional labels for pods                                                 | `{}`                              |
| `dashboard.service.port`                          | Kubernetes service port                                                        | `4000`                            |
| `dashboard.ingress.enabled`                       | Flag to define if the dashboard service ingress is enabled                     | `true`                            |
| `dashboard.ingress.labels`                        | Ingress labels                                                                 | `{}`                              |
| `dashboard.ingress.annotations`                   | Ingress annotations                                                            | `{}`                              |
| `dashboard.ingress.hosts[0].host`                 | Hostname to the service installation                                           | `dashboard.chart-example.local`   |
| `dashboard.ingress.tls`                           | Ingress secrets for TLS certificates                                           | `[]`                              |

### Director service

https://sorry-cypress.dev/director/configuration

| Parameter                                         | Description                                                                                                                                                                  | Default                          |
| ------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------- |
| `director.image.repository`                       | Image repository                                                                                                                                                             | `agoldis/sorry-cypress-director` |
| `director.image.tag`                              | Image tag                                                                                                                                                                    | `latest`                         |
| `director.image.pullPolicy`                       | Image pull policy                                                                                                                                                            | `Always`                         |
| `director.resources`                              | Resources to initialize the container                                                                                                                                        | `{}`                             |
| `director.environmentVariables.allowedKeys`       | Define the list of comma delimited record keys (provided to the Cypress Runner using `--key` option). Empty or not provided variable means that all record keys are allowed. | `""`                             |
| `dashboard.environmentVariables.dashboardUrl`     | The "Run URL" in the Cypress client                                                                                                                                          | `""`                             |
| `director.environmentVariables.executionDriver`   | Set the execution driver. Valid options are `"../execution/in-memory"` and `"../execution/mongo/driver"`                                                                     | `"../execution/in-memory"`       |
| `director.environmentVariables.screenshotsDriver` | Set the screenshots driver. Valid options are `"../screenshots/dummy.driver"` and `"../screenshots/s3.driver"`                                                               | `"../screenshots/dummy.driver"`  |
| `director.podAnnotations`                         | Set annotations for pods                                                                                                                                                     | `{}`                             |
| `director.podLabels`                              | Set additional labels for pods                                                                                                                                               | `{}`                             |
| `director.service.port`                           | Kubernetes service port                                                                                                                                                      | `4000`                           |
| `director.ingress.enabled`                        | Flag to define if the director service ingress is enabled                                                                                                                    | `true`                           |
| `director.ingress.labels`                         | Ingress labels                                                                                                                                                               | `{}`                             |
| `director.ingress.annotations`                    | Ingress annotations                                                                                                                                                          | `{}`                             |
| `director.ingress.hosts[0].host`                  | Hostname to the service installation                                                                                                                                         | `director.chart-example.local`   |
| `director.ingress.tls`                            | Ingress secrets for TLS certificates                                                                                                                                         | `[]`                             |

### Mongo service

If the execution driver is set to `"../execution/mongo/driver"`, you may enable the internal MongoDB service deploy or provide an external one. Ignore this configuration when using other execution drivers.

| Parameter                      | Description                                                                        | Default         |
| ------------------------------ | ---------------------------------------------------------------------------------- | --------------- |
| `mongo.enabled`                | If enabled, it will deploy the internal MongoDB service.                           | `false`         |
| `mongo.mongoDatabase`          | The mongo database                                                                 | `sorry-cypress` |
| `mongo.mongoServer`            | The mongo server when providing an external one. Use it with `mongo.enabled=false` | `""`            |
| `mongo.image.repository`       | Image repository                                                                   | `mongo`         |
| `mongo.image.tag`              | Image tag                                                                          | `"4.0"`         |
| `mongo.image.pullPolicy`       | Image pull policy                                                                  | `Always`        |
| `mongo.persistence.enabled`    | Flag for enabling persistent storage                                               | `false`         |
| `mongo.persistence.accessMode` | Volumes access mode to be set                                                      | `ReadWriteOnce` |
| `mongo.persistence.size`       | Size of the volume                                                                 | `1Gi`           |
| `mongo.resources`              | Resources to initialize the container                                              | `{}`            |
| `mongo.podAnnotations`         | Set annotations for pods                                                           | `{}`            |
| `mongo.podLabels`              | Set additional labels for pods                                                     | `{}`            |
| `mongo.service.port`           | Kubernetes service port                                                            | `4000`          |

### S3

If the screenshots driver is set to `"../screenshots/s3.driver"`, you must configure the bucket settings. You may also enable an external host to it by enabling its ingress.
Ignore this configuration when using other screenshots drivers.

| `s3.bucketName` | Set the screenshots storage bucket name | `example-bucket` |
| `s3.region` | Set the screenshots storage bucket region | `us-east-1` |
| `s3.acl` | The uploaded video/screenshot object ACL | `"public-read"` |
| `s3.readUrlPrefix` | The host to load the video/screenshot in the dashboard (defaults to the bucket URL) | `""` |
| `s3.accessKey` | The `AWS_ACCESS_KEY_ID` environment variable to configure AWS credentials | `""` |
| `s3.secretAccessKey` | The `AWS_SECRET_ACCESS_KEY` environment variable to configure AWS credentials | `""` |

> Note: enabling Ingress will also enable an ExternalName service.
