# NaïveProxy

---

## **Definition of NaïveProxy**

NaïveProxy is a very simple and high-performance solution aimed at circumventing clamping of Internet resources. The tool can support such features as HTTP/2 or HTTP/3 and in the process also appear itself in the same way as simple surfing. This concept is executed based on Chromium and integrates TLS encryption thus providing a secure and covert connection. The ease of use, low ping and effectiveness make it a perfect tool to avoid prohibitions in a way that received no questions.

---

## **What Other Features Make NaïveProxy So Exceptional and Why?**

- **TLS Fingerprint Masking**: NaïveProxy employs the Chromium library to implement its transport, making it impossible for detection systems to distinguish the TLS client fingerprint from regular web browsers. Every case of using a proxy server in such detection scenarios is disguised to erase the usage evidence.
- **It’s Really Affordable**: It’s very quick and simple to get NaïveProxy, even for those who are not good with technology.


---

### Setting Up NaïveProxy with Caddy

#### **Prerequisites**
- **Domain Name:** Managed via Cloudflare (or similar DNS service).
- **Linux VPS:** Ensure ports **443** and **80** are open and forwarded.
  *(Alternatively, services like Render or Koyeb, which offer domain and CDN support, can work.)*
- **Basic Requirements:**
  - Basic command-line knowledge.
  - Root access to the server.

---

### **Setup Steps**

#### **1. Switch to Root User**
To simplify commands, elevate to root:
```bash
sudo -s
```

#### **2. Update System Packages**
Ensure your system packages are up to date:
```bash
apt update
```

#### **3. Install Go Dependencies**
Install necessary tools and add the Golang backports repository:
```bash
apt-get install software-properties-common
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt-get update
sudo apt-get install golang-go
```

#### **4. Install Caddy**
Use `xcaddy` to install Caddy:
```bash
go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest
```

#### **5. Build Caddy with NaïveProxy**
Build Caddy with the required plugin for NaïveProxy:
```bash
~/go/bin/xcaddy build --with github.com/caddyserver/forwardproxy@caddy2=github.com/klzgrad/forwardproxy@naive
```

---

### **Configuration**

#### **6. Create Caddy Configuration File**
Open a text editor and input the following configuration. Replace placeholders like `your-domain.com` and `your-email@example.com` with your actual values:
```plaintext
:443, your-domain.com  # Your domain name
tls your-email@example.com  # Your email
route {
  forward_proxy {
    basic_auth username password  # Set your username and password
    hide_ip
    hide_via
    probe_resistance
  }
  reverse_proxy https://example.com {  # Fake site (e.g., Baidu)
    header_up Host {upstream_hostport}
    header_up X-Forwarded-Host {host}
  }
}
```

Save this configuration as `Caddyfile` (case-sensitive).

---

### **Caddy Commands**
- **Start in Foreground:**
  ```bash
  ./caddy run
  ```
- **Start in Background:**
  ```bash
  ./caddy start
  ```
- **Stop:**
  ```bash
  ./caddy stop
  ```
- **Reload Configurations:**
  ```bash
  ./caddy reload
  ```

---

### **7. Install Configuration**
Run the following command to start Caddy and generate SSL certificates automatically:
```bash
./caddy run
```
- Ensure ports **443** and **80** are forwarded correctly.
- Once the SSL certificate is obtained, stop Caddy with `Ctrl + C` if running in the foreground.

---

### **8. Start NaïveProxy**
To start NaïveProxy in the background, run:
```bash
./caddy start
```
This version of Caddy already includes NaïveProxy.

---

### **Final Step**
Your setup is complete! Configure your client to connect to the server using the credentials and domain you set up.
