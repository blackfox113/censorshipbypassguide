# Holy Unblocker LTS
## **What is Holy Unblocker LTS?**

Holy Unblocker LTS, an experimental web proxy service, can bypass web filters or "blockers" regardless of whether the method of censorship is client-side or network-based. This includes the potential ability to bypass content blockers from governments, chrome extensions, localized client firewalls, and network-related filters. The project even allows the ability to browse Tor/Onion sites in any browser (even Chromium) all through a website

Out of all web proxies it is the most maintained, available (restocks) and advanced due to it focusing on bypassing filters. The source is randomized and features other techniques such as shadow DOM to be difficult to source block. A good use case of this project would be if you ever needed a clientless solution to use Tor or leave minimal traces of device activity.
 
### **What is a Web Proxy?**

The web proxy will enable you to visit various websites indirectly by redirecting your connection through a mix of client-side and server-side scripts. While these web proxies are great to bypass restrictions in controlled environments, they support only web traffic.

For more general use cases, for example, accessing desktop applications or creating virtual workspaces, consider using more general-purpose tools such as **Kasm Workspaces**. For simpler needs, a web proxy like Holy Unblocker LTS will do the job.

---

Downsides of Holy Unblocker LTS

1. **Limited Functionality**: Supports only accessing websites over this proxy server which in itself can be limited depending on the site.

2. **Extension Based Filters**: Although this project is equipped with techniques to remain unblocked more difficult extensions can sometimes still target the actual proxy frame. The site itself will be unblocked but the actual browsing frame can be caught due to how assets are rewritten (source cannot exactly be obfuscated even when all leaks are prevented from highly invasive and possibly illegal extensions)

3. **Tor Exit Node:** Even though Holy Unblocker LTS supports Tor you will need to utilize a personal VPS or locally set it up to use it. OR use one of the official links that are restocked frequently in their respective discord server.

---
How to Set Up Holy Unblocker LTS

1. First, visit the repository of the Doge Unblocker in GitHub: [Holy Unblocker GitHub Repository]([https://github.com/DogeNetwork/v4](https://github.com/QuiteAFancyEmerald/Holy-Unblocker)).

2. You can then choose to be hosted by any of the deployment providers. Koyeb is considered the best one. Or you can set this project up locally

3. Follow the instructions regarding the chosen hosting provider.

4. Once the setup is complete, click on the given link and start using your proxy!

5. If you wish to self-host below are the commands for setup. You will need Node.js and Git installed.

```bash
git clone https://github.com/titaniumnetwork-dev/Holy-Unblocker.git

cd Holy-Unblocker

# Using the configuration file you can automatically use pm2 if you are hosting on a VPS!
npm run fresh-install
npm start

# Or on subsequent uses...
npm restart

# If you encounter any build errors...
npm run build

# If you encounter any service errors...
npm run proxy-validator
```

For Debian/Ubuntu:

```bash
sudo apt update
sudo apt upgrade
sudo apt install curl git nginx 

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install 20
nvm use 20

git clone https://github.com/QuiteAFancyEmerald/Holy-Unblocker.git
cd Holy-Unblocker

npm run fresh-install

# Then edit config.json to change production to true to automatically use pm2

npm start

# Then setup a reverse proxy using NGINX; use the link below for the NGINX guide. You can edit the file in /etc/nginx

sudo systemctl restart nginx

# For Tor look it up for basic setup if you need it depending on the OS. No GUI needed but once it is setup once you start the Tor service it will automatically work with HU LTS
```
