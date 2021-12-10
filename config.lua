local _config = {
    server = {
        nginx = {
            port = "80",
            port_ssl = "443",
            server_name = "massbitroute"
        }
    },
    templates = {},
    apps = {},
    supervisor = [[

[program:stat_prometheus_gw]
command=/bin/bash _SITE_ROOT_/scripts/run loop _service_prometheus_gw _SITE_ROOT_ v1
autorestart=true
redirect_stderr=true
stdout_logfile=_SITE_ROOT_/logs/stat_prometheus_gw.log

[program:stat_prometheus_node]
command=/bin/bash _SITE_ROOT_/scripts/run loop _service_prometheus_node _SITE_ROOT_ v1
autorestart=true
redirect_stderr=true
stdout_logfile=_SITE_ROOT_/logs/stat_prometheus_node.log

[program:stat_grafana]
command=/bin/bash _SITE_ROOT_/scripts/run loop _service_grafana _SITE_ROOT_ v1
autorestart=true
redirect_stderr=true
stdout_logfile=_SITE_ROOT_/logs/stat_grafana.log
    ]]
}
return _config
