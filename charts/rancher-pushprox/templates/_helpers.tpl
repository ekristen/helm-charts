# Rancher

{{- define "system_default_registry" -}}
{{- if .Values.global.cattle.systemDefaultRegistry -}}
{{- printf "%s/" .Values.global.cattle.systemDefaultRegistry -}}
{{- end -}}
{{- end -}}

# General

{{- define "pushprox.namespace" -}}
  {{- if .Values.namespaceOverride -}}
    {{- .Values.namespaceOverride -}}
  {{- else -}}
    {{- .Release.Namespace -}}
  {{- end -}}
{{- end -}}

{{- define "pushProxy.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "pushProxy.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "pushProxy.commonLabels" -}}
helm.sh/chart: {{ include "pushProxy.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: {{ .Values.component | quote }}
app.kubernetes.io/part-of: {{ template "pushProxy.name" . }}
{{- include "pushProxy.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
provider: kubernetes
component: {{ .Values.component | quote }}
{{- if .Values.customLabels }}
{{ toYaml .Values.customLabels }}
{{- end }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "pushProxy.selectorLabels" }}
app.kubernetes.io/name: {{ include "pushProxy.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "pushProxy.proxyUrl" -}}
{{- $_ := (required "Template requires either .Values.proxy.port or .Values.client.proxyUrl to set proxyUrl for client" (or .Values.clients.proxyUrl .Values.proxy.port)) -}}
{{- if .Values.clients.proxyUrl -}}
{{ printf "%s" .Values.clients.proxyUrl }}
{{- else -}}
{{ printf "http://%s.%s.svc.cluster.local:%d" (include "pushProxy.proxy.name" .) .Release.Namespace (int .Values.proxy.port) }}
{{- end -}}{{- end -}}

# Client

{{- define "pushProxy.client.name" -}}
{{- printf "pushprox-%s-client" (required ".Values.component is required" .Values.component) -}}
{{- end -}}

{{- define "pushProxy.client.labels" -}}
k8s-app: {{ template "pushProxy.client.name" . }}
{{ template "pushProxy.commonLabels" . }}
{{- end -}}

{{- define "pushProxy.client.selectorLabels" -}}
k8s-app: {{ template "pushProxy.client.name" . }}
{{- include "pushProxy.selectorLabels" . }}
{{- end -}}

# Proxy

{{- define "pushProxy.proxy.name" -}}
{{- printf "pushprox-%s-proxy" (required ".Values.component is required" .Values.component) -}}
{{- end -}}

{{- define "pushProxy.proxy.labels" -}}
k8s-app: {{ template "pushProxy.proxy.name" . }}
{{ template "pushProxy.commonLabels" . }}
{{- end -}}

{{- define "pushProxy.proxy.selectorLabels" -}}
k8s-app: {{ template "pushProxy.proxy.name" . }}
{{- include "pushProxy.selectorLabels" . }}
{{- end -}}

# ServiceMonitor

{{- define "pushprox.serviceMonitor.name" -}}
{{- printf "%s-%s" .Release.Name (required ".Values.component is required" .Values.component) -}}
{{- end -}}

{{- define "pushProxy.serviceMonitor.labels" -}}
app: {{ template "pushprox.serviceMonitor.name" . }}
{{ template "pushProxy.commonLabels" . }}
{{- if .Values.serviceMonitor.labels }}
{{ toYaml .Values.serviceMonitor.labels }}
{{- end }}
{{- end -}}