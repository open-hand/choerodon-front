{{- define "service.labels.standard" -}}
choerodon.io/release: {{ .Release.Name | quote }}
{{- end -}}

{{- define "service.logging.deployment.label" -}}
choerodon.io/logs-parser: {{ .Values.logs.parser | quote }}
{{- end -}}

{{- define "service.monitoring.pod.annotations" -}}
choerodon.io/metrics-group: {{ .Values.metrics.group | quote }}
choerodon.io/metrics-path: {{ .Values.metrics.path | quote }}
{{- end -}}