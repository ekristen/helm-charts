# Helm Charts

A set of curated and useful helm charts.

## Charts

- rancher-pushprox
- k3s-monitoring
- rke-monitoring
- rke2-monitoring

### rancher-pushprox

K3S does not use pods for some of the various built in components so to be able to monitor them we need to be able to expose them to prometheus to monitoring. Rancher's own monitoring helm chart uses [pushprox](https://github.com/prometheus-community/PushProx).

This chart simply makes those components available as it's own helm chart.
