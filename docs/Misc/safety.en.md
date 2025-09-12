# Safety Guide

Using a VPN or proxy always carries risks. Depending on your location, it could even be illegal. Take precautions to protect yourself.

---

### For Users Bypassing the Chinese GFW (Great Firewall):

1. **Avoid Chinese email services:** Providers like QQ Mail or 163 Mail may be accessible to authorities. Opt for more secure services like Proton Mail for activities that are restricted in China.
2. **Do not use Chinese phone numbers:** These can be easily traced or monitored.
3. **Steer clear of extreme political discussions:** Avoid engaging in sensitive or highly controversial topics.
4. **Avoid personal identifiers:** Refrain from using Chinese names, real-life profile pictures, or other personal information.
5. **Limit the use of Chinese software:** Minimize the risk by avoiding Chinese-developed software on your device.

---

### General Safety Tips:

1. **Avoid online banking:** Be cautious when accessing sensitive financial information over a VPN or proxy.
2. **Understand traffic visibility:** VPN or proxy servers can see some of your data, so only use trusted services.

---

### SSL MITM Attack

Some schools require students to install a custom CA certificate, which lets them intercept and decrypt SSL/TLS traffic. This breaks protocols like VLESS, meaning they can see what websites you're visiting.

In this case, consider switching to VMESS. It adds an extra layer of AES encryption on top of TLS/SSL, which helps protect your traffic from being inspected.

You can read more about this here: [Link](https://theglitchreport.qzz.io/posts/moving-on-from-vless-to-vmess/)
