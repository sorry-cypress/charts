# Sorry Cypress (Helm Chart)

<div align="center">
<div>:octocat: An open-source, on-premise, self-hosted alternative to Cypress dashboard :evergreen_tree:</div>
</div>

<br />

<a href="https://join.slack.com/t/sorry-cypress/shared_invite/zt-eis1h6jl-tJELaD7q9UGEhMP8WHJOaw" target="_blank">![Join slack](https://img.shields.io/badge/join-slack-orange?logo=slack)<a/><br />
<a href="https://artifacthub.io/packages/helm/sorry-cypress/sorry-cypress" target="_blank">![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/sorry-cypress)<a/><br />

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
### Helm Chart

https://sorry-cypress.dev/api#configuration

| Parameter                             | Description                                                                                  | Default                     |
|---------------------------------------|----------------------------------------------------------------------------------------------|-----------------------------|
| `.fullnameOverride`                   | Allows you to override the name of the chart.                                                | ``                          |
| `imagePullSecrets`                    | An array of imagePullSecrets used to download images from a private registry.                | `[]`                        |
### API service

https://sorry-cypress.dev/api#configuration

| Parameter                             | Description                                                                                  | Default                     |
|---------------------------------------|----------------------------------------------------------------------------------------------|-----------------------------|
| `api.image.repository`                | Image repository                                                                             | `agoldis/sorry-cypress-api` |
| `api.image.tag`                       | Image tag                                                                                    | ``                          |
| `api.image.pullPolicy`                | Image pull policy                                                                            | `Always`                    |
| `api.enabled`                         | Whether to deploy the API service                                                            | `true`                      |
| `api.resources`                       | Resources to initialize the container                                                        | `{}`                        |
| `api.podAnnotations`                  | Set annotations for pods                                                                     | `{}`                        |
| `api.podLabels`                       | Set additional labels for pods                                                               | `{}`                        |
| `api.affinity`                        | Set affinity for pods                                                                        | `{}`                        |
| `api.nodeSelector`                    | Set node selector for pods                                                                   | `{}`                        |
| `api.tolerations`                     | Set tolerations for pods                                                                     | `[]`                        |
| `api.service.port`                    | Kubernetes service port                                                                      | `4000`                      |
| `api.readinessProbe.enabled`          | Enables a readiness probe for the pod                                                        | `false`                     |
| `api.readinessProbe.periodSeconds`    | How often (in seconds) to perform the probe.                                                 | `5`                         |
| `api.readinessProbe.timeoutSeconds`   | Number of seconds after which the probe times out.                                           | `3`                         |
| `api.readinessProbe.successThreshold` | Minimum consecutive successes for the probe to be considered successful after having failed. | `2`                         |
| `api.readinessProbe.failureThreshold` | When a probe fails, Kubernetes will try `failureThreshold` times before giving up.           | `5`                         |
| `api.ingress.ingressClassName`        | The IngressClass that should be used to implement this Ingress                               | `nginx`                     |
| `api.ingress.labels`                  | Ingress labels                                                                               | `{}`                        |
| `api.ingress.annotations`             | Ingress annotations                                                                          | `{}`                        |
| `api.ingress.hosts[0].host`           | Hostname to the service installation                                                         | `api.chart-example.local`   |
| `api.ingress.hosts[0].path`           | Root path to the service installation                                                        | `/`                         |
| `api.ingress.tls`                     | Ingress secrets for TLS certificates                                                         | `[]`                        |
| `api.initContainers`                  | Allows you to define init container(s) for the api pod                                       | `[]`                        |

### Dashboard service

https://sorry-cypress.dev/dashboard#configuration

| Parameter                                                 | Description                                                                                                | Default                           |
|-----------------------------------------------------------|------------------------------------------------------------------------------------------------------------|-----------------------------------|
| `dashboard.image.repository`                              | Image repository                                                                                           | `agoldis/sorry-cypress-dashboard` |
| `dashboard.image.tag`                                     | Image tag                                                                                                  | ``                                |
| `dashboard.image.pullPolicy`                              | Image pull policy                                                                                          | `Always`                          |
| `dashboard.enabled`                                       | Whether to deploy the Dashboard service                                                                    | `true`                            |
| `dashboard.resources`                                     | Resources to initialize the container                                                                      | `{}`                              |
| `dashboard.environmentVariables.ciUrl`                    | Set the `CI_URL` optional environment variable to add a link to your CI tool                               | `""`                              |
| `dashboard.environmentVariables.graphQlClientCredentials` | Set the `GRAPHQL_CLIENT_CREDENTIALS` environment variable to configure the API service client credentials. | `""`                              |
| `dashboard.environmentVariables.graphQlSchemaUrl`         | Set the `GRAPHQL_SCHEMA_URL` environment variable to configure the URL of API service.                     | `""`                              |
| `dashboard.podAnnotations`                                | Set annotations for pods                                                                                   | `{}`                              |
| `dashboard.podLabels`                                     | Set additional labels for pods                                                                             | `{}`                              |
| `dashboard.affinity`                                      | Set affinity for pods                                                                                      | `{}`                              |
| `dashboard.nodeSelector`                                  | Set node selector for pods                                                                                 | `{}`                              |
| `dashboard.tolerations`                                   | Set tolerations for pods                                                                                   | `[]`                              |
| `dashboard.service.port`                                  | Kubernetes service port                                                                                    | `4000`                            |
| `dashboard.ingress.enabled`                               | Flag to define if the dashboard service ingress is enabled                                                 | `true`                            |
| `dashboard.ingress.ingressClassName`                      | The IngressClass that should be used to implement this Ingress                                             | `nginx`                           |
| `dashboard.ingress.labels`                                | Ingress labels                                                                                             | `{}`                              |
| `dashboard.ingress.annotations`                           | Ingress annotations                                                                                        | `{}`                              |
| `dashboard.ingress.hosts[0].host`                         | Hostname to the service installation                                                                       | `dashboard.chart-example.local`   |
| `dashboard.ingress.hosts[0].path`                         | Root path to the service installation                                                                      | `/`                               |
| `dashboard.ingress.tls`                                   | Ingress secrets for TLS certificates                                                                       | `[]`                              |
| `dashboard.initContainers`                                | Allows you to define init container(s) for the dashboard pod                                               | `[]`                              |

### Director service

https://sorry-cypress.dev/director/configuration

| Parameter                                         | Description                                                                                                                                                                  | Default                          |
|---------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------|
| `director.serviceAccount.name`                    | Service account to be assumed by the director                                                                                                                                | `~`                              |
| `director.serviceAccount.create`                  | Set to create the service account for the director                                                                                                                           | `false`                          |
| `director.serviceAccount.annotations`             | Annotations to set on the service account if created                                                                                                                         | `[]`                             |
| `director.image.repository`                       | Image repository                                                                                                                                                             | `agoldis/sorry-cypress-director` |
| `director.image.tag`                              | Image tag                                                                                                                                                                    | ``                               |
| `director.image.pullPolicy`                       | Image pull policy                                                                                                                                                            | `Always`                         |
| `director.resources`                              | Resources to initialize the container                                                                                                                                        | `{}`                             |
| `director.environmentVariables.allowedKeys`       | Define the list of comma delimited record keys (provided to the Cypress Runner using `--key` option). Empty or not provided variable means that all record keys are allowed. | `""`                             |
| `director.environmentVariables.dashboardUrl`      | The "Run URL" in the Cypress client                                                                                                                                          | `""`                             |
| `director.environmentVariables.executionDriver`   | Set the execution driver. Valid options are `"../execution/in-memory"` and `"../execution/mongo/driver"`                                                                     | `"../execution/in-memory"`       |
| `director.environmentVariables.screenshotsDriver` | Set the screenshots driver. Valid options are `"../screenshots/dummy.driver"` and `"../screenshots/s3.driver"`                                                               | `"../screenshots/dummy.driver"`  |
| `director.environmentVariables.inactivityTimeoutSeconds`       | Set the timeout of all test runs under your projects. |  `180s` |
| `director.podAnnotations`                         | Set annotations for pods                                                                                                                                                     | `{}`                             |
| `director.podLabels`                              | Set additional labels for pods                                                                                                                                               | `{}`                             |
| `director.affinity`                               | Set affinity for pods                                                                                                                                                        | `{}`                             |
| `director.nodeSelector`                           | Set node selector for pods                                                                                                                                                   | `{}`                             |
| `director.tolerations`                            | Set tolerations for pods                                                                                                                                                     | `[]`                             |
| `director.service.port`                           | Kubernetes service port                                                                                                                                                      | `4000`                           |
| `director.ingress.enabled`                        | Flag to define if the director service ingress is enabled                                                                                                                    | `true`                           |
| `director.ingress.ingressClassName`               | The IngressClass that should be used to implement this Ingress                                                                                                               | `nginx`                           |
| `director.ingress.labels`                         | Ingress labels                                                                                                                                                               | `{}`                             |
| `director.ingress.annotations`                    | Ingress annotations                                                                                                                                                          | `{}`                             |
| `director.ingress.hosts[0].host`                  | Hostname to the service installation                                                                                                                                         | `director.chart-example.local`   |
| `director.ingress.hosts[0].path`                  | Root path to the service installation                                                                                                                                        | `/`                              |
| `director.ingress.tls`                            | Ingress secrets for TLS certificates                                                                                                                                         | `[]`                             |
| `director.initContainers`                         | Allows you to define init container(s) for the director pod                                                                                                                  | `[]`                             |

### Mongodb service

If the execution driver is set to `"../execution/mongo/driver"`, you may enable the internal MongoDB service deploy or provide an external one. Ignore this configuration when using other execution drivers.

| Parameter                      | Description                                                                        | Default         |
|--------------------------------|------------------------------------------------------------------------------------|-----------------|
| `mongodb.internal_db.enabled`    | If enabled, it will deploy the internal MongoDB service.                           | `true`          |
| `mongodb.external_db.enabled`    | If enabled, it will allow you to use an external mongodb                           | `false`          |
| `mongodb.external_db.mongoServer`| The mongo server when providing an external one. Use it with `mongodb.internal_db.enabled=false` | `""`            |
| `mongodb.mongoDatabase`          | The mongo database                                                                 | `sorry-cypress` |
| `mongodb.mongoConnectionString`  | Ignored if blank. Set a custom mongodb connection string.                          | `""` |
| `mongodb.mongoSecretConnectionString.enableSecret`  |   If enabled, a Kubernetes secret is created from `mongodb.mongoConnectionString`. Use either enableSecret or enableCustomSecret, not both.    | `false` |
| `mongodb.mongoSecretConnectionString.enableCustomSecret`  |   If enabled, an alternative secrets manager can be used by creating a custom Kubernetes secret. Use either enableSecret or enableCustomSecret, not both. `mongodb.mongoConnectionString` should be set to a dummy value.  | `false` |


All other mongodb options are defined in [the Bitnami mongo db helm chart](https://github.com/bitnami/charts/blob/master/bitnami/mongodb/values.yaml).

### Screenshots And Videos

For saving screenshot you need to configure screenshots driver.
Currently only S3 and MinIO supported and for s3 you should use `"../screenshots/s3.driver"`.
https://sorry-cypress.dev/director/storage

## S3

| Parameter                     | Description                                                                                                       | Default                      |
| ----------------------------- | ----------------------------------------------------------------------------------------------------------------- | ---------------------------- |
| `s3.bucketName`               | Set the screenshots storage bucket name                                                                           | `example-bucket`             |
| `s3.region`                   | Set the screenshots storage bucket region                                                                         | `us-east-1`                  |
| `s3.acl`                      | The uploaded video/screenshot object ACL                                                                          | `"public-read"`              |
| `s3.readUrlPrefix`            | The host to load the video/screenshot in the dashboard (defaults to the bucket URL)                               | `""`                         |
| `s3.accessKey`                | The `AWS_ACCESS_KEY_ID` environment variable to configure AWS credentials                                         | `""`                         |
| `s3.secretAccessKey`          | The `AWS_SECRET_ACCESS_KEY` environment variable to configure AWS credentials                                     | `""`                         |
| `s3.ingress.enabled`          | Flag to define if the S3 ingress is enabled. **It will also enable an ExternalName service to expose the bucket** | `false`                       |
| `s3.ingress.ingressClassName` | The IngressClass that should be used to implement this Ingress                                                    | `nginx`                      |
| `s3.ingress.labels`           | Ingress labels                                                                                                    | `{}`                         |
| `s3.ingress.annotations`      | Ingress annotations                                                                                               | `{}`                         |
| `s3.ingress.hosts[0].host`    | Hostname to the service installation                                                                              | `static.chart-example.local` |
| `s3.ingress.hosts[0].path`    | Root path to the service installation                                                                             | `/`                          |
| `s3.ingress.tls`              | Ingress secrets for TLS certificates                                                                              | `[]`                         |

### IAM roles for AWS EKS Service Accounts

Rather than specifying a static IAM Access Key, on EKS it's possible for a pod to assume an IAM Role instead, which means no sensitive credentials are needed.

Using `director.serviceAccount` properties a service account can be created for the director, assigning the IAM Role ARN:

```yaml
director:
  serviceAccount:
    name: sorry-cypress-director
    create: true
    annotations:
      eks.amazonaws.com/role-arn: arn:aws:iam::<ACCOUNT_ID>:role/<IAM_ROLE_NAME>
```

See https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html for further information on the IAM Role and associating the EKS Identity Provider to IAM.

### MinIO

We use MinIO As subchart, so you can also add other variables from [minio chart](https://github.com/minio/charts/tree/master/minio).
Currently only S3 and MinIO supported and for MinIO you should use `"../screenshots/minio.driver"`.
https://sorry-cypress.dev/director/storage
| Parameter                     | Description                                                                                                                                                                                    | Default                         |
| ----------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------- |
| `minio.enabled`               | If enabled, it will deploy the internal MinIO service.                                                                                                                                         | `false`                         |
| `minio.endpoint`              | Hostname or IP address that both director and cypress agents will use to communicate with minio service.                                                                                       | `storage.yourdomain.com`        |
| `minio.url`                   | The public URL used for public read access to the stored screenshots and videos. This URL should be available from your browser and it will be used to fetch generated screenshots and videos. | `http://storage.yourdomain.com` |
| `minio.defaultBucket.enabled` | Creates bucket when MinIO installed                                                                                                                                                            | `true`                          |
| `minio.defaultBucket.name`    | The name of the bucket in MinIO that Sorry Cypress should use                                                                                                                                  | `sorry-cypress`                 |
| `minio.persistence.size`      | Size of persistent volume claim of MinIO	                                                                                                                                                     | `10Gi`                          |

### Sorry Cypress Run Cleaner

If you wish to have older runs regularly removed from the database, you can enable this.
For more information, refer to https://github.com/sendible-labs/sorry-cypress-run-cleaner

| Parameter                     | Description                                                                                                                                                                                    | Default                         |
| ----------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------- |
| `runCleaner.enabled`          | If enabled, it will deploy the sorry-cypress run cleaner cronjob                                                                                                                               | `false`                         |
| `runCleaner.daysToKeep`       | How many days worth of run data to keep in the database. Anything older is deleted. If omitted and `runCleaner.enabled` is true, it will default to 100d.                                      | `200`                           |
| `runCleaner.schedule`         | The cron schedule to run the runCleaner task                                                                                                                                                   | `'0 1 * * *'`                   |
| `runCleaner.clusterDomain`    | Cluster domain, necessary to resolve api host                                                                                                                                                  | `'cluster.local'`               |
