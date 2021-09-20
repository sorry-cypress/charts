{{- if .Values.s3.ingress.enabled -}}
{{- $v1Networking := .Capabilities.APIVersions.Has "networking.k8s.io/v1/Ingress" -}}
{{- $fullName := include "sorry-cypress-helm.fullname" . -}}
{{- if $v1Networking }}
apiVersion: networking.k8s.io/v1
{{- else if .Capabilities.APIVersions.Has "networking.k8s.io/v1beta1" }}
apiVersion: networking.k8s.io/v1beta1
{{- else -}}
apiVersion: extensions/v1beta1
{{- end }}
kind: Ingress
metadata:
  name: {{ $fullName }}-s3
  labels:
    {{- include "sorry-cypress-helm.labels" . | nindent 4 }}
    {{- with .Values.s3.ingress.labels }}
    {{- toYaml . | nindent 4 }}
    {{- end}}
  {{- with .Values.s3.ingress.annotations }}
  annotations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
spec:
  {{- if .Values.s3.ingress.ingressClassName }}
  {{- if .Values.s3.ingress.tls }}
  tls:
    {{- range .Values.s3.ingress.tls }}
    - hosts:
        {{- range .hosts }}
        - {{ . | quote }}
        {{- end }}
      secretName: {{ .secretName }}
    {{- end }}
  {{- end }}
  rules:
    {{- range .Values.s3.ingress.hosts }}
    - host: {{ .host | quote }}
      http:
        paths:
          {{- if $v1Networking }}
          - path: {{ .path | default "/" }}
            pathType: Prefix
            backend:
              service:
                name: {{ $fullName }}-s3
                port:
                  number: 80
          {{- else }}
          - path: {{ .path | default "/" }}
            backend:
              serviceName: {{ $fullName }}-s3
              servicePort: 80
          {{- end }}
    {{- end }}
  {{- end }}
