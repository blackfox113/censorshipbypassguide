# V2Ray

## What is V2Ray?

V2Ray is a very powerful and privacy-enhancing proxy tool. It supports multiple protocols, can bypass the censorship of many countries, and traffic is fully encrypted, securing your internet use without restrictions.

> **Note**: V2Ray itself is only a protocol framework but is not a provider of servers. You may want to either set up your server or subscribe to one, often referred to as "机场" in Chinese .
### Common Protocols:
- **VLESS**: Lightweight and generally better for servers.
- **VMESS**: can be configured with advanced features to bypass highly strict censorship.

The most popular config is: `VLESS + CDN + WS + TLS`.

---
### Terms Explanation

| Term   | Meaning                                                                 |
|--------|-------------------------------------------------------------------------|
| VLESS  | A protocol used in V2Ray configurations.                                |
| WS     | WebSocket, an upgraded HTTP protocol supporting real-time data syncing. |
| TLS    | Encrypts data to not be visible to firewalls.    |
| CDN    | Content Delivery Network; puts content closer to users for speed and makes blocking servers much more difficult. |

---
## Setup: **VLESS + CDN + WS + TLS**

### Requirements
* A domain name with cloudflare
* A **Linux** VPS with port forwarding for 443 and a random port
*(Other web hosting services like Render or Koyeb will also do; they provide a domain and CDN in most cases.)*
- Basic command line skills
- Root

---
### Install X-UI
1. To install **x-ui**, execute the following in a terminal:
```bash
   bash <(curl -Ls https://raw.githubusercontent.com/NidukaAkalanka/x-ui-english/master/install.sh)
```
   > To install, just follow on-screen instructions. Make sure you enable **system startup**.

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
1. Open your browser and access the:
   ```
   http://<server-ip>:<port-you-set>
   ```
2. Log in with your credentials.

---

### Configure VLESS Endpoint
1. Tap "Inbounds".
2. Click the **"+"** button to create a new inbound.
3. Settings as below:
```
   Remark: VLESS
   Protocol: vless
   Listening IP: (Leave Blank)
   Port: 443
   Total Traffic (GB): (Leave Blank)
   Expiry Date: (Leave Blank)
   Disable Insecure Encryption: False
   Transmission: ws
   Accept Proxy Protocol: False
   Path: keep default
   TLS: False
   Sniffing: True
```
4. Click **"Add To"** to save.

---

### Forward Port 443
1. Go to the control panel or router of your VPS.
2. forward port **443**.

---

### Configure Cloudflare
1. Activate your domain in Cloudflare if you don't already have it.
2. Set an **A Record** pointing to your VPS IP.  Make sure to turn on proxy.
3. Go to **SSL/TLS** on Cloudflare:
Switch to **Full** but do not enable **Full Strict**.

---
## You're Done!
Now you can configure your V2Ray client.

> **Hint:** Check the documentation of your client or online for configuration.
