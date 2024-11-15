# V2Ray Setup Guide

## What is V2Ray?

V2Ray is a robust proxy tool that enhances privacy, bypasses censorship, and supports multiple protocols. It encrypts internet traffic, ensuring secure and unrestricted browsing.

> **Note:** V2Ray is a protocol framework, not a server provider. You can either set up your own server or use a provider (often referred to as "机场" in Chinese).

### Common Protocols:
- **VLESS**: Lightweight and generally better for servers.
- **VMESS**: More configurable with advanced features for bypassing strict censorship.

The most popular setup is: `VLESS + CDN + WS + TLS`.

---

### Explanation of Terms

| Term   | Meaning                                                                 |
|--------|-------------------------------------------------------------------------|
| VLESS  | A protocol used in V2Ray configurations.                                |
| WS     | WebSocket, an upgraded HTTP protocol supporting real-time data syncing. |
| TLS    | Encryption protocol protecting data from being visible to firewalls.    |
| CDN    | Content Delivery Network; caches content closer to users for speed and makes servers harder to block. |

---

## Setup: **VLESS + CDN + WS + TLS**

### Requirements
- A domain name (e.g., via Cloudflare)
- A VPS with port forwarding for 443 and a random port
  *(Web hosting services like Render or Koyeb can also work; they often include a domain and CDN.)*
- Basic command-line skills

---

### Install X-UI
1. Run the following command to install **x-ui**:
   ```bash
   bash <(curl -Ls https://raw.githubusercontent.com/NidukaAkalanka/x-ui-english/master/install.sh)
   ```
   > Follow the instructions to install. Ensure you enable **system startup**.

---

### Disable Firewall
If using a Debian-based distro:

1. Install `ufw` (if not already installed):
   ```bash
   sudo apt install ufw
   ```
2. Disable the firewall:
   ```bash
   sudo ufw disable
   ```

---

### Access X-UI Panel
1. Open your browser and navigate to:
   ```
   http://<server-ip>:<port-you-set>
   ```
2. Log in with your credentials.

---

### Set Up the VLESS Endpoint
1. In the X-UI panel, click **"Inbounds"**.
2. Click the **"+"** button to add a new inbound.
3. Configure as follows:
```plaintext
   Remark: VLESS
   Protocol: vless
   Listening IP: (Leave Blank)
   Port: 443
   Total Traffic (GB): (Leave Blank)
   Expiry Date: (Leave Blank)
   Disable Insecure Encryption: False
   Transmission: ws
   Accept Proxy Protocol: False
   Path: (Keep Default)
   TLS: False
   Sniffing: True
```
4. Click **"Add To"** to save.

---

### Forward Port 443
1. Access your VPS control panel or router settings.
2. Forward port **443**.

---

### Set Up Cloudflare
1. Ensure your domain is active in Cloudflare.
2. Add an **A Record** pointing to your VPS IP.
   - The name can be anything you like.
   - Ensure the proxy is **enabled**.
3. Navigate to the **SSL/TLS** tab in Cloudflare:
   - Change the mode to **Full** (not **Full Strict**).

---

## You're Done!
You can now configure your V2Ray client.

> **Tip:** Refer to your client documentation or search online for configuration guides.
