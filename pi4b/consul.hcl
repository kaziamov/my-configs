datacenter = "dc1"
data_dir = "/opt/consul"
server = true
bootstrap_expect = 3
bind_addr = "0.0.0.0"
client_addr = "0.0.0.0"  # Доступ к HTTP API
retry_join = []  # IP других серверов
ui = true
