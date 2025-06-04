# Hysteria 2

---

## 📘 What is Hysteria 2?

**Hysteria 2** is a professional proxy tool optimized for ultra-fast, secure, and censorship-resistant Internet connections. It utilizes the **QUIC transport protocol**, offering enhanced speed, reliability, and efficiency. With **UDP-based acceleration**, **flexible encryption**, and a lightweight footprint, Hysteria 2 excels in low-latency, high-performance scenarios like gaming, streaming, and large file transfers. Despite its power, it remains easy to deploy—ideal for both beginners and advanced users.

---

## 📖 Key Terminology

| **Term**                    | **Definition**                                                                                                  |
|-----------------------------|------------------------------------------------------------------------------------------------------------------|
| **Hysteria 2**              | A high-speed, secure proxy designed for reliable Internet access, even in censored environments.               |
| **QUIC**                    | A modern transport protocol that improves data transfer speed and reliability over UDP.                        |
| **Circumventing Censorship**| Enables access to restricted or censored content online.                                                       |
| **UDP-based Acceleration**  | Utilizes UDP to achieve faster speeds compared to traditional TCP connections.                                 |
| **Flexible Encryption**     | Allows customizable encryption to suit privacy and security requirements.                                      |
| **Low-latency Applications**| Use cases like gaming or live streaming where response time is critical.                                       |
| **High-performance Apps**   | Tasks needing fast and reliable data transfer (e.g., large file uploads/downloads, HD streaming).              |
| **Lightweight**             | Minimal resource usage makes it suitable for a wide range of systems.                                          |
| **Easy to Deploy**          | Simplified installation and configuration process.                                                             |

---

## 🌟 Key Benefits

1. **Blazing Fast** – Achieves high connection speeds through QUIC and UDP acceleration.
2. **Easy to Deploy** – Quick setup suitable for users of all skill levels.
3. **QUIC-Based** – Leverages modern transport protocols for improved performance.
4. **Lightweight** – Optimized to use minimal system resources.
5. **Feature-Rich** – Includes advanced encryption and censorship evasion options.

---

## 🖥️ Installing Hysteria 2 on Debian-based VPS

### ✅ Requirements

- A Linux VPS (port **443** must be open and forwarded)
- Root access
- Basic command-line knowledge
- A text editor

---

### 🔧 Step 1: Become Root

Switch to the root user:
```bash
sudo -s
```

---

### 🔧 Step 2: Install Hysteria 2

Run the official install script:
```bash
bash <(curl -fsSL https://get.hy2.sh/)
```

---

### 🔐 Step 3: Generate SSL/TLS Certificate

Use OpenSSL to create a self-signed certificate:
```bash
openssl req -x509 -nodes -newkey ec:<(openssl ecparam -name prime256v1) \
  -keyout /etc/hysteria/server.key \
  -out /etc/hysteria/server.crt \
  -subj "/CN=https://pan.baidu.com" -days 36500
```

Set correct permissions:
```bash
sudo chown hysteria /etc/hysteria/server.key
sudo chown hysteria /etc/hysteria/server.crt
```

> 📝 **Note**: Replace the CN with a suitable masquerade domain if needed.

---

### 🛠️ Step 4: Start Hysteria 2

Start the server:
```bash
systemctl start hysteria-server.service
```

Enable it to run on boot:
```bash
systemctl enable hysteria-server.service
```

---

### ⚙️ Step 5: Configure Hysteria 2

Create the config file:
```bash
cat << EOF > /etc/hysteria/config.yaml
listen: :443
tls:
  cert: /etc/hysteria/server.crt
  key: /etc/hysteria/server.key
auth:
  type: password
  password: 123456  # Change this!
masquerade:
  type: proxy
  proxy:
    url: https://pan.baidu.com  # Replace with another SNI front if needed
rewriteHost: true
EOF
```

> 🔐 **Important**: Replace the password with a secure one.

---

### 🔄 Step 6: Apply Configuration

Restart the server to apply changes:
```bash
systemctl restart hysteria-server.service
```

---

## ✅ Final Step

Your **Hysteria 2** proxy server is now live!
Set up your client device using the domain and password you configured to start using the service.
