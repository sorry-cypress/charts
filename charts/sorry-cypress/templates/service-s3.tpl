{{- if .Values.s3.ingress.enabled -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ include "sorry-cypress-helm.fullname" . }}-s3
  namespace: sorry-cypress
spec:
  type: ExternalName
  externalName: {{ .Values.s3.bucketName }}.s3-website-{{ .Values.s3.region }}.amazonaws.com
  ports:
  - name: http
    port: 80
    protocol: TCP
    targetPort: 80
{{- end }}