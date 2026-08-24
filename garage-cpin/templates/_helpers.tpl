{{/*
Garage subchart StatefulSet/pod name prefix.
Mirrors garage.fullname from garage-origine (subchart Chart.Name is always "garage").
*/}}
{{- define "cpin-garage.garageFullname" -}}
{{- if .Values.garage.fullnameOverride }}
{{- .Values.garage.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "garage" .Values.garage.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "cpin-garage.layoutBootstrap.name" -}}
{{- printf "%s-layout-bootstrap" (include "cpin-garage.garageFullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "cpin-garage.layoutBootstrap.serviceAccountName" -}}
{{- printf "%s-layout-bootstrap" (include "cpin-garage.garageFullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "cpin-garage.bucketBootstrap.name" -}}
{{- printf "%s-bucket-bootstrap" (include "cpin-garage.garageFullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "cpin-garage.bucketBootstrap.serviceAccountName" -}}
{{- printf "%s-bucket-bootstrap" (include "cpin-garage.garageFullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}
