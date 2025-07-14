document.addEventListener("DOMContentLoaded", function () {
  const head = document.head;

  // Helper function to create and append meta tags
  function addMeta(attrs) {
    const meta = document.createElement("meta");
    for (const [key, value] of Object.entries(attrs)) {
      meta.setAttribute(key, value);
    }
    head.appendChild(meta);
  }

  // Basic SEO
  addMeta({
    name: "description",
    content: "A guide to deploy your own censorship circumvention tools.",
  });
  addMeta({ name: "author", content: "Zenith Rifle" });
  addMeta({ name: "robots", content: "index, follow" });

  // Open Graph
  addMeta({ property: "og:title", content: document.title });
  addMeta({
    property: "og:description",
    content: "A fox with a text Access Freely, Bypass Censorship.",
  });
  addMeta({ property: "og:type", content: "website" });
  addMeta({ property: "og:url", content: window.location.href });
  addMeta({
    property: "og:image",
    content: "https://files.catbox.moe/1mcjvr.png",
  });

  // Twitter Cards
  addMeta({ name: "twitter:card", content: "summary_large_image" });
  addMeta({ name: "twitter:title", content: document.title });
  addMeta({
    name: "twitter:description",
    content: "A guide to deploy your own censorship circumvention tools.",
  });
  addMeta({
    name: "twitter:image",
    content: "https://files.catbox.moe/1mcjvr.png",
  });

  // Canonical link
  const linkCanonical = document.createElement("link");
  linkCanonical.rel = "canonical";
  linkCanonical.href = window.location.href;
  head.appendChild(linkCanonical);

  // Optional: favicon
  const favicon = document.createElement("link");
  favicon.rel = "icon";
  favicon.href = "/favicon.ico";
  head.appendChild(favicon);
});
