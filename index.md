# ekristen's Curated Helm Chart Repository

Add ekristen's Helm Repository to your Helm repos:

```bash
helm repo add ekristen https://ekristen.goatlas.io/ekristen/
```

## Install K3S Monitoring

```bash
helm upgrade -i k3s-monitoring ekristen/k3s-monitoring --namespace monitoring 
```

**Note:** The origins of this chart comes from [rancher charts](https://github.com/rancher/charts), slightly modified to work for generic prometheus installs.

## Install RKE Monitoring

```bash
helm upgrade -i rke-monitoring ekristen/rke-monitoring --namespace monitoring 
```

**Note:** The origins of this chart comes from [rancher charts](https://github.com/rancher/charts), slightly modified to work for generic prometheus installs.

## Install RKE2 Monitoring

```bash
helm upgrade -i rke2-monitoring ekristen/rke2-monitoring --namespace monitoring 
```

**Note:** The origins of this chart comes from [rancher charts](https://github.com/rancher/charts), slightly modified to work for generic prometheus installs.
