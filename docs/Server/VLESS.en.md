# VLESS

What is VLESS?
VLESS is a proxy protocol—remember, it's not a VPN. VLESS is an ultra-fast, minimalistic protocol that strips out the unnecessary parts of VMESS. It is being developed by Xray, a fork of V2Ray.

You can configure VLESS to use no encryption or to use TLS for encryption. Because it relies on TLS, it is very lightweight. VLESS supports multiple ways of transporting data under different censorship scenarios, such as WebSockets (WS), TCP, QUIC, KCP, HTTP, HTTP upgrade, and gRPC.

We recommend TLS over VLESS because it adds encryption, and a CDN provides a way to hide the proxy—almost making it unblockable.

---

### Terms Explanation

| Term  | Meaning                                                                                                          |
| ----- | ---------------------------------------------------------------------------------------------------------------- |
| VLESS | A protocol used in V2Ray configurations.                                                                         |
| WS    | WebSocket, an upgraded HTTP protocol supporting real-time data syncing.                                          |
| TLS   | Encrypts data so it is not visible to firewalls.                                                                 |
| CDN   | Content Delivery Network; puts content closer to users for speed and makes blocking servers much more difficult. |

---

## Setup: **VLESS + CDN + WS + TLS**

### Requirements

* A domain name with Cloudflare
* A **Linux** VPS with port forwarding for 443 and a random port
  *(Other web hosting services like Render or Koyeb will also do; they provide a domain and CDN in most cases.)*
* Basic command line skills
* Root access

---

### Install X-UI

1. To install **x-ui**, execute the following in a terminal:

```bash
bash <(curl -Ls https://raw.githubusercontent.com/NidukaAkalanka/x-ui-english/master/install.sh)
```

> To install, just follow the on-screen instructions. Make sure you enable **system startup**.

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

### Generate TLS/SSL Certificate

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout selfsigned.key -out selfsigned.crt
```

Make sure you have OpenSSL installed. During the prompt, enter:

* **Country Name (2-letter code)** – e.g., US
* **Common Name (CN)** – enter your domain (e.g., example.com)
* Leave the rest optional or fill as needed.

---

### Configure VLESS Endpoint

1. Tap "Inbounds".
2. Click the **"+"** button to create a new inbound.
3. Configure the settings as below:

```
Remark: Name your server
Protocol: vless
Listening IP: blank (default)
Port: 443
Total Traffic (GB): blank (default)
Expiry Date: blank (default)
Disable Insecure Encryption: Disabled (default)
Transmission: ws
Accept Proxy Protocol: Disabled (default)
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

1. Activate your domain in Cloudflare if you haven't already.
2. Set an **A Record** pointing to your VPS public IP. Make sure to turn on the proxy.
3. Go to **SSL/TLS** in Cloudflare:
   Make sure it is set to **Full**, not Full (Strict).

---

## You're Done!

Click **Operate** on your inbound in X-UI and then click **QR Code**. You can use this QR code to import the configuration to your client or click the QR to copy the share link to the clipboard.

> **Hint:** Check your client’s documentation or search online for configuration instructions.
