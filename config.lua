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
command=/bin/bash _SITE_ROOT_/../mkagent/agents/push.sh _SITE_ROOT_
autorestart=true
redirect_stderr=true
stopasgroup=true
killasgroup=true
stopsignal=INT
stdout_logfile=_SITE_ROOT_/../mkagent/logs/monitor_client.log
    ]]
    },
    supervisor_tmp = [[
[program:stat_grafana]
command=/bin/bash _SITE_ROOT_/scripts/run loop _service_grafana _SITE_ROOT_ v1
autorestart=true
redirect_stderr=true
stopasgroup=true
killasgroup=true
stopsignal=INT
stdout_logfile=_SITE_ROOT_/logs/stat_grafana.log

[program:stat_prometheus_gw_v1]
command=/bin/bash _SITE_ROOT_/scripts/run loop _service_prometheus_gw_v1 _SITE_ROOT_ v1
autorestart=true
redirect_stderr=true
stopasgroup=true
killasgroup=true
stopsignal=INT
stdout_logfile=_SITE_ROOT_/logs/stat_prometheus_gw_v1.log

; Prometheus for Community Node
[program:stat_prometheus_node_v1]
command=/bin/bash _SITE_ROOT_/scripts/run loop _service_prometheus_node_v1 _SITE_ROOT_ v1
autorestart=true
redirect_stderr=true
stopasgroup=true
killasgroup=true
stopsignal=INT
stdout_logfile=_SITE_ROOT_/logs/stat_prometheus_node_v1.log
]],
    supervisor = [[
[program:stat_prometheus]
command=/bin/bash _SITE_ROOT_/scripts/run loop _service_prometheus _SITE_ROOT_ v1
autorestart=true
redirect_stderr=true
stopasgroup=true
killasgroup=true
stopsignal=INT
stdout_logfile=_SITE_ROOT_/logs/stat_prometheus.log

    ]]
}
return _config
