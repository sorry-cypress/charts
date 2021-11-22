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
