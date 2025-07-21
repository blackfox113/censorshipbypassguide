# Hysteria 2

---

## What is Hysteria 2?

**Hysteria 2** is a powerful proxy tool built for fast, secure, and censorship-resistant internet connections. It uses the **QUIC transport protocol**, which boosts speed and reliability. With support for **UDP acceleration**, **custom encryption**, and a lightweight design, Hysteria 2 is great for gaming, streaming, and large file transfers. Despite its advanced capabilities, it's surprisingly easy to set up—perfect for both beginners and more experienced users.

---

## Key Concepts

| Term                     | Description                                                                                     |
|--------------------------|-------------------------------------------------------------------------------------------------|
| **Hysteria 2**           | A fast, secure proxy designed for reliable internet access, even in restricted environments.   |
| **QUIC**                 | A next-generation transport protocol that improves speed and reliability over UDP.             |
| **Bypassing Censorship** | Lets users access restricted content by avoiding traditional detection methods.                |
| **UDP Acceleration**     | Speeds up data transfers using the faster, connectionless UDP protocol.                        |
| **Flexible Encryption**  | Offers adjustable security settings to fit different needs.                                    |
| **Low Latency**          | Ideal for real-time use cases like gaming and live streaming.                                  |
| **High Performance**     | Handles demanding tasks such as large file transfers and HD media streaming.                   |
| **Lightweight**          | Runs efficiently with minimal system resource usage.                                           |
| **Easy Setup**           | Simple installation process, even for users with limited experience.                           |

---

## Why Use Hysteria 2?

1. **Very Fast** – Delivers excellent speeds through QUIC and UDP.
2. **Quick to Set Up** – Easy installation, no deep tech knowledge needed.
3. **Modern Protocol** – Uses QUIC for better connection quality.
4. **Efficient** – Doesn't use much system memory or CPU.
5. **Advanced Options** – Includes built-in encryption and anti-censorship features.

---

## How to Install Hysteria 2 on a Debian-Based VPS

### Requirements

- A Linux VPS (make sure port **443** is open)
- Root access
- Basic command-line skills
- A text editor like `nano` or `vim`

---

### Step 1: Become Root

Switch to the root user:
```bash
sudo -s
```

---

### Step 2: Install Hysteria 2

Use the official script to install:
```bash
bash <(curl -fsSL https://get.hy2.sh/)
```

---

### Step 3: Generate a Self-Signed SSL Certificate

Run the following to create the certificate:
```bash
openssl req -x509 -nodes -newkey ec:<(openssl ecparam -name prime256v1) \
  -keyout /etc/hysteria/server.key \
  -out /etc/hysteria/server.crt \
  -subj "/CN=https://pan.baidu.com" -days 36500
```

Adjust file permissions:
```bash
sudo chown hysteria /etc/hysteria/server.key
sudo chown hysteria /etc/hysteria/server.crt
```

> Replace the `CN` field with a domain you want to use for masking, if applicable.

---

### Step 4: Start the Server

Start the Hysteria service:
```bash
systemctl start hysteria-server.service
```

And enable it to start at boot:
```bash
systemctl enable hysteria-server.service
```

---

### Step 5: Configure Hysteria 2

Create the configuration file:
```bash
cat << EOF > /etc/hysteria/config.yaml
listen: :443
tls:
  cert: /etc/hysteria/server.crt
  key: /etc/hysteria/server.key
auth:
  type: password
  password: 123456  # Be sure to change this!
masquerade:
  type: proxy
  proxy:
    url: https://pan.baidu.com  # Use a different domain if needed
rewriteHost: true
EOF
```

> Make sure to choose a strong password and update the `proxy.url` if you're using a different domain.

---

### Step 6: Apply the Configuration

Restart the server to load the new settings:
```bash
systemctl restart hysteria-server.service
```

---

## All Set

Your **Hysteria 2** server is now running.

Just configure your client to connect using the domain and password you specified. That’s it—you’re ready to go.
