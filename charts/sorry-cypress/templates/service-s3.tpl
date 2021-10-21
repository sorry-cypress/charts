{{- if .Values.s3.ingress.enabled -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ include "sorry-cypress-helm.fullname" . }}-s3
spec:
  type: ExternalName
  externalName: {{ include "s3Host" . }}
  ports:
  - name: http
    port: 80
    protocol: TCP
    targetPort: 80
{{- end }}
