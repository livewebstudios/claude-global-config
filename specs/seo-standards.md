# SEO STANDARDS (spec)
## Location: ~/.claude/specs/seo-standards.md
## Applies to: every page, every build. Loaded when a task involves titles, meta, schema, canonical, or sitemap.

---

## HEAD BLOCK: REQUIRED ELEMENTS (in this order)

```html
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>[Page-Specific Title, under 60 chars]</title>
<meta name="description" content="[Unique description, under 155 chars]">
<link rel="canonical" href="https://[domain.com/page-slug]">

<!-- Open Graph -->
<meta property="og:title" content="[Page Title]">
<meta property="og:description" content="[Page description]">
<meta property="og:image" content="https://[domain.com/images/og-image.jpg]">
<meta property="og:url" content="https://[domain.com/page-slug]">
<meta property="og:type" content="website">

<!-- JSON-LD Schema (see below for type requirements) -->
<script type="application/ld+json">...</script>

<!-- GA4 placeholder -->
<!-- GA4: replace G-XXXXXXXXXX -->
```

**og:image minimum dimensions: 1200x630px.** If none exists, note it for Jon. Do not
omit the tag.

---

## CANONICAL TAG: REQUIRED ON EVERY PAGE

```html
<link rel="canonical" href="https://[full-absolute-url-of-this-page]">
```

This is the ONLY place in the codebase where an absolute URL is correct and required.
Fill the real domain once it is known. Use a placeholder comment if the domain is TBD:
`<!-- CANONICAL: update to https://clientdomain.com/page-slug before go-live -->`

---

## JSON-LD SCHEMA: TYPE REQUIREMENTS

Default schema type for LWS clients: **LocalBusiness**

Required fields, always include all of these:

```json
{
  "@context": "https://schema.org",
  "@type": "[BusinessType]",
  "name": "[Business Name]",
  "url": "https://[domain.com]",
  "telephone": "[phone]",
  "email": "[email]",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "[street]",
    "addressLocality": "[city]",
    "addressRegion": "[state abbreviation]",
    "postalCode": "[zip]",
    "addressCountry": "US"
  },
  "areaServed": ["[Primary City]", "[City 2]", "[City 3]"],
  "description": "[One sentence about the business]"
}
```

**@type by client vertical:**
- Plumber -> `Plumber`
- Electrician -> `Electrician`
- General contractor -> `GeneralContractor`
- Architect -> `Architect`
- Counselor / therapist -> `MedicalBusiness` or `LocalBusiness`
- Law firm -> `LegalService`
- Logistics / transport -> `LocalBusiness`
- Church -> `Church`
- Default / everything else -> `LocalBusiness`

Add `ServiceArea` and `hasMap` when address and service region are known.

---

## CONTENT SEO: RULES PER PAGE

- Primary keyword appears in: H1, opening paragraph (first 100 words), and at least one H2.
- Internal link anchor text must describe the destination topic. Never "click here" or "read more".
- Service-area clients: primary city plus at least 2 surrounding towns named naturally in body copy.
- No keyword stuffing. Integrate naturally.

---

## SITEMAP CONVENTION

- Include content pages only (exclude thank-you pages, intake forms, admin routes).
- Hub / main service page priority: `0.90`.
- Child / supporting pages priority: `0.80`.
- No trailing slash on URLs.
- `changefreq`: monthly for most pages, weekly for blog.

---

*Live Web Studios, Est. 2004 | livewebstudios.com | jonwolf@livewebstudios.com*
