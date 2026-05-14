{{- define "rag-platform.name" -}}
rag-platform
{{- end -}}

{{- define "rag-platform.fullname" -}}
{{ include "rag-platform.name" . }}
{{- end -}}
