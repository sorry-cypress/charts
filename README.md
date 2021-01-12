# Sorry Cypress (Helm Chart)

<div align="center">
<div><img src="https://sorry-cypress.dev/public/octolumbercat.png" width="256" /></div>
<div>:octocat: An open-source, on-premise, self-hosted alternative to Cypress dashboard :evergreen_tree:</div>
</div>

<br />

<a href="https://join.slack.com/t/sorry-cypress/shared_invite/zt-eis1h6jl-tJELaD7q9UGEhMP8WHJOaw" target="_blank">![Join slack](https://img.shields.io/badge/join-slack-orange?logo=slack)<a/>

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
