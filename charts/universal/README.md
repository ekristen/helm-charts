# Universal Deployment Helm Chart

A simple, production-ready Helm chart for deploying container images to Kubernetes clusters.

> **Note:** This chart is designed for straightforward deployments and is not intended for complex or highly customized workloads.

---

## Overview

The Universal Deployment Helm Chart provides a flexible yet opinionated way to deploy containerized applications to Kubernetes. It is ideal for single-image deployments but supports multiple containers and init-containers for advanced scenarios.

- **Easy to use:** Minimal configuration required for basic deployments.
- **Production-ready:** Sensible defaults and best practices included.
- **Customizable:** Supports overrides for most Kubernetes resource settings.

---

## ⚠️ Footgun Warning

This chart exposes several configuration options ("knobs") that allow you to customize your deployment. While this flexibility is powerful, it can also lead to misconfiguration.

- **Intended Use:** Single image deployments with optional init-containers.
- **Advanced Use:** You may specify multiple containers using the `containers` value, but advanced configurations are at your own risk.

---

## Default Deployment

By default, this chart deploys [stefanprodan/podinfo](https://github.com/stefanprodan/podinfo). The default values are tailored for this demo application. **You should override these values for your own application.**

---

## Quick Start

Install the chart with default values:

```bash
helm install my-release universal
```

To customize the deployment, create a `values.yaml` file and override the defaults:

```bash
helm install my-release universal -f values.yaml
```

---

## Configuration

You can override any of the default values using the `--set` flag or a custom `values.yaml` file. Common configuration options include:

| Parameter                | Description                                 | Default                        |
|--------------------------|---------------------------------------------|--------------------------------|
| `image.repository`       | Container image repository                  | `stefanprodan/podinfo`         |
| `image.tag`              | Container image tag                         | `latest`                       |
| `replicaCount`           | Number of pod replicas                      | `1`                            |
| `service.enabled`        | Enable/disable service creation             | `true`                         |
| `service.type`           | Service type (`ClusterIP`, `NodePort`, etc) | `ClusterIP`                    |
| `ingress.enabled`        | Enable/disable ingress creation             | `false`                        |
| `configMaps`             | List of ConfigMaps to create                | `[]`                           |
| `serviceAccount.create`  | Create a service account                    | `true`                         |
| `initContainers`         | List of init containers                     | `[]`                           |
| `containers`             | List of additional containers               | `[]`                           |

For a full list of configurable values, see the [values.yaml](./values.yaml) file.

---

## Supported Kubernetes Resources

This chart can manage the following resources:

1. Deployment
2. Service
3. Ingress
4. ConfigMap(s)
5. ServiceAccount

---

## Examples

**Basic deployment with custom image:**
```yaml
# values.yaml
image:
  repository: myorg/myapp
  tag: v1.2.3
replicaCount: 2
```

**Enabling ingress:**
```yaml
# values.yaml
ingress:
  enabled: true
  hosts:
    - host: myapp.example.com
      paths: ["/"]
```

**Adding an init container:**
```yaml
# values.yaml
initContainers:
  - name: init-myservice
    image: busybox
    command: ['sh', '-c', 'echo Initializing...']
```

**Multiple containers (advanced):**
```yaml
# values.yaml
containers:
  - name: sidecar
    image: busybox
    command: ['sh', '-c', 'echo Sidecar running...']
```

---

## Best Practices

- Always review and customize the default values before deploying to production.
- Use resource requests and limits to ensure stable operation.
- For advanced scenarios (multiple containers, custom volumes, etc.), review the chart’s values and templates carefully.
- Use version control for your `values.yaml` files to track configuration changes.
- Test your configuration in a staging environment before deploying to production.

---

## Troubleshooting

- **Pods not starting?** Check image repository and tag values.
- **Service not reachable?** Ensure `service.enabled` is `true` and the type/ports are correct.
- **Ingress not working?** Verify ingress controller is installed and ingress values are set properly.
- **Custom containers misbehaving?** Double-check your `containers` and `initContainers` configuration.

---

## License

This chart is provided as-is under the MIT License.

---

## References

- [Helm Documentation](https://helm.sh/docs/)
- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [podinfo](https://github.com/stefanprodan/podinfo)
