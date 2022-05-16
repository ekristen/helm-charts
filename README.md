# Helm Charts

A set of curated and useful helm charts.

## Charts

- amazon-eks-pod-identity-webhook
- rancher-pushprox
- k3s-monitoring
- rke-monitoring
- rke2-monitoring

### amazon-eks-pod-identity-webhook

[Amazon EKS Pod Identity Webhook](https://github.com/aws/amazon-eks-pod-identity-webhook) is a temporary solution until AWS gets around to publishing their own version of this helm chart.

### rancher-pushprox

K3S does not use pods for some of the various built in components so to be able to monitor them we need to be able to expose them to prometheus to monitoring. Rancher's own monitoring helm chart uses [pushprox](https://github.com/prometheus-community/PushProx).

This chart simply makes those components available as it's own helm chart.

The origins of this chart comes from [rancher charts](https://github.com/rancher/charts)

### k3s-monitoring

This chart is setup to deploy the `rancher-pushprox` to allow monitoring of several components on [K3S](https://k3s.io) that aren't deployed as pods that normal service selectors and monitoring won't be able to find.

### rke-monitoring

This chart is setup to deploy the `rancher-pushprox` to allow monitoring of several components on [RKE](https://github.com/rancher/rke) clusters that aren't deployed as pods that normal monitoring cannot access or find.

### rke2-monitoring

This chart is setup to deploy the `rancher-pushprox` to allow monitoring of several components on [RKE2](https://github.com/rancher/rke2) clusters that aren't deployed as pods that normal monitoring cannot access or find.
