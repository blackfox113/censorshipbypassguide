
# **Hysteria 2: High-Speed Proxy Tool**

## **What is Hysteria 2?**

Hysteria 2 is an advanced proxy tool engineered for ultra-fast, secure internet connections. By utilizing the **QUIC transport protocol**, it provides superior speed, reliability, and efficiency. Built to bypass censorship, Hysteria 2 is equipped with features like **UDP-based acceleration** and **flexible encryption**, making it perfect for low-latency, high-performance applications such as gaming, streaming, and other data-intensive tasks. Despite its robust capabilities, Hysteria 2 remains lightweight and easy to deploy, catering to both novices and experts.

---

## **Key Terms Explained**

| **Term**                   | **Definition**                                                                                                                                              |
|----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Hysteria 2**             | A modern proxy tool designed for high-speed, secure, and reliable internet connections.                                                                      |
| **QUIC**                   | A cutting-edge transport protocol that enhances speed and reliability in data transfers.                                                                     |
| **Bypassing Censorship**   | Enables access to restricted content by overcoming internet censorship barriers.                                                                             |
| **UDP-based Acceleration** | Uses UDP for faster data transfers, outperforming traditional TCP-based systems.                                                                             |
| **Flexible Encryption**    | Customizable encryption options for secure and private communication.                                                                                       |
| **Low-latency Applications** | Applications requiring minimal delay, such as online gaming or live streaming.                                                                             |
| **High-performance Applications** | Tasks needing high speed and reliability, like large file transfers or intensive streaming.                                                           |
| **Lightweight**            | Refers to Hysteria 2's efficient resource usage, allowing it to run smoothly on various devices.                                                             |
| **Easy to Deploy**         | A straightforward setup process that minimizes time and technical expertise required.                                                                        |

---

## **Key Advantages**

1. **Exceptional Speed**: Achieves rapid connection speeds using advanced acceleration technologies.
2. **Effortless Deployment**: Simple and fast setup process.
3. **Built on QUIC**: Benefits from the performance and reliability of the QUIC protocol.
4. **Lightweight Design**: Optimized for minimal resource usage.
5. **Versatile Features**: Supports various use cases with encryption and censorship bypassing.

---

## **Setup Hysteria 2 on a Debian-based VPS**

### **Prerequisites**
- **Linux VPS** with port 443 forwarded
- Basic command-line knowledge
- Root access
- A text editor

---

### **Step 1: Become Root**
Run the following command to switch to the root user:
```bash
sudo -s
```

---

### **Step 2: Install Hysteria 2**
Run this command to download and install Hysteria 2:
```bash
bash <(curl -fsSL https://get.hy2.sh/)
```

---

### **Step 3: Request a Certificate**
Generate SSL/TLS certificates for secure communication:
```bash
openssl req -x509 -nodes -newkey ec:<(openssl ecparam -name prime256v1) -keyout /etc/hysteria/server.key -out /etc/hysteria/server.crt -subj "/CN=https://pan.baidu.com" -days 36500 && \
sudo chown hysteria /etc/hysteria/server.key && \
sudo chown hysteria /etc/hysteria/server.crt
```

---

### **Step 4: Enable and Start Hysteria 2**

Start the service:
```bash
systemctl start hysteria-server.service
```

Enable the service to start on boot:
```bash
systemctl enable hysteria-server.service
```

---

### **Step 5: Configure Hysteria**

Create the configuration file:
```bash
cat << EOF > /etc/hysteria/config.yaml
listen: :443

tls:
  cert: /etc/hysteria/server.crt
  key: /etc/hysteria/server.key

auth:
  type: password
  password: 123456 # Change this password

masquerade:
  type: proxy
  proxy:
    url: https://pan.baidu.com # Replace with a suitable SNI-fake site
    rewriteHost: true
EOF
```

> **Note:** Be sure to replace the password with a secure one.

---

### **Step 6: Apply Configuration**

Restart the Hysteria server to apply the changes:
```bash
systemctl restart hysteria-server.service
```

---

### **You're All Set!**

Your Hysteria 2 server is now running. Follow the client setup instructions for your device to start using the proxy.
