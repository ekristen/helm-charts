# ekristen Curated Helm Chart Repository

Add ekristen's Helm Repository to your Helm repos:

```bash
helm repo add ekristen https://ekristen.goatlas.io/ekristen/
```

## Install K3S Monitoring

```bash
helm upgrade -i k3s-monitoring ekristen/k3s-monitoring --namespace monitoring 
```

## Install RKE Monitoring

```bash
helm upgrade -i rke-monitoring ekristen/rke-monitoring --namespace monitoring 
```

## Install RKE2 Monitoring

```bash
helm upgrade -i rke2-monitoring ekristen/rke2-monitoring --namespace monitoring 
```
