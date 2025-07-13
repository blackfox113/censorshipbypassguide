# NaïveProxy Setup Guide

---

## What is NaïveProxy?

**NaïveProxy** is a lightweight, high-performance proxy tool designed to bypass internet censorship. It supports both HTTP/2 and HTTP/3, and disguises itself as regular web traffic. Built on Chromium with integrated TLS encryption, it's secure, fast, and efficient—perfect for avoiding restrictions without drawing attention.

---

## Why Choose NaïveProxy?

- **Looks Like Normal Traffic**: Uses Chromium’s TLS stack, so it blends in like any other browser session.
- **Simple to Use**: Easy to set up even if you're not super technical.

---

## Getting Started with NaïveProxy + Caddy

### What You’ll Need

- A **domain name**, preferably managed through Cloudflare or a similar DNS provider.
- A **Linux VPS** with ports **443** and **80** open.
- **Basic requirements**:
  - Some familiarity with the command line
  - Root access to your server

---

## Step-by-Step Setup

### 1. Switch to the Root User
```bash
sudo -s
```

### 2. Update Your System
```bash
apt update
```

### 3. Install Go
```bash
apt-get install software-properties-common
add-apt-repository ppa:longsleep/golang-backports
apt-get update
apt-get install golang-go
```

### 4. Install `xcaddy`
```bash
go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest
```

### 5. Build Caddy with the NaïveProxy Plugin
```bash
~/go/bin/xcaddy build \
  --with github.com/caddyserver/forwardproxy@caddy2=github.com/klzgrad/forwardproxy@naive
```

---

## Configuration

### 6. Create a `Caddyfile`

Make a new file called `Caddyfile` and paste in the following. Be sure to replace the placeholder values with your own:

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

> Make sure to replace `your-domain.com`, `your-email@example.com`, `username`, `password`, and `https://example.com` with your actual values.

---

## Caddy Commands

### Run in the foreground
  ```bash
  ./caddy run
  ```

### Run in the background
  ```bash
  ./caddy start
  ```

### Stop server
  ```bash
  ./caddy stop
  ```

### Reload the configuration
  ```bash
  ./caddy reload
  ```

---

## Getting it Running

### 7. Generate SSL Certificates

Start Caddy once to generate SSL certificates:

```bash
./caddy run
```

Once you see it’s running, press `Ctrl + C` to stop it.

### 8. Start Caddy in the Background

```bash
./caddy start
```

---

## You're Done!

Your NaïveProxy server is now up and running.

Set up your client to connect using the domain, username, and password you defined, using port 443. Don’t forget to use the domain name in the Server Name Indication (SNI) field. Everything else can stay at default settings.
