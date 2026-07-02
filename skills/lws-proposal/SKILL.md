---
name: lws-proposal
description: Generate a branded Live Web Studios proposal document. Triggers when Jon says "write a proposal", "make a proposal", "new proposal", "draft a proposal", or mentions a client name + the word proposal. Also triggers for "proposal for [name]", "I need a proposal for", or any variant. This skill interviews Jon, drafts the .docx in his voice, and auto-renders a designed layout — one flow, no extra steps. ALWAYS use this skill for any LWS proposal request, even if Jon just mentions a client meeting or says he needs something "to send to a client."
---

# LWS Proposal Generator

Generates a branded, voice-accurate LWS proposal .docx and auto-renders it as a designed layout. No pricing (that's Zoho). No extra steps from Jon.

**Voice source:** This skill no longer holds its own voice rules. Before drafting any text, load `jon_voice_master.md` (bundled in this skill folder; the project also has a copy) and use **Mode A — Email/Proposal**, with the proposal tightening noted there (no "yada yada," no triads, no profanity in a money document). Run the **Part 1 structural kill-list** as a final pass on every line of copy. The master file wins any disagreement.

## Step 1 — Collect Info via AskUserInput

Call `ask_user_input_v0` with these questions in a single call:

**Question 1 — Client info** (text input):
> "Client name, company name, and website/URL — all in one line is fine. (e.g., Jessica, Community Church of Glen Rock, communitychurchglenrock.org)"

**Question 2 — Service type(s)** (multi-select):
Options:
- AI Platformed Website
- Hosting / Site Management
- Graphic Design
- Animation
- Video / Movie Production
- Logo Design
- Print (folders, postcards, pamphlets)
- AI Consulting

**Question 3 — Context one-liner** (text input):
> "One sentence about this client or what they need — just enough to write a smart intro. (e.g., 'Psychology practice, wants a premium immersive site to attract high-end clients')"

**Question 4 — Timeline section needed?** (single select) — **ONLY ASK if NO "AI Platformed Website" was selected:**
Options: Yes, include it | No, skip it

> If "AI Platformed Website" IS selected → timeline is automatic, don't ask.

---

## Step 2 — Draft the .docx

**Load `jon_voice_master.md` and write the cover letter in Mode A.** Do not reconstruct voice rules from memory — read the file. The cover letter and all prose run through the Part 1 kill-list before they go in the doc.

### Cover Letter Rules (proposal-specific, on top of Mode A)
- Open: "Dear [First Name],"
- No wind-up. Get to the point in sentence 1.
- Reference what was discussed (or the context one-liner) naturally.
- Use "AI Platformed" (not "AI-powered," not "AI-built") when the service is an AI Platformed Website.
- Client's first name appears AGAIN in the closing paragraph.
- Clear next step or invitation to reach out.
- Sign: `Jon Wolf` (name) + `President · Live Web Studios` + contact line.
- A proposal CONFIRMS what was already discussed. It does not persuade. Short, plain, confident.
- **Kill-list is strict here:** no em dash, no rule-of-three in the scope phrasing or the cover letter, no "yada yada," no profanity. (The scope bullets below are the classic triad trap — write them as bold-lead + plain description, not as tidy three-part rhythms.)
- NEVER: "I hope this email finds you well," "please don't hesitate," "big moment," "moving forward."

### Scope of Work by Service Type

**AI Platformed Website:**
- Custom design & development — no templates, built for their brand
- Interactive visitor experience — ambient video backgrounds, parallax effects, fluid motion
- Fast, clean HTML — no plugin maintenance, no database overhead
- Mobile-optimized & fully responsive
- SEO-ready structure — heading hierarchy, meta tags, schema, page-speed optimization
- Blog functionality with full client access — post and manage without a developer
- Contact form integration — messages route directly to their inbox
- Staging review before launch — client approves before DNS cutover

> When writing these into the doc, render each as **bold lead term + period + plain description**. Do not chain them into three-part sentences. (Note: the em dashes in the list above are shorthand for the skill author; in the actual doc copy, replace per the kill-list.)

**Hosting / Site Management:**
- Managed WordPress hosting on dedicated server infrastructure
- Daily automated backups with offsite redundancy
- Core, plugin, and theme updates handled, no client action needed
- Uptime monitoring and security scanning
- Direct access to Jon for any questions or quick changes

**Graphic Design:**
- Custom design work tailored to brand identity
- Print-ready and web-ready deliverables
- Revisions included, final approval before delivery
- File formats provided in all required sizes

**Animation:**
- Motion design aligned to brand style
- Deliverables in web-optimized and broadcast formats
- Revisions round included

**Video / Movie Production:**
- Full production scope: concept, shoot, edit, delivery
- Deliverable formats for web, social, and presentation use

**Logo Design:**
- Multiple concept directions presented
- Refined through feedback rounds
- Final files: vector (AI/EPS/SVG), PNG transparent, full-color and mono versions

**Print (folders, postcards, pamphlets):**
- Design to print-ready specifications
- Bleed, crop marks, and color profiles set for press
- PDF proof provided for approval before print release

**AI Consulting:**
- Workflow audit, identify where AI can save time and money
- Tool selection and setup tailored to the business
- Training so the team can use it independently
- Ongoing availability for questions as tools evolve

### Timeline / Process Section (4-step layout)

Include for AI Platformed Website builds (always) and any other service when Jon selects yes:

| Step | Label | Description |
|------|-------|-------------|
| 01 | Build on Staging | Live Web Studios builds the complete site on a private staging server. |
| 02 | Review & Revise | Client reviews, requests revisions, gives final approval. |
| 03 | DNS Cutover | We point DNS to the new site, their domain now on the new platform. |
| 04 | Handoff | Full access to blog and content tools for independent site management. |

For non-website services, adapt step labels and descriptions to match the service type naturally.

### Proposal Number & Date
- Proposal number format: `LWS-[YYYY]-[MMDD]` (e.g., LWS-2026-0522)
- Date: today's date in full (e.g., May 22, 2026)

---

## Step 3 — Build the .docx

Follow `/mnt/skills/public/docx/SKILL.md` for all implementation details.

### Layout Specs (from Dr. Roz Cohen gold standard)

**Page:** US Letter (8.5×11), 1-inch margins all sides.

**Header block (top of page 1 only):**
- LWS logo image left-aligned (use letterhead.png from project assets)
- Right side: address block in small gray text
  ```
  446 Saddle River Rd., Unit 2
  Saddle Brook, NJ 07663
  732.801.9611
  info@livewebstudios.com
  www.livewebstudios.com
  ```

**Client + proposal info block (below header, two columns):**
- Left: "PREPARED FOR" (small caps label) + **Client Name** (bold) + website URL (blue link, small)
- Right: "PROPOSAL" label + **LWS-YYYY-MMDD** (bold) + "DATE" label + **Month DD, YYYY** (bold)

**Cover letter:**
- "Dear [Name]," in bold
- Body paragraphs in 11pt, normal weight, line spacing 1.15
- Signature area: Jon's name in script-style (use blue, slightly larger), then "Jon Wolf" bold, then "President · Live Web Studios", then contact line in small blue text

**Section headers (Scope, Investment, How This Works):**
- Left: section number in brand blue (`#5BA4CF`), small, followed by section title in ALL CAPS, bold, large, separated by a hairline rule below
- Right-aligned italic subtitle (e.g., "AI Platformed Website Full Build")

**Scope bullets:**
- Arrow/chevron character (▸) as bullet, not standard disc bullet
- Bold lead term + period, then normal-weight description on same line
- Light horizontal rule between each bullet item

**Timeline grid (How This Works):**
- 4 equal-width cells in a row
- Each cell: colored top border in `#5BA4CF`, "STEP 0X" in small blue caps, bold label, body description
- Light outer border on each cell

**Footer (page 2):**
- Left: "PROPOSAL · [CLIENT NAME IN CAPS]"
- Right: "PAGE X / X"
- Both in small, light gray

**Colors:** Primary blue `#5BA4CF` · Dark blue/navy `#2D6A9F` · Near-black body `#1A202C` · Light gray secondary `#718096` · Rule/border `#E2E8F0`

**Fonts:** Arial throughout (universally supported). Section numbers/labels small with spaced tracking. Body Arial 11pt.

### Key docx-js Implementation Notes
- Use `ShadingType.CLEAR` not SOLID for table cells
- Arrow bullet (▸) via numbering config with `text: "▸"`
- Signature "script" effect: blue color + italic on "Jon Wolf", no actual script font needed
- Timeline grid = 4-column table, each cell ~2340 DXA wide (4 × 2340 = 9360 content width)
- Hairline rules between scope items: `border: { bottom: { style: BorderStyle.SINGLE, size: 1, color: "E2E8F0" } }`
- Client/proposal info block: 2-column table, no visible borders
- Page footer: tab stop approach (not a table), left text + right-aligned tab

---

## Step 4 — Save & Present

- Save .docx to `/mnt/user-data/outputs/` with filename: `YY_MN_DY_[clientlastname]_proposal.docx`
  - Example: `26_05_22_cohen_proposal.docx`
- Call `present_files` to make it downloadable

---

## Step 5 — Auto-render with Visualizer

Immediately after presenting the file, read `/mnt/skills/public/frontend-design/SKILL.md`, then call `visualize:read_me` (modules: `mockup`) and render a full designed HTML preview using `visualize:show_widget`.

**Visualizer brief:** match the Dr. Roz Cohen gold standard exactly — logo + address header, client/proposal two-column block, cover letter body, numbered section headers with hairline rules, scope bullets with ▸ and bold lead terms, timeline 4-step grid, signature block, footer with proposal ID and page ref. LWS brand colors. Clean white background. Make it feel like a real document, not a webpage.

After rendering:
> "The .docx is downloadable above. Here's the designed layout. Let me know if anything needs adjusting before you send it."

---

## Edge Cases

| Situation | Handling |
|-----------|----------|
| Multiple service types selected | Stack scope sections with a sub-header per service type; cover letter references the combined scope naturally |
| No website URL provided | Skip URL, no placeholder left in the doc |
| Missing context one-liner | Ask before proceeding, don't guess the intro |
| Client is a doctor/title | Use full title in "Dear Dr. [Last Name]," and in the client info block |
| Jon wants to skip the timeline | Respect it, remove the section entirely, don't leave a blank gap |
