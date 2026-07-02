# DECAP CMS (spec)
## Location: ~/.claude/specs/cms-decap.md
## Applies to: any build flagged DECAP CMS: Yes. Loaded when a task involves /admin/, client blog editing, or Netlify Identity.

> **Merge note:** This spec combines two sources. Architecture rules (file collections,
> branded login, renderer pattern) come from the LWS production monolith and win on any
> conflict. The version pin, the crash fix, and the setup walkthrough come from the
> consolidated Decap handoff. Where the handoff's sample `config.yml` showed a folder
> collection, that was illustrative boilerplate and is overridden by the file-collection
> rule below.

---

## HARD RULE: VERSION PIN

Decap CMS must be pinned to **exactly 3.1.2**. No caret, no range.

Versions after 3.1.2 carry a known regression in the image widget. When an optional
(`required: false`) image field is empty or has a malformed reference, it throws:

```
TypeError: Cannot destructure property 'url' of 'e.element.data' as it is undefined.
```

This crashes the whole CMS editor, not just the field.

**Pin it in both places:**

`admin/index.html`
```html
<script src="https://unpkg.com/decap-cms@3.1.2/dist/decap-cms.js"></script>
```
Never `@^3.0.0` or any caret range. The caret is what silently pulls a broken release.

`package.json` (only if Decap is installed as a dependency rather than loaded via CDN)
```json
"decap-cms-app": "3.1.2"
```

**If a site is already crashing on this:** check existing post frontmatter in the blog
collection for an empty or malformed `thumbnail:` line (or whatever the image field is
named) and delete that line entirely. Commit, redeploy.

---

## CMS SCOPE

- Clients manage **blog posts only** via `/admin/`. Jon manages all page-level edits.
- Collections defined in `config.yml`. Netlify Identity handles auth.
- **Always use file collections (single JSON file), never folder/markdown collections.**
  File collections write directly to one JSON file and Netlify redeploys in ~30 seconds.
  Folder collections require a GitHub Action, which is fragile. Skip it entirely.

---

## CUSTOM LOGIN PAGE: REQUIRED WHEN DECAP IS INCLUDED

When a build includes Decap CMS, `admin/index.html` MUST use the LWS custom branded
login page, NOT the Decap default.

Master template lives at:
`https://github.com/livewebstudios/claude-global-config/blob/main/index.html`

**Per-client customization, one change only:**
Change the `<title>` tag to `Site Admin: [Client Name]`. Everything else stays as-is.

---

## SETUP WALKTHROUGH

Applies whether the site is on a `.netlify.app` temporary subdomain or a custom domain.
The Netlify subdomain works fully for Decap, including Netlify Identity auth, and actually
avoids proxy conflicts that show up when routing through third-party DNS.

**1. Connect the repo**
GitHub repo connected to Netlify for auto-deploy on push to `main`.

**2. Create the admin files**
`admin/index.html` loads Decap pinned to 3.1.2 (see the version pin above) and uses the
LWS branded login page (see custom login page above), not the default `Content Manager` shell.

`admin/config.yml` defines the backend and collections:
```yaml
backend:
  name: git-gateway
  branch: main

media_folder: "images/uploads"
public_folder: "/images/uploads"

collections:
  # Illustrative only. Per the CMS SCOPE rule above, LWS production builds use a
  # FILE collection (single JSON file), not the folder collection shown here.
  - name: "blog"
    label: "Blog"
    folder: "blog"
    create: true
    slug: "{{slug}}"
    fields:
      - {label: "Title", name: "title", widget: "string"}
      - {label: "Publish Date", name: "date", widget: "datetime"}
      - {label: "Thumbnail", name: "thumbnail", widget: "image", required: false}
      - {label: "Body", name: "body", widget: "markdown"}
```

**3. Enable Netlify Identity**
Invite-only registration, not open signup.

**4. Enable Git Gateway**
This is what lets Identity-authenticated users commit through the CMS without their own
GitHub credentials.

**5. Invite the client**
Send the invite from Netlify Identity. They set a password and land in `/admin/`.

**6. Access**
CMS lives at `yoursite.com/admin/` (or `yoursite.netlify.app/admin/` pre-launch).

---

## HOW IT WORKS UNDER THE HOOD

Decap wraps a Git workflow. When the client hits Save in the editor, that write becomes a
GitHub commit, which triggers a Netlify rebuild. There is no database. The "CMS" is just a
friendly face on committing content files.

---

## CUSTOM DOMAIN NOTE

Fine to build and test entirely on the `.netlify.app` subdomain. Moving to the custom
domain later does not require redoing the Identity / Git Gateway setup, just point DNS
when ready.

---

*Live Web Studios, Est. 2004 | livewebstudios.com | jonwolf@livewebstudios.com*
