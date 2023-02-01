class {'nginx':
http_cfg_prepend => {
   'log_format' => 'main "$remote_addr - [$time_local] $request $status $scheme $request_time"'
}
}
nginx::resource::server { 'fwproxy':
  listen_port => 8888,
  format_log => 'main',
  resolver => ['8.8.8.8'],
  proxy => 'http://$http_host$uri$is_args$args',
}
