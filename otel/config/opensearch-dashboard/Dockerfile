# Copyright The OpenTelemetry Authors
# SPDX-License-Identifier: Apache-2.0

FROM opensearchproject/opensearch-dashboards:3.2.0

# Remove plugins in dependency order - remove dependent plugins first
# These plugins are not needed for basic log storage and retrieval in the demo
RUN /usr/share/opensearch-dashboards/bin/opensearch-dashboards-plugin remove securityDashboards && \
    /usr/share/opensearch-dashboards/bin/opensearch-dashboards-plugin remove securityAnalyticsDashboards

# Keep only these essential plugins:
# - opensearch-security (authentication/authorization) - already disabled via env var
# - opensearch-index-management (index lifecycle management)
# - opensearch-sql (SQL query support for Grafana PPL queries)
# - opensearch-job-scheduler (task scheduling)

USER 1000
