// docs/javascripts/extra.js

document.addEventListener("DOMContentLoaded", function () {
  // Define your social image URL - REPLACE THIS WITH THE ACTUAL DIRECT LINK FROM CATBOX
  const socialImageUrl = "https://files.catbox.moe/renxy1.png"; // e.g., 'https://files.catbox.moe/abcdef.jpg'

  // Define your embed text description
  // This description should complement the image and be concise.
  const socialDescription =
    "A guide to install censorship circumvention tools.";

  // Function to create and append meta tags (remains the same)
  function createMetaTag(property, content, name = null) {
    let meta = document.createElement("meta");
    if (property) {
      meta.setAttribute("property", property);
    }
    if (name) {
      meta.setAttribute("name", name);
    }
    meta.setAttribute("content", content);
    document.head.appendChild(meta);
  }

  // Open Graph (Facebook, LinkedIn, etc.)
  createMetaTag("og:image", socialImageUrl);
  createMetaTag("og:image:width", "1200"); // Set to your image's width (assuming 1200)
  createMetaTag("og:image:height", "630"); // Set to your image's height (assuming 630)
  createMetaTag(
    "og:image:alt",
    'Wolf silhouette with text "Access Freely Bypass Censorship"',
  ); // IMPORTANT for accessibility
  createMetaTag("og:description", socialDescription);

  // Twitter Card
  createMetaTag("twitter:card", "summary_large_image", "twitter:card");
  createMetaTag("twitter:image", socialImageUrl, "twitter:image");
  createMetaTag(
    "twitter:image:alt",
    'Wolf silhouette with text "Access Freely Bypass Censorship"',
    "twitter:image:alt",
  ); // IMPORTANT for accessibility
  createMetaTag(
    "twitter:description",
    socialDescription,
    "twitter:description",
  );

  // You might also want to set a consistent title if MkDocs' default doesn't quite fit:
  // createMetaTag('og:title', 'Your Site Name Here: Access Freely');
  // createMetaTag('twitter:title', 'Your Site Name Here: Access Freely', 'twitter:title');
});
