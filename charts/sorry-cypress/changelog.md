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
