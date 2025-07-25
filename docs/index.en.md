# Introduction

![Banner](https://files.catbox.moe/1mcjvr.png)

Welcome to the Censorship Bypass Guide. This is a full-featured documentation that will teach you how to configure your own censorship circumvention tools for server and client.

## Why do I need to use censorship circumvention tools like VLESS when VPNs exist?

Most VPN providers do not operate in censored countries like China. And if they do work in China, they mostly have collaboration with the Chinese government to monitor what you're doing. Even if the VPN provider is outside of China, they often don't provide a way to connect securely without getting blocked.

Remember Shadowsocks? It is still supported by Mullvad, but the problem is that the GFW (Great Firewall) in China is really good at detecting Shadowsocks traffic and blocking it.

That's why we recommend you use your own server at home or on a cloud provider to deploy your own censorship circumvention tool—keeping all your data to yourself.

### Setup Recommended:

| Environment                                   | Recommended Setup                  |
|----------------------------------------------|------------------------------------|
| School (Custom Firewall)                     | VLESS + CDN + WS + TLS             |
| School (Prebuilt Solution)                   | VLESS + CDN + WS + TLS             |
| Work (Custom Firewall)                       | VLESS + CDN + WS + TLS             |
| Work (Prebuilt Solution)                     | NaïveProxy                         |
| Work/School (TLS MITM)                       | VMESS + AES + CDN + WS + TLS       |
| Iran                                          | NaïveProxy                         |
| China                                         | NaïveProxy                         |
| Russia                                        | GoodbyeDPI                         |
| Gaming in school/work/public Wi-Fi or China  | Hysteria 2                         |

**Note:**
- **"Solution"** means the school or workplace is using pre-existing firewall software or a commercial solution (e.g., Palo Alto, Fortinet).

- **"Custom"** means they developed their own firewall or heavily modified open-source software.

- Some school, work, or public Wi-Fi networks block UDP or QUIC, so Hysteria 2 can't be used.


All software used in this guide is open source, except for part of Kasm Workspace.

AI is used throughout the guide only to help with spelling and grammar. Me and Wispy wrote all of this from scratch. Why did we use AI? I am Chinese and not very good at English.

Free subdomains can be used for these proxies, found here: [DigitalPlat](https://dash.domain.digitalplat.org). (We don't get paid we just like the service and I use it my self.)

> [!WARNING]
> **We are not responsible for any damages that may occur while attempting censorship circumvention.** This guide exists as an educational resource for people to learn about censorship.
> 

