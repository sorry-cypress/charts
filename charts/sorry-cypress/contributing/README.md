Note. This only tests against the latest version of k8s. The actual CI tests against latest, latest-1, latest-2.

Prereqs:

- [k3d](https://k3d.io/)
- helm
- [yamllint](https://yamllint.readthedocs.io/en/stable/quickstart.html#installing-yamllint)



The script runs yamllint (via ct), and then creates a local cluster and runs the CI tests against them.

```
chmod +x ci.sh
./ci.sh
```



to delete the cluster:
```
k3d cluster delete sorry-cypress-helm
```