# Security

### Securing your panel

Thanks to [Gholts (Hugo Lee)](https://github.com/Gholts) for pointing this out.

After installing your panel, you want to make sure it’s secure so it doesn’t get detected by firewalls. This is essential because, without HTTPS, all passwords you send can be intercepted.

To access the panel for the first time, use SSH port forwarding. Once inside, you should set up HTTPS immediately.

### What You Need

* An X3-UI panel
* A domain name
* Your X3-UI panel running on port 2053
* Cloudflare account

This setup works specifically for the X3-UI panel.

---

### Steps to Secure Your Panel

1. **Login to Your Panel**
   After logging in, you should see a warning banner like this:

   *Security Alert: This connection is not secure. Please avoid entering sensitive information until TLS is activated for data protection.*

2. **Open Panel Settings**

   * Click on **Certificates** in the dropdown.
   * You should see input boxes for:

     * Public Key Path
     * Private Key Path

3. **Generate SSL Certificates**
   SSH into your VPS and run:

   ```bash
   openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout key.pem -out cert.pem -subj "/CN=localhost"
   ```

   This will generate:

   * `key.pem` → your private key
   * `cert.pem` → your public certificate

4. **Locate Certificate Paths**
   Run:

   ```bash
   pwd
   ```

   to see your current directory (e.g., `/root`).

   * Public Key Path example: `/root/cert.pem`
   * Private Key Path example: `/root/key.pem`

   Make sure you use the correct paths when entering them into the panel.

5. **Configure Panel with Certificates**

   * Go back to X3-UI.
   * Paste the paths in the corresponding fields:

     * Public Key Path → `cert.pem`
     * Private Key Path → `key.pem`
   * Click **Save** at the top, then **Restart Panel**.

6. **Configure Cloudflare**

   * Login to Cloudflare.
   * Add an **A record** pointing your domain or subdomain to your VPS IP. Enable proxy!
   * Go to the **SSL/TLS** section and change the SSL mode from **Flexible** to **Full** (not Full Strict).

Now you can securely access your panel using `https://yourdomain:2053`.
