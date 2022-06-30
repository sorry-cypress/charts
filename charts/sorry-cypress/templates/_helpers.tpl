{{/*
Expand the name of the chart.
*/}}
{{- define "sorry-cypress-helm.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "sorry-cypress-helm.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "sorry-cypress-helm.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "sorry-cypress-helm.labels" -}}
helm.sh/chart: {{ include "sorry-cypress-helm.chart" . }}
{{ include "sorry-cypress-helm.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "sorry-cypress-helm.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sorry-cypress-helm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "sorry-cypress-helm.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "sorry-cypress-helm.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the s3 secret
*/}}
{{- define "s3SecretAccessKey" }}
{{- with .Values.s3 }}
{{- printf .secretAccessKey | b64enc -}}
{{- end }}
{{- end }}

{{/*
Create the mongoDB secret
*/}}
{{- define "mongoSecretConnectionString" }}
{{- with .Values.mongodb }}
{{- printf .mongoConnectionString | b64enc -}}
{{- end }}
{{- end }}

{{/*
  Determine the MongoDB hostname.
*/}}
{{- define "mongodb.hostname" -}}
{{- if .Values.mongodb.internal_db.enabled }}
  {{- if eq .Values.mongodb.architecture "standalone" }}
  {{- printf "%s-%s" (include "sorry-cypress-helm.fullname" .) "mongodb" -}}
  {{- else }}
  {{- printf "%s-%s" (include "sorry-cypress-helm.fullname" .) "mongodb-0" -}}
  {{- end }}
{{- else }}
{{- printf "%s" .Values.mongodb.external_db.mongoServer -}}
{{- end }}
{{- end }}

{{/*
Determine the S3 http host
*/}}
{{- define "s3Host" }}
{{- with .Values.s3 }}
{{- printf "%s.s3-website-%s.amazonaws.com" .bucketName .region -}}
{{- end }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "sorry-cypress.minio.fullname" -}}
{{- if .Values.minio.fullnameOverride -}}
{{- .Values.minio.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name "minio" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
