# Kasm Workspaces

---

## **What is Kasm Workspaces?**

Kasm Workspaces is a high-performance Docker streaming platform. It streams Docker containers to your browser, allowing many popular applications and using Kasm VNC at the very bottom. It can be configured with TLS and Cloudflare CDN.

How can this help us bypass censorship?

Because this is just a website, its fingerprint and everything will match a normal website since it is one. This makes it undetectable; techniques like active probing won’t work to detect it. We recommend you use Cloudflare CDN with this because a CDN can’t be blocked without causing massive internet outages. We also recommend adding basic auth to it so it won’t show a Kasm login screen which the censor might see.

> Note: Parts of Kasm Workspaces are not open source.

---

## **Key Terms Explained**

| **Term**            | **Definition**                                                                                        |
| ------------------- | ----------------------------------------------------------------------------------------------------- |
| **Kasm Workspaces** | A platform for securely streaming desktops and applications via a web browser.                        |
| **Containerized**   | Running applications in isolated, lightweight environments (containers) for consistency and security. |
| **Streaming**       | Delivering applications or desktops over the internet without requiring downloads or installations.   |
| **Platform**        | A system or environment where software or applications are built and run.                             |
| **Docker**          | A tool for creating and managing containers to deploy software.                                       |
| **Browser-based**   | Accessible through a web browser without additional software installation.                            |
| **Scalable**        | Able to handle increased workloads by adding resources without performance loss.                      |
| **Customizable**    | Configurable to meet specific needs or preferences.                                                   |
| **Remote Work**     | Performing work outside a traditional office environment, enabled by online tools.                    |
| **Cybersecurity**   | Protecting systems, networks, and data from digital threats.                                          |

---

## **Kasm Workspaces Setup**

### Prerequisites:

- A **domain name**
- A **Linux VPS** with port 443 forwarded
- Basic command-line skills
- Root access

---

### **Step 1: Become Root**

Run the following command to switch to the root user:

```bash
sudo -s
```

---

### **Step 2: Install Kasm Workspaces**

Execute this command to download and install Kasm:

```bash
cd /tmp && curl -O https://kasm-static-content.s3.amazonaws.com/kasm_release_1.13.1.421524.tar.gz && tar -xf kasm_release_1.13.1.421524.tar.gz && bash kasm_release/install.sh
```

During the installation, you will need to agree to the End User License Agreement (EULA). After installation, Kasm will provide credentials such as the admin username and password. Save this information in a secure location.

---

### **Step 3: Verify Installation**

Visit your server's IP address in a browser using HTTPS. For example:

```
https://<your-server-ip>
```

You should see a warning screen about an untrusted certificate. Proceed to the site.

![Untrusted Certificate Screen](https://i.ibb.co/VJcDBBj/image.png)

---

### **Step 4: Configure SSL with Let’s Encrypt**

1. Stop Kasm:

```bash
/opt/kasm/bin/stop
```

2. Install Let’s Encrypt:
   (Assumes you're using a Debian-based distribution)

```bash
apt -y install letsencrypt && cd /opt/kasm/current/certs
```

3. Obtain an SSL Certificate:
   Replace `example.com` with your domain name:

```bash
certbot certonly --standalone --agree-tos --preferred-challenges http -d example.com
```

4. Backup Existing Certificates:

```bash
mv kasm_nginx.crt kasm_nginx.crt.bk && mv kasm_nginx.key kasm_nginx.key.bk
```

5. Set Up Symlinks for Certificates:

```bash
ln -s /etc/letsencrypt/live/example.com/privkey.pem kasm_nginx.key
ln -s /etc/letsencrypt/live/example.com/fullchain.pem kasm_nginx.crt
```

6. Restart Kasm:

```bash
/opt/kasm/bin/start
```

---

### **Step 5: Access Kasm Workspaces**

Go to your domain name in a browser and log in using the credentials provided during installation. Your Kasm Workspaces environment is now ready to use!
