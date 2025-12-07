
# Hysteria 2 SNI Spoofing

By following this guide, I assume you already have a Hysteria 2 server set up.

> Warning: Using a self‑signed certificate may expose you to Man‑in‑the‑Middle attacks. Only use this method if you understand the risks. You can do certificate pinning on the client side to mitigate some risks.

---

### What you need

* OpenSSL installed on your server
* A domain you want to spoof (can be as simple as zoom.us or onedrive.com)
* Hysteria 2 server installed and running

---

### Step 1: Stop the Hysteria 2 server

```bash
systemctl stop hysteria-server
```

### Step 2: Create a self‑signed SSL certificate

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout h2.key -out h2.crt -subj "/CN=YOURSNI"
```

For example, if you want to spoof zoom.us, replace YOURSNI with zoom.us:

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout h2.key -out h2.crt -subj "/CN=zoom.us"
```

### Step 3: Edit the configuration file to use the new certificate

Then run `ls` to see the files you have created:

```bash
ls
```

You should see the 2 files named `h2.key` and `h2.crt`.

Now run `pwd` to see your current directory:

```bash
pwd
```

Now point the Hysteria config to the new certificate and key you have created:

```bash
nano /etc/hysteria/config.yaml
```

Delete the section called:

```yaml
acme:
  domains:
    - domain1.com
    - domain2.org
  email: your@email.net
```

And add this section instead:

```yaml
tls:
  cert: some.crt
  key: some.key
```

Replace `some.crt` and `some.key` with the full path to the `h2.crt` and `h2.key` you created. Use `pwd` to see the directory and combine the file name with the output of `pwd`.

Example:

```yaml
tls:
  cert: /root/h2.crt
  key: /root/h2.key
```

### Step 4: Start the Hysteria 2 server

```bash
systemctl start hysteria-server
```

### Step 5: Configure your client

Make sure to enable insecure mode, and everything else should be normal. Make sure you set the SNI as whatever SNI you used during certificate creation.

---

This method won’t work with Cloudflare proxy.
