# VMESS

**What is VMESS?**
VMESS is an older proxy protocol developed by V2Ray. It supports transporting traffic over WebSockets, TCP, KCP, HTTP, gRPC, etc. Despite being older, it is sometimes more secure than VLESS—especially when TLS is compromised—because it supports built-in AES encryption. It can also be paired with a CDN.

---

### Terms Explanation

| **Term**                           | **Definition**                                                                                                  |
| ---------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| **VMESS**                          | An older proxy protocol developed by V2Ray that supports multiple transport methods.                            |
| **V2Ray**                          | A platform for building proxy tools, which developed both VMESS and VLESS.                                      |
| **WebSockets (WS)**                | A transport protocol used to tunnel VMESS traffic through HTTP-friendly connections.                            |
| **TCP**                            | A standard transport protocol supported by VMESS for reliable data transmission.                                |
| **KCP**                            | A UDP-based transport layer used to reduce latency, supported by VMESS.                                         |
| **HTTP**                           | A common web protocol VMESS can tunnel through to bypass censorship.                                            |
| **gRPC**                           | A high-performance RPC protocol that VMESS can use for traffic transport.                                       |
| **AES Encryption**                 | A symmetric encryption method built into VMESS, offering extra security even if TLS is compromised.             |
| **CDN (Content Delivery Network)** | A distributed network of servers that can be used with VMESS to mask traffic and improve censorship resistance. |
| **TLS (Transport Layer Security)** | An encryption protocol used to secure traffic, often paired with VMESS.                                         |

---

## Setup: **VMESS + WS + TLS + AES**

### Requirements

- A domain name with Cloudflare
- A **Linux** VPS with port forwarding for 443 and a random port
- Basic command line skills
- Root access

---

### Install X-UI

1. To install **X-UI**, execute the following in a terminal:

```bash
bash <(curl -Ls https://raw.githubusercontent.com/NidukaAkalanka/x-ui-english/master/install.sh)
```

> Follow the on-screen instructions. Make sure you enable **system startup**.

---

### Disable Firewall

If you're using a Debian-based distro:

1. If `ufw` is not installed, install it:

```bash
sudo apt install ufw
```

2. Disable the firewall:

```bash
sudo ufw disable
```

---

### Access X-UI Panel

1. Open your browser and access:

```
http://<server-ip>:<port-you-set>
```

This will be shown to you after launching X-UI with `sudo x-ui`.

2. Log in with the credentials.

---

### Generate a Self-Signed Certificate

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout selfsigned.key -out selfsigned.crt
```

Make sure you have OpenSSL installed. During the prompt, enter:

- **Country Name (2-letter code)** – e.g., US
- **Common Name (CN)** – enter your domain (e.g., example.com)
- Leave the rest optional or fill as needed.

---

### Configure VMESS Endpoint

1. Tap **"Inbounds"**.
2. Click the **"+"** button to create a new inbound.
3. Configure settings as below:

```
Remark: Name your server
Protocol: VMESS
Listening IP: (leave blank for default)
Port: 443
Total Traffic (GB): (leave blank)
Expiry Date: (leave blank)
Disable Insecure Encryption: Disabled
Transmission: ws
Accept Proxy Protocol: Disabled
Path: /
TLS: Enabled
Domain Name: Your domain name
Upload your Certificate.crt and Private.key
Sniffing: Enabled
```

4. Click **"Add To"** to save.

---

### Forward Port 443

1. Go to the control panel or router of your VPS.
2. Forward port **443**.

---

### Configure Cloudflare

1. Activate your domain in Cloudflare if not already done.
2. Set an **A Record** pointing to your VPS public IP. Make sure to turn on **proxy**.
3. Go to **SSL/TLS** in Cloudflare and set it to **Full** (not **Full Strict**).

---

## You're Done!

Click **Operate** on your inbound in X-UI and then click **QR Code**. You can use this QR code to import into your client or click the QR to copy the share link to your clipboard.

Make sure to enable AES encryption in your client by editing the config.

> **Hint:** Check the documentation of your client or search online for configuration steps.
