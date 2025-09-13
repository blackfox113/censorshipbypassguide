# Fortinet

This really depends on your system admin at your work or your school.

But the problem is that Fortinet, by default, makes your proxy—whether it's naive, VMess, or VLESS—**unrated**, which means it has a daily quota.

We can bypass this by doing **SNI spoofing** on a trusted website, e.g., `zoom.com`.

---

## What You Need

You need the new **3x-ui** panel, which is an upgrade from the normal **XUI English** panel.
Why didn’t I choose this for all guides? Because it’s harder for a newbie to set up.

Also, port forward **443** and **80** on the firewall. You will also need a **domain name**.

---

## Installation

If you already have XUI English installed, you can install 3x-ui by running:

```
sudo bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)
```

This applies to new users as well.

Follow the directions on the screen and open the panel Web UI.

Log in, and you will see the dashboard.

> ⚠️ All your existing endpoints will **not** be migrated, so keep that in mind.

---

## Configuration

1. Click **Inbounds**.
2. Click **Add Inbounds**.
3. For **Protocol**, choose `VLESS` if it’s not the default.
4. Follow the config below:

```
Enable: True
Remark: (Any name you want to use)
Protocol: VLESS
Listen IP: (Leave blank)
Port: 443
Total Flow: (Leave default)
Duration: (Leave blank)
Client: Only change one thing from the dropdown — change Flow from 'none' to 'xtls-rprx-vision'
Transmission: TCP (RAW)
Proxy Protocol: False
HTTP Obfuscation: False
Sockopt: False
External Proxy: False
Security: Reality
Show: False
Xver: (Leave default)
uTLS: Chrome or Firefox or Edge (whichever browser you use most often)
Dest (Target): An SNI that is good and must use TLS 1.3 — e.g., `www.microsoft.com:443`
SNI: Same as above, but without the port — e.g., `www.microsoft.com`
Max Time Diff (ms): (Leave default)
Short IDs: (Leave default)
SpiderX: (Leave default)
Click **Get New Cert** — this will auto-fill the Public Key and Private Key.
```

---

## Final Steps

Make sure to point your **domain name** to your **server IP**.
Disable proxying in cloudflare.

**WARNING:** If you are using a VPS, make sure to use HTTPS for the panel. Without it, the firewall between your fps panel and your PC connection can see everything. If you’re using the panel on a home network and not exposing the port, it should be fine. To secure the panel with HTTPS, you can use a free ssl certificate (it will work), or you can search for a guide online. Alternatively, you can take the simpler route and use SSH port forwarding.

Under the menu (click the three dots), click **Export All URLs** and import them into your client.
Depending on the case, you might need to change the address to your **domain name**.
