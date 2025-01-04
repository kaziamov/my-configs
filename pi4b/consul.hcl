datacenter = "dc1"
data_dir = "/opt/consul"
server = true
bootstrap_expect = 3
bind_addr = "0.0.0.0"
client_addr = "0.0.0.0"  # Доступ к HTTP API
retry_join = ["192.168.1.101", "192.168.1.102", "192.168.1.103"]  # IP других серверов
ui = true
