# oci-onm

![Version: 3.0.0](https://img.shields.io/badge/Version-3.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.0.0](https://img.shields.io/badge/AppVersion-3.0.0-informational?style=flat-square)

Helm chart for collecting Kubernetes logs & objects and metrics using Fluentd and ManagementAgent into OCI Logging Analytics and OCI Monitoring respectively.

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| file://../common | oci-onm-common | 3.0.0 |
| file://../logan | oci-onm-logan | 3.0.0 |
| file://../mgmt-agent | oci-onm-mgmt-agent | 3.0.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.kubernetesClusterID | string | `nil` | OKE OCID for an OKE cluster or an unique ID for other Kubernetes clusters. |
| global.kubernetesClusterName | string | `nil` | Provide a unique name for the cluster. This would help uniquely identifying the logs and metrics data at OCI Logging Analytics and OCI Monitoring respectivelt, when moitoring multiple clustersa |
| global.namespace | string | `"oci-onm"` | Kubernetes Namespace in which the resources to be created. Set oci-kubernetes-monitoring-common:createNamespace set to true, if the namespace doesn't exist. |
| global.resourceNamePrefix | string | `"oci-onm"` | Prefix to be attached to resources created through this chart. Not all resources may have this prefix. |
| oci-onm-common.createNamespace | bool | `true` | If createNamespace is set to true, it tries to create the namespace defined in 'namespace' variable. |
| oci-onm-common.createServiceAccount | bool | `true` | By default, a cluster role, cluster role binding and serviceaccount will be created for the monitoring pods to be able to (readonly) access various objects within the cluster, to support collection of various telemetry data. You may set this to false and provide your own serviceaccount which has the necessary cluster role(s) binded to it. Refer, README for the cluster role definition and other details. |
| oci-onm-common.namespace | string | `"{{ .Values.global.namespace }}"` | Kubernetes Namespace in which the serviceaccount to be created. |
| oci-onm-common.resourceNamePrefix | string | `"{{ .Values.global.resourceNamePrefix }}"` | Prefix to be attached to resources created through this chart. Not all resources may have this prefix. |
| oci-onm-common.serviceAccount | string | `"{{ .Values.global.resourceNamePrefix }}"` | Name of the Kubernetes ServiceAccount |
| oci-onm-logan.image.url | string | `"container-registry.oracle.com/oci_observability_management/oci-la-fluentd-collector:1.1.0"` |  |
| oci-onm-logan.kubernetesClusterID | string | `"{{ .Values.global.kubernetesClusterID }}"` |  |
| oci-onm-logan.kubernetesClusterName | string | `"{{ .Values.global.kubernetesClusterName }}"` |  |
| oci-onm-logan.namespace | string | `"{{ .Values.global.namespace }}"` |  |
| oci-onm-logan.oci-onm-common.enabled | bool | `false` |  |
| oci-onm-logan.ociLALogGroupID | string | `nil` |  |
| oci-onm-logan.ociLANamespace | string | `nil` |  |
| oci-onm-logan.serviceAccount | string | `"{{ .Values.global.resourceNamePrefix }}"` |  |
| oci-onm-mgmt-agent.kubernetesCluster.name | string | `"{{ .Values.global.kubernetesClusterName }}"` |  |
| oci-onm-mgmt-agent.mgmtagent.image.secret | string | `nil` |  |
| oci-onm-mgmt-agent.mgmtagent.image.url | string | `nil` |  |
| oci-onm-mgmt-agent.mgmtagent.installKey | string | `"resources/input.rsp"` |  |
| oci-onm-mgmt-agent.mgmtagent.installKeyFileContent | string | `nil` |  |
| oci-onm-mgmt-agent.namespace | string | `"{{ .Values.global.namespace }}"` |  |
| oci-onm-mgmt-agent.oci-onm-common.enabled | bool | `false` |  |
| oci-onm-mgmt-agent.serviceAccount | string | `"{{ .Values.global.resourceNamePrefix }}"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)