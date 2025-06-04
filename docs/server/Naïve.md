# NaïveProxy Setup Guide

---

## 📘 Definition of NaïveProxy

**NaïveProxy** is a lightweight, high-performance tool designed to circumvent internet censorship. It supports HTTP/2 and HTTP/3 while appearing like regular web traffic. Built on Chromium and integrated with TLS encryption, it ensures a secure and stealthy connection. Its simplicity, low latency, and efficiency make it an ideal solution for bypassing restrictions without raising suspicion.

---

## 🚀 Why NaïveProxy Stands Out

- **TLS Fingerprint Masking**: Uses Chromium’s TLS stack, making proxy usage indistinguishable from a normal browser session.
- **User-Friendly & Accessible**: Easy to install, even for users with limited technical experience.

---

## ⚙️ Setting Up NaïveProxy with Caddy

### ✅ Prerequisites

- **Domain Name**: Managed via Cloudflare or equivalent DNS provider.
- **Linux VPS**: Ensure ports **443** and **80** are open.
- **Basic Requirements**:
  - Basic command-line knowledge
  - Root access to the server

---

## 🛠️ Setup Steps

### 1. Switch to Root User
```bash
sudo -s
```

### 2. Update System Packages
```bash
apt update
```

### 3. Install Go Dependencies
```bash
apt-get install software-properties-common
add-apt-repository ppa:longsleep/golang-backports
apt-get update
apt-get install golang-go
```

### 4. Install Caddy via `xcaddy`
```bash
go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest
```

### 5. Build Caddy with NaïveProxy Plugin
```bash
~/go/bin/xcaddy build \
  --with github.com/caddyserver/forwardproxy@caddy2=github.com/klzgrad/forwardproxy@naive
```

---

## 📝 Configuration

### 6. Create the Caddyfile

Edit a new file named `Caddyfile` with the following contents. Replace placeholders:

```caddyfile
:443, your-domain.com
tls your-email@example.com

route {
  forward_proxy {
    basic_auth username password
    hide_ip
    hide_via
    probe_resistance
  }

  reverse_proxy https://example.com {
    header_up Host {upstream_hostport}
    header_up X-Forwarded-Host {host}
  }
}
```

> 🛑 **Note:** Replace `your-domain.com`, `your-email@example.com`, `username`, `password`, and `https://example.com` with real values.

---

## 🧪 Caddy Commands

- **Run in Foreground**:
  ```bash
  ./caddy run
  ```

- **Run in Background**:
  ```bash
  ./caddy start
  ```

- **Stop**:
  ```bash
  ./caddy stop
  ```

- **Reload Configuration**:
  ```bash
  ./caddy reload
  ```

---

## 🚦 Launch & Finalize

### 7. Generate SSL Certificates
```bash
./caddy run
```
> Let it run to complete SSL generation. Then stop it using `Ctrl + C`.

---

### 8. Start NaïveProxy in Background
```bash
./caddy start
```

---

## 🎉 Final Step

Your NaïveProxy server is now live!
Configure your client to use the domain, username, and password you specified.
