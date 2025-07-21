# Networking

## Connecting to the Server

There are a couple of ways to connect to a server. The method mentioned throughout this documentation is **direct connection**.

![Connecting to the proxy server](https://files.catbox.moe/8nohs6.png)

Let me walk you through each method one by one.

---

### Direct Connection

Pretty easy to understand—it uses **NaiveProxy** or the **V2Ray suite** to connect directly to the proxy server. The upside is that it’s very simple to run and the cheapest option. The downside is that it can be very, *very* slow during peak hours (like 10 p.m. in China), and it’s also very easy to block if detected as a proxy server.

---

### IPLC Forwarding

First, let’s understand what **IPLC** is. IPLC stands for **International Private Leased Circuit**. Instead of sharing the same international bandwidth where congestion happens, you get a dedicated circuit to route your traffic.

Put simply: it’s like having your own lane on the highway, reserved just for you. Since it’s private, it bypasses the Great Firewall (GFW) and can’t be blocked—unless, of course, the owner gets arrested or something drastic happens.

Think of it like your home router: even if the general internet is slow due to congestion, your local network transfers between devices stay blazing fast.

---

### Normal Forwarding

Having an inbound server located in China means a more stable connection for customers.

Let’s say you're running an airport (a proxy server company). Instead of asking customers to change servers whenever one gets blocked, **you** can manage that from your end.

It also means customers (or you) can use **ShadowSocks**, which might be more widely compatible.

However, unless the inbound server uses a **custom international route** (like CN GIA2 – Global Internet Access), it still goes through the GFW, so speeds will drop during peak hours.

It’s also **more expensive** to run and **riskier**, since you’re hosting a server inside China.
