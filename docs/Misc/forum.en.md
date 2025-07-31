# Forum

For privacy reasons, we don't use traditional forum software. We prefer BBS, which is an old-school type of forum. We use BBS because it's simple, lightweight, and free of tracking. To use BBS, you don't really need anything beyond OpenSSH (which comes preinstalled on Windows 11) or Telnet, which is the older (and less secure) method. I always recommend using a VPN or proxy before connecting.

First, you need to use Telnet to create your account. Once that's done, you can use SSH to access it.

### Register via Telnet:

1. Make sure Telnet is installed (search online for instructions).

2. Run:

   ```
   telnet bbs.zenithrifle.cfd 50067
   ```

3. Once you're in, you'll see a text-based menu. Use arrow keys and Enter to navigate. Be respectful—no spam, no doxxing, malware, NSFW.

### Connect via SSH:

Run:

```
ssh yourregisteredusername@bbs.zenithrifle.cfd -p 50063
```

Replace `yourregisteredusername` with the username you registered via Telnet.

Done! You're now in!
