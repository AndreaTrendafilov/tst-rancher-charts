{{/* vim: set filetype=mustache: */}}

{{/*
Common labels
*/}}
{{- define "labels" -}}
helm.sh/chart: {{ include "crossplane.chart" . }}
{{ include "selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "selectorLabels" -}}
app.kubernetes.io/name: {{ include "crossplane.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
