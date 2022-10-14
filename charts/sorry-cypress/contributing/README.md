Thank you for offering a contribution to the Sorry Cypress Helm charts.

In order to ensure some level of quality, there are a few hoops to jump through. Please do not create a Pull Request until you have performed all these steps:

1. Increase [the chart version](https://github.com/sorry-cypress/charts/blob/main/charts/sorry-cypress/Chart.yaml#L5).
2. Update the [chart readme](https://github.com/sorry-cypress/charts/blob/main/charts/sorry-cypress/README.md) to reflect your change.
3. Update the [chart changelog](https://github.com/sorry-cypress/charts/blob/main/charts/sorry-cypress/changelog.md) to reflect your change.
4. Update/add any [CI tests](https://github.com/sorry-cypress/charts/tree/main/charts/sorry-cypress/ci) to cover your change.
5. [Run the CI locally](https://github.com/sorry-cypress/charts/tree/main/charts/sorry-cypress/contributing/README.md).


# Running the CI locally

Note. This only tests against the latest version of k8s. The actual CI tests against latest, latest-1, latest-2.

## Prereqs:

- [k3d](https://k3d.io/)
- helm
- [yamllint](https://yamllint.readthedocs.io/en/stable/quickstart.html#installing-yamllint)


## To Run the CI
The script runs yamllint (via ct), and then creates a local cluster and runs the CI tests against them.

```
chmod +x ci.sh
./ci.sh
```

## To delete the cluster:
```
k3d cluster delete sorry-cypress-helm
```