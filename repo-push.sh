#!/usr/bin/env bash

helm repo add ${PLUGIN_REPO_NAME} ${HELM_REPO_URL}
helm package -u --version=$(cat .tags) --app-version$(cat .tags) --save=false ${PLUGIN_CHART_SUBDIR}/.
curl --data-binary "@${PLUGIN_CHART_SUBDIR}-$(cat .tags).tgz" ${HELM_REPO_URL}/api/charts
