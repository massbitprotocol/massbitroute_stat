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
    supervisors = {
        ["monitor_client"] = [[
[program:monitor_client]
command=/bin/bash _SITE_ROOT_/../mkagent/agents/push.sh _SITE_ROOT_/../mkagent
autorestart=true
redirect_stderr=true
stdout_logfile=_SITE_ROOT_/../mkagent/logs/monitor_client.log
    ]]
    },
    supervisor = [[

; Prometheus for Community Gateway
[program:stat_prometheus_gw]
command=/bin/bash _SITE_ROOT_/scripts/run loop _service_prometheus_gw _SITE_ROOT_ v1
autorestart=true
redirect_stderr=true
stdout_logfile=_SITE_ROOT_/logs/stat_prometheus_gw.log

; Prometheus for Community Node
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
