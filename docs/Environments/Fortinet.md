# Fortinet

This really depends on your system admin at your work or your school.

But the problem is that fortinet by default make your proxy wheather its naive vmess or vless unrated which means it has a daily quota.

We can bypass this by doing SNI spoofing on a trusted website eg zoom.com

This works becaue zoom is on cloudflare CDN and its trusted by the firewall by default.

Open your cloudflare dashboard and enable proxy and make sure websockets is enable inside the network tab.

You can just open your client and edit the config and set the SNI to zoom.com.

And you are all done you have spoof the SNI.

If zoom dont work and its being blocked by your school without a proxy please use other unblocked website that uses cloudflare cdn.
