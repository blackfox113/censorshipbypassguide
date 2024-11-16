Kasm Workspaces

## **What is Kasm Workspaces?**

Kasm Workspaces is a containerized desktop and application streaming platform designed for secure remote access. It utilizes Docker containers to provide isolated, browser-based environments for applications, desktops, and development tools. Highly scalable and customizable, Kasm finds ideal applications in cases such as:

- Remote work
- Software development
- Cybersecurity

With a robust security framework and a high-performance model, it is a perfect solution for any organization or entity that would want to safely and remotely access computing resources.

---

## **Key Terms Explained

| **Term**          | **Definition**                                                                           |
|--------------------|------------------------------------------------------------------------------------------|
| **Kasm Workspaces**| A platform for the secure streaming of a desktop and/or application via web browser.          |
| **Containerized**  | Run applications in isolated, light operating system virtualizations (containers) for consistency and security. |
| **Streaming**      | Applications or desktops delivered over the internet (via a browser) with no downloads or installs. |
| **Platform**       | An environment or system in which software or applications are created and executed.
| **Docker**         | Tool used to build and manage containers so that software is deployed in a straightforward way.
| **Web-based**  | Accessible within a browser; no software download is required.              |
| **Scalable**       | Can handle increased loads by scaling resources without performance loss.
| **Customizable**   | Configurable to suit particular needs or preferences.                                    |
| **Remote Work**    | The ability to work outside of an office environment due to enabling online tools.      |
| **Cybersecurity**  | Protection for systems, networks, and data from digital threats.                            |

---
## **How Can Kasm Help Bypass Censorship?**

Users can evade any such censorship by creating a Kasm Workspace on a remote Virtual Private Server (VPS). Kasm provides access to the applications you will be using over a browser via encryption; as such, it will be very challenging for censors to determine what you are doing. Unlike typical web proxies, Kasm allows users to interact with full tooling remotely, such as **Visual Studio Code** or a terminal.

### **Advantages:**
- **Encryption:** Secure and private communication.
- **Versatility:** Remote access to full applications and development tools.
- **Stealth:** Activities appear as regular web browsing to observers.
### Limitations
- **No GPU Acceleration:** Kasm does not support GPU-intensive tasks unless properly configured.
- **Limited graphics performance:** If pre-rendered on the server, graphics can show slow performance; hence, it is not a recommended use for video streaming or gaming.
---
Prerequisites
• A domain name;
• A Linux VPS with port 443 forwarded;
• Basic command-line skills;
• Root access.
---
Step 1: Become Root

Switch to the root user with the following command:
```bash
sudo -s
```

---
### **Step 2: Install Kasm Workspaces**

At this point, download and install Kasm with this command:
```bash
cd /tmp && curl -O https://kasm-static-content.s3.amazonaws.com/kasm_release_1.13.1.421524.tar.gz && tar -xf kasm_release_1.13.1.421524.tar.gz && bash kasm_release/install.sh
```

You will be asked to accept the EULA during the installation. After installation is complete, Kasm will provide you with credentials; for example, the admin username and password. You should save this in a secure location.

---

### **Step 3: Verify Installation**

Using a browser navigate to HTTPS your server's IP address. For example:
```
https://<your-server-ip>
```

You should see an untrusted certificate warning screen. Click through to the site.

![Untrusted Certificate Screen](https://i.ibb.co/VJcDBBj/image.png)

---
### **Step 4: Configure SSL with Let's Encrypt**

1. **Stop Kasm:**
   ```bash
   /opt/kasm/bin/stop
   ```

2. **Install Let's Encrypt:**
   (Assuming you are running a Debian-based distribution)
   ```bash
apt -y install letsencrypt && cd /opt/kasm/current/certs
   ```
   ```
3. **Create an SSL Certificate:**
   Change out `example.com` with your domain name:
   ```
bash
   certbot certonly --standalone --agree-tos --preferred-challenges http -d example.com
   ```

4. **Backup Old Certs:**
   ```
bash
   mv kasm_nginx.crt kasm_nginx.crt.bk && mv kasm_nginx.key kasm_nginx.key.bk
   ```

5. **Create Symlinks to Certs:**
   ```
ln -s /etc/letsencrypt/live/example.com/privkey.pem kasm_nginx.key
   ln -s /etc/letsencrypt/live/example.com/fullchain.pem kasm_nginx.crt
   ```
6. **Restart Kasm:**
   ```bash
   /opt/kasm/bin/start
   ```
---
### **Step 5: Access Kasm Workspaces**
Open your domain name in a browser. Log in with the credentials from the installer. Congratulations, your Kasm Workspaces environment is now ready to go!
