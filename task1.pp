class {'nginx': }
nginx::resource::server{'domain.com':
    listen_port => 443,
    ssl => true,
    ssl_port => 443,
    ssl_cert => '/tmp/server.crt',
    ssl_key => '/tmp/server.key',
    proxy => 'http://10.10.10.10/',
  }

nginx::resource::location{'/resource2':
    ssl => true,
    ssl_only => true,
    location => '/resource2',
    proxy => 'http://20.20.20.20/',
    server => 'domain.com',
  }
