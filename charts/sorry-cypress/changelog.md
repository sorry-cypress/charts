# 1.15
- Set `runCleaner.tolerations` values

# 1.14
- Update app to version `2.5.3`

# 1.13.3
- Fixed extra environment variables for director and dashboard deployments

# 1.13.2
- Add option to include addional environment variables for the director, dashboard and api containers

# 1.13.1
- Add option to add annotations and labels to the runCleaner cronjob pods
- Allow to specify the container security context to the runCleaner cronjob pods

# 1.13.0
- Update sorry-cypress version to 2.5.2

# 1.12.0
- Add option to provide director record keys through a custom Kubernetes secret.

# 1.11.1
- Set `runCleaner.resources` values

# 1.11.0
- Add custom security context in sorry-cypress deployments

# 1.10.0
- Allow MongoDB name to be defined by a secret
- Mount certificate in the containers

# 1.9.0
- Add option to specify name of config map used for the certificate bundle to the mongodb connection.
# 1.8.1
- [Sorry Cypress 2.5.1](https://github.com/sorry-cypress/sorry-cypress/releases/tag/v2.5.1)

# 1.8.0
- Add option to connect to mongodb using a certificate bundle.
# 1.7.10
- Add S3_VIDEO_KEY_PREFIX env var to director.
- Add S3_IMAGE_KEY_PREFIX env var to director.

# 1.7.9
- Add new variable to enable or disable the Apollo playground landing page on API root.
- Allow user configuration of API PAGE_ITEMS_LIMIT

https://docs.sorry-cypress.dev/configuration/api-configuration

# 1.7.8
- [Sorry Cypress 2.4.2](https://github.com/sorry-cypress/sorry-cypress/releases/tag/v2.4.2)
- Add `director.environmentVariables.gitlabJobRetries` to enable Gitlab job retries feature.

# 1.7.7

- [Sorry Cypress 2.4.1](https://github.com/sorry-cypress/sorry-cypress/releases/tag/v2.4.1)

# 1.7.6
[Sorry Cypress 2.3.3](https://github.com/sorry-cypress/sorry-cypress/releases/tag/v2.3.3)

# 1.7.5
[Sorry Cypress 2.3.2](https://github.com/sorry-cypress/sorry-cypress/releases/tag/v2.3.2)

# 1.7.4
Update apiVersion for Cronjob template to `batch/v1` and PodDisruptionBudget to `policy/v1` since `v1beta1` is deprecated in v1.21+.

# 1.7.3
Allows to use  `priorityClassName` in all services.

# 1.7.2
[Sorry Cypress 2.3.1](https://github.com/sorry-cypress/sorry-cypress/releases/tag/v2.3.1)

# 1.7.1
[Sorry Cypress 2.3.0](https://github.com/sorry-cypress/sorry-cypress/releases/tag/v2.3.0)

# 1.7.0
Add Azure Blob Storage support

# 1.6.5
Add `minio.readUrlPrefix` value to be able to override the whole read URL to MinIO.

# 1.6.4
[Sorry Cypress 2.2.1](https://github.com/sorry-cypress/sorry-cypress/releases/tag/v2.2.1)

# 1.6.3
[Sorry Cypress 2.2.0](https://github.com/sorry-cypress/sorry-cypress/releases/tag/v2.2.0)

# 1.6.2
[Sorry Cypress 2.1.7](https://github.com/sorry-cypress/sorry-cypress/releases/tag/v2.1.7)

# 1.6.1
Optionally allows for NodePort on the sorry-cypress services (third party services can be controlled via their own chart values).
We still default to ClusterIP.

# 1.6.0
We no longer test against K8s 1.21 as it is no longer supported: https://kubernetes.io/releases/

Added 1.24 to the CI.

# 1.5.5
Fix `sorry-cypress-run-cleaner` image by making use of `runCleaner.image.repository` and `runCleaner.image.tag` values.

# 1.5.4
Add `runCleaner.image.repository` and `runCleaner.image.tag` values to be able to specify `sorry-cypress-run-cleaner` cronjobs image to be used.

# 1.5.3
Update
Adds the possibility to specify a custom secret name and or secret key for the mongodb connection secret.
Removes the necessity to set `mongodb.mongoConnectionString` to a dummy value when `mongodb.mongoSecretConnectionString.enableCustomSecret` is set to `true`.

# 1.5.2
Update
Makes use of the /health-check-db endpoint on the director to provide a readiness probe.

# 1.5.1
No change. Accidental release (sorry!)

# 1.5.0

## Update
Makes MongoDB connection string secrets configurable. Adds default Kubernetes secret for MongoDB connection string. Allows for alternative secret stores using custom Kubernetes secret.

# 1.4.17

## Update
Sorry Cypress 2.1.6

# 1.4.16

## Update
Sorry Cypress 2.1.5

# 1.4.15

## Update
Sorry Cypress 2.1.4

# 1.4.14

## Update
???

# 1.4.13

## Update
Sorry Cypress 2.1.2

# 1.4.12

## Bugfix
Fixes an issue that prevents MINIO_USESSL being always false

# 1.4.11

## Update
Makes pathType configurable per ingress. `.Values.(api|dashboard|...).ingress.hosts.*.pathType`. Default retained at: `Prefix`

# 1.4.10

## Update
Makes Deployment replicas configurable. Anti-affinity configured to hard node and soft zone. Added PodDisruptionBudget

# 1.4.9

## Bugfix
Makes the cluster domain configurable for the clean up job to prevent failing jobs.

# 1.4.8

## Bugfix
Fixes an issue that prevented the usage of the MiniO default port.

# 1.4.7

## Bugfix
Fixes an issue that prevented the director service port being changed to anything other than `1234`.

# 1.4.6

## Update
Adds the standard `imagePullSecrets` section to the `api`, `dashboard` and `director` templates, which allow downloading images from a private registry.

# 1.4.5

## Bugfix
Fixes an issue that prevented the configuration of the director service port from being applied.
# 1.4.4
## Update
Sorry Cypress 2.1.1

# 1.4.3
## Bugfix
Update icon file within chart.

# 1.4.2
## Bugfix
Fixes run-cleaner path to the sorry-cypress API service

# 1.4.1
## Update
Allows you to install the sorry-cypress-run-cleaner cronjob to delete old runs from the database.
Disabled by default.
https://github.com/sendible-labs/sorry-cypress-run-cleaner

# 1.4.0
## Update
Sorry Cypress 2.1.0
# 1.3.1
## Update
Sorry Cypress 2.0.1.


# 1.3.0
## Update
Sorry Cypress 2.0.0.

# 1.2.0
## Update
Add support for authentication using IAM role for ServiceAccounts on EKS

`director.serviceAccountName` changed to `director.serviceAccount.name` with backwards compatibility for the former

# 1.1.1
## Update
Director serviceaccount name is now user-editable (via values)

# 1.1.0
## Update
Only Kubernetes 1.19+ is supported.
This means we only support `networking.k8s.io/v1`.
Latest stable Sorry Cypress version (1.1.1)

# 1.0.9
## Fix
Remove hard-coded namespace from service-s3.

# 1.0.0
## Breaking Changes
Uses the bitnami mongodb helm chart. There is no automated upgrade path from previous versions... you will have to manually migrate data.

Here are some very basic instructions on how you could manually migrate the data.
### Exec into the old mongo db pod and perform a backup:
```
cd /data
mongodump --out=/tmp/backup
cd /tmp
tar -Pczvf backup.tar.gz backup/
```

### copy the db dump from the pod
```
kubectl cp my-pod:my-file my-file
```

Eg:
```
kubectl cp sorry-cypress-mongo-0:/tmp/backup.tar.gz ~/Desktop/backup.tar.gz
```


### switch to the new context and copy file:
```
kubectl cp ~/Desktop/backup.tar.gz dev-sorry-cypress-mongodb-0:/tmp/
```

### Exec into the pod and restore
```
cd /tmp
tar -xvzf backup.tar.gz
cd /bitnami/mongodb/data
mongorestore --drop /tmp/backup
```
