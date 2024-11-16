# Hysteria 2
## **What is Hysteria 2?**

Hysteria 2 is a professional proxy tool designed for ultra-fast, secure connections to the Internet. It features a **QUIC transport protocol** that offers better speed, reliability, and efficiency. Because it was designed with bypassing censorship in mind, it comes with **UDP-based acceleration** and **flexible encryption**, among other features that make it perfect for applications that require low latency and high performance, such as gaming and streaming, among other resource-intensive applications. Yet, Hysteria 2 manages to remain lightweight and easy to deploy, thus fitting both the novice and the expert.

---
**Explaining Key Terms

| **Term**                   | **Definition**                                                                                                         |
|----------------------------|-------------------------------------------------------------------------------------------------------------------------|
| **Hysteria 2**             | Advanced modern proxy for high-speed, secure, and reliable internet connections.                                       |
| **QUIC**                   | A next-generation transport protocol designed to accelerate and guarantee reliability in data transfer.                |
| **Circumventing Censorship** | Allows accessing restricted content by bypassing various internet censorship mechanisms.                              |
| **UDP-based Acceleration** | Employs UDP for faster data transfers, surpassing traditional TCP-based systems.                                       |
| **Flexible Encryption**    | Adapts secure and private communications by allowing you to choose an encryption method that suits your needs.         |
| **Low-latency Applications** | Applications that require minimal delay, such as online gaming or live streaming.                                     |
| **High-performance Applications** | Applications that require high speed and reliability, including large file transfers or extensive streaming.    |
| **Lightweight**            | Indicates how Hysteria 2 uses fewer resources, allowing it to run smoothly on a variety of devices.                   |
| **Easy to Deploy**         | Features an easy setup process that requires little time or technical expertise.                                       |


## **Key Benefits**

1. **Very Fast**: Reaches high connection speeds using advanced acceleration methodologies.
2. **Ease of Deployment:** Setup is easy and quick.
3. **QUIC-Based**: It bases on QUIC, which provides great throughput and strong reliability.
4. **Lightweight:** It is lightweight due to its careful optimization in minimizing resource usage.
5. **Featureful:** It has features to fit various use cases with encryption and censorship bypass.

---
## **Installing Hysteria 2 on a Debian-based VPS**

### **Requirements**

* **Linux VPS** forwarded with port 443
* Basic knowledge of the command line
- Root access
- A text editor

---
### Step 1: Become Root**
Switch to the root user with the following command:
```bash
sudo -s
```
---
### Step 2: Install Hysteria 2
Download and install Hysteria 2 with the following command:
```bash
bash <(curl -fsSL https://get.hy2.sh/)
```
---
### Step 3: Request a Certificate
Generate SSL/TLS certificates, which are used to ensure the security of communications:
```bash
openssl req -x509 -nodes -newkey ec:<(openssl ecparam -name prime256v1) -keyout /etc/hysteria/server.key -out /etc/hysteria/server.crt -subj "/CN=https://pan.baidu.com" -days 36500 && \
```
```
sudo chown hysteria /etc/hysteria/server.key && \
```
```
sudo chown hysteria /etc/hysteria/server.crt
```
---

### Step 4: Enable and Start Hysteria 2**

Start the service:

```bash
systemctl start hysteria-server.service
```
Enable the service to start on boot:

```bash
systemctl enable hysteria-server.service
```
---

### Step 5: Configure Hysteria**

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
> **Note:** Replace the password with a secure one.

---

### Step 6: Apply Configuration**

Restart the Hysteria server to apply the configuration changes:

```bash
systemctl restart hysteria-server.service
```
---

### You're All Done!

Your Hysteria 2 server is up and running. Please follow the client configuration for your device to begin using the proxy service.
