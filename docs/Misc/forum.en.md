# Forum

For privacy reasons, we don't use traditional forum software. We prefer BBS, which is an old-school type of forum. We use BBS because it's simple, lightweight, and free of tracking. To use BBS, you don't really need anything beyond OpenSSH (which comes preinstalled on Windows 11) or Telnet, which is the older (and less secure) method. I always recommend using a VPN or proxy before connecting.

First, you need to use Telnet to create your account. Once that's done, you can use SSH to access it.

### Register via Telnet:

1. Make sure Telnet is installed (search online for instructions).

2. Run:

   ```
   telnet bbs.7844380499.cfd 50067
   ```

3. Once you're in, you'll see a text-based menu. Use arrow keys and Enter to navigate. Be respectful—no spam, no doxxing, malware, NSFW.

4. During the sign-up process, the program will ask for your real name, web email, etc. If you don’t want to share that information, you can simply provide a set of fake details. However, it's best to include your location, as we can offer better assistance based on your country's environment. For example, if you're in China, enter: China, Earth, and so on.

### Connect via SSH:

Run:

```
ssh yourregisteredusername@bbs.7844380499.cfd -p 50063
```

Replace `yourregisteredusername` with the username you registered via Telnet.

Done! You're now in!
