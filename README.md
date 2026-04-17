# tst-rancher-charts

Personal Helm chart repository. Charts are packaged under `charts/`; source lives in `chart-sources/`.

## Use this repo with Helm

```bash
helm repo add tst-rancher-charts https://raw.githubusercontent.com/AndreaTrendafilov/tst-rancher-charts/main/charts
helm repo update
helm search repo tst-rancher-charts
helm install migrations-operator tst-rancher-charts/migrations-operator --namespace migrations-system --create-namespace
```

## Add or update a chart

1. Edit the chart under `chart-sources/<name>/`.
2. Package and refresh the index:

```bash
helm package chart-sources/migrations-operator -d charts
helm repo index charts --url https://raw.githubusercontent.com/AndreaTrendafilov/tst-rancher-charts/main/charts
```

3. Commit `chart-sources/`, `charts/*.tgz`, and `charts/index.yaml`.

## Default image

The migrations-operator chart defaults to `ghcr.io/andreatrendafilov/migrations-operator:v1.2.5`.
