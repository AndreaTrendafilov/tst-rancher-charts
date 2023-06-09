---
title: Ceph Operator Helm Chart
---
<!---
Document is generated by `make helm-docs`. DO NOT EDIT.
Edit the corresponding *.gotmpl.md file instead
-->

Installs [Koor Operator](https://github.com/koor-tech/koor-operator) to create, configure, and manage Koor Storage Distribution on Kubernetes.

## Introduction

This chart bootstraps a [Koor Operator](https://github.com/koor-tech/koor-operator) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

* Kubernetes 1.19+
* Helm 3.x

See the [Helm support matrix](https://helm.sh/docs/topics/version_skew/) for more details.

## Installing

The Ceph Operator helm chart will install the basic components necessary to create a storage platform for your Kubernetes cluster.

1. Add the Koor Helm repo
2. Install the Helm chart
3. [Create a Koor Storage cluster](https://docs.koor.tech/v1.11/Getting-Started/quickstart/#create-a-ceph-cluster).

The `helm install` command deploys the Koor Operator on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation. It is recommended that the Koor Operator be installed into the `koor-operator` namespace (you will install your clusters into separate namespaces).

```console
helm repo add koor-release https://charts.koor.tech/release
helm install --create-namespace --namespace koor-operator koor-operator koor-release/koor-operator -f values.yaml
```

For example settings, see the next section or [values.yaml](/charts/koor-operator/values.yaml).

## Configuration

The following table lists the configurable parameters of the rook-operator chart and their default values.

| Parameter | Description | Default |
|-----------|-------------|---------|
| `certmanager.enabled` | Enable cert-maanger | `true` |
| `certmanager.installCRDs` | If cert-manager's CRDs should be installed through Helm. | `true` |
| `controllerManager.kubeRbacProxy` | RBAC proxy configuration | `{"args":["--secure-listen-address=0.0.0.0:8443","--upstream=http://127.0.0.1:8080/","--logtostderr=true","--v=0"],"containerSecurityContext":{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]}},"image":{"repository":"gcr.io/kubebuilder/kube-rbac-proxy","tag":"v0.13.1"},"resources":{"limits":{"cpu":"500m","memory":"128Mi"},"requests":{"cpu":"5m","memory":"64Mi"}}}` |
| `controllerManager.kubeRbacProxy.containerSecurityContext` | RBAC proxy container security context | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]}}` |
| `controllerManager.kubeRbacProxy.image.repository` | Operator image repository | `"gcr.io/kubebuilder/kube-rbac-proxy"` |
| `controllerManager.kubeRbacProxy.image.tag` | Operator image tag | `"v0.13.1"` |
| `controllerManager.kubeRbacProxy.resources` | RBAC proxy container resources | `{"limits":{"cpu":"500m","memory":"128Mi"},"requests":{"cpu":"5m","memory":"64Mi"}}` |
| `controllerManager.manager` | Operator configuration | `{"args":["--health-probe-bind-address=:8081","--metrics-bind-address=127.0.0.1:8080","--leader-elect"],"containerSecurityContext":{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]}},"image":{"repository":"docker.io/koorinc/koor-operator","tag":"v0.1.0"},"resources":{"limits":{"cpu":"500m","memory":"512Mi"},"requests":{"cpu":"10m","memory":"128Mi"}}}` |
| `controllerManager.manager.containerSecurityContext` | Operator container security context | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]}}` |
| `controllerManager.manager.image.repository` | Operator image repository | `"docker.io/koorinc/koor-operator"` |
| `controllerManager.manager.image.tag` | Operator image tag | `"v0.1.0"` |
| `controllerManager.manager.resources` | Operator container resources | `{"limits":{"cpu":"500m","memory":"512Mi"},"requests":{"cpu":"10m","memory":"128Mi"}}` |
| `controllerManager.replicas` |  | `1` |
| `koorCluster` | Koor Cluster specification | `{"spec":{"dashboardEnabled":true,"monitoringEnabled":false,"toolboxEnabled":true,"useAllDevices":true}}` |
| `koorCluster.spec.dashboardEnabled` | Enable the Ceph MGR dashboard. | `true` |
| `koorCluster.spec.monitoringEnabled` | If monitoring should be enabled, requires the prometheus-operator to be pre-installed. | `false` |
| `koorCluster.spec.toolboxEnabled` | If the Ceph toolbox, should be deployed as well. | `true` |
| `koorCluster.spec.useAllDevices` | If all empty + unused devices of the cluster should be used. | `true` |
| `kubernetesClusterDomain` |  | `"cluster.local"` |
| `metricsService` | Metrics Service | `{"ports":[{"name":"https","port":8443,"protocol":"TCP","targetPort":"https"}],"type":"ClusterIP"}` |
| `webhookService` | Webhook service | `{"ports":[{"port":443,"protocol":"TCP","targetPort":9443}],"type":"ClusterIP"}` |

## Uninstalling the Chart

To see the currently installed Rook chart:

```console
helm ls --namespace koor-operator
```

To uninstall/delete the `koor-operator` deployment:

```console
helm delete --namespace koor-operator koor-operator
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## License

Copyright 2023 Koor Technologies, Inc. All rights reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
