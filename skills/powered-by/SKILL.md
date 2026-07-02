---
name: powered-by
description: Add the "Powered by Live Web Studios" footer credit to every page in the current project and enforce the verifiedsecured.png badge at exact intrinsic pixel dimensions. Use when wrapping up a build, finalizing footers, or when the user asks to add the LWS credit / verify the badge sizing.
---

# /powered-by — LWS Footer Credit + Badge Dimension Check

Adds a **"Powered by Live Web Studios"** credit line to every footer in the
current project (with **Live Web Studios** linking to
`https://livewebstudios.com` in a new tab) and verifies the
`verifiedsecured.png` badge image is rendered at its **exact intrinsic
height and width** in CSS.

---

## What this skill does

1. Reads the natural pixel dimensions of `images/verifiedsecured.png`
   (intrinsic width × height) and reports them.
2. Updates the project's stylesheet so `.footer-badge img` uses the exact
   pixel width and height — no `100%`, no `auto`, no scaled value.
3. Injects the credit line into every footer that does not already have it:
   ```html
   <span class="footer-credit">Powered by <a href="https://livewebstudios.com" target="_blank" rel="noopener">Live Web Studios</a></span>
   ```
4. Reports the file count touched in one line.

---

## Step 1 — Locate the badge image and measure it

Run this PowerShell to find the badge PNG and read its intrinsic dimensions:

```powershell
$badge = Get-ChildItem -Recurse -Filter "verifiedsecured.png" -ErrorAction SilentlyContinue | Select-Object -First 1
if (-not $badge) {
  Write-Host "ERROR: verifiedsecured.png not found in this project."
  return
}
Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Image]::FromFile($badge.FullName)
$w = $img.Width
$h = $img.Height
$img.Dispose()
Write-Host "verifiedsecured.png located: $($badge.FullName)"
Write-Host "Intrinsic dimensions: ${w}px wide x ${h}px tall"
```

On macOS / Linux, use:

```bash
badge=$(find . -name "verifiedsecured.png" | head -1)
sips -g pixelWidth -g pixelHeight "$badge"   # macOS
# or: identify -format "%wx%h" "$badge"      # Linux with ImageMagick
```

Use the returned values as the exact `w` and `h` to enforce in CSS.

---

## Step 2 — Verify / fix the CSS rule

Find the `.footer-badge img` block in the project's stylesheet (typically
`css/nav.css` or `css/style.css`) and ensure it reads exactly:

```css
.footer-badge img {
  width: {{w}}px;
  height: {{h}}px;
}
```

If the rule already matches, leave it alone. If it uses `100%`, `auto`,
or any other value, replace with the exact intrinsic pixel values.

Per LWS Rule: image must render at its true native resolution so the
"Verified & Secured" mark stays crisp at 1× and 2× displays.

---

## Step 3 — Inject the "Powered by Live Web Studios" credit

Locate every `.html` file in the project and check whether the footer
contains `Powered by Live Web Studios`. If it does NOT, insert this line
immediately before the `.footer-badge` anchor inside `.footer-bar__inner`:

```html
<span class="footer-credit">Powered by <a href="https://livewebstudios.com" target="_blank" rel="noopener">Live Web Studios</a></span>
```

If the credit is already present, skip the file.

---

## Step 4 — Add credit styling (one-time)

If `.footer-credit` is not yet defined in the stylesheet, append:

```css
.footer-credit {
  font-size: 0.8125rem;
  color: rgba(255, 255, 255, 0.65);
}
.footer-credit a {
  color: inherit;
  text-decoration: underline;
  text-underline-offset: 2px;
}
.footer-credit a:hover,
.footer-credit a:focus-visible {
  color: #fff;
}
```

---

## Step 5 — Report

Report to the user in ONE line:

```
Powered-by credit added to N footer(s); badge confirmed at WxH px exact.
```

---

## Hard rules (must hold)

- The "Live Web Studios" anchor MUST use `target="_blank" rel="noopener"`.
- The badge `<img>` MUST stay an `<img>` tag (never CSS / background-image).
- All asset paths in the footer MUST remain relative (no leading slash, no
  full domain). See global LWS path rule.
- Do NOT remove or modify the existing `Verified & Secured` badge anchor —
  this skill ADDS the credit line; it does NOT replace the badge.

*Live Web Studios — Est. 2004 | livewebstudios.com*
