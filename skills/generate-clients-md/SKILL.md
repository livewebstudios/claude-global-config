---
name: generate-clients-md
description: >
  Reads the LWS Migration Tracker clients-md Google Sheet tab and produces
  a formatted clients.md file ready to upload to Claude Projects. Trigger on:
  "generate clients.md", "update clients.md", "refresh clients.md",
  "regenerate client list", or /generate-clients-md. No questions asked...
  reads the sheet, formats the output, delivers the file.
---

# generate-clients-md

Reads Jon's LWS Migration Tracker Google Sheet and produces a formatted `clients.md` file for upload to the Writing & Content Claude Project. This is a data extraction and formatting skill, not a writing skill. No interaction, no questions. Read the sheet, format the output, deliver the file.

## What this skill is for

`clients.md` is a permanent uploaded file in Jon's Writing & Content project. It gives Claude tone and context for every hosted LWS client (industry, region, contact, relationship, voice) so Jon never has to re-explain a client mid-conversation. This skill regenerates that file from the source of truth: the Google Sheet.

Run this whenever Jon adds a client, edits client info in the sheet, or asks to refresh the file.

---

## Step 0: Detect environment and machine

This skill can run two different ways: inside a claude.ai chat or Cowork session (sandboxed container), or inside Claude Code running directly on Jon's Mac or Windows machine. Detect which one silently, before doing anything else. Don't narrate this check to Jon, just proceed with the right path.

**Sandbox vs local machine:**
- Check whether `/mnt/user-data/outputs` exists and is writable. If yes, this is a claude.ai/Cowork sandboxed session. Use **Sandbox Mode** (Step 6a).
- If that path does not exist, this is Claude Code running on Jon's actual machine. Use **Local Machine Mode** (Step 6b), and detect the OS below.

**Mac vs Windows (Local Machine Mode only):**
Run `uname -s` in bash.
- Returns `Darwin` → macOS. Jon's Mac hostname is `GoldieAir`, username `jonwolf`.
- Command fails, is unrecognized, or the environment is clearly Windows (e.g. `echo %OS%` returns `Windows_NT`, or paths resolve as `C:\Users\...`) → Windows. Jon's Windows username is `drfre`.

**Google Drive access note:** the sheet-read in Step 1 depends on a Google Drive connector being available in the current environment. This is confirmed available in claude.ai. If running in Claude Code and no Google Drive MCP connector is configured, that tool call will fail. Flag this to Jon rather than guessing at sheet contents.

---

## Step 1: Read the sheet

Source data lives in a Google Sheet, tab `clients-md`.

**Spreadsheet ID:** `1CnSxWMXtVwewLcivh5NJ4ypu2jVPc_SO7Txakcp4Z1g`
**Tab name:** `clients-md`

Use the Google Drive `read_file_content` tool with this fileId to pull the sheet content:

```
Google Drive:read_file_content
fileId = 1CnSxWMXtVwewLcivh5NJ4ypu2jVPc_SO7Txakcp4Z1g
```

The tool may return multiple tabs in one response. Locate and isolate the content belonging to the `clients-md` tab specifically before parsing.

**Row structure:**
- Row 1: Banner. Ignore.
- Row 2: Group headers. Ignore.
- Row 3: Column headers. Ignore.
- Row 4 onward: Client data.

**Stop condition:** Stop reading when Column A (Client Name) is empty for a row. Do not hardcode a row count or client count. As of this writing there are 41 clients, but the sheet grows, so always read until Column A goes blank.

---

## Step 2: Column map

Eighteen columns, A through R. Read every row against this exact map:

| Col | Letter | Field | Type | Notes |
|-----|--------|-------|------|-------|
| 1 | A | Client Name | Formula | If empty, stop reading (end of data) |
| 2 | B | Site URL | Formula | Always filled, not currently output but available |
| 3 | C | Contact First Name | Text | Used in Jon's emails |
| 4 | D | Contact Email | Text | |
| 5 | E | Contact Phone | Text | Often blank |
| 6 | F | Industry | Text | |
| 7 | G | City / Region 1 | Text | |
| 8 | H | City / Region 2 | Text | Often blank |
| 9 | I | City / Region 3 | Text | Often blank |
| 10 | J | National? | Y/N text | Literal "Y" or "N" |
| 11 | K | Long Term VIP | Checkbox | TRUE or FALSE |
| 12 | L | Friend | Checkbox | TRUE or FALSE |
| 13 | M | New Client | Checkbox | TRUE or FALSE |
| 14 | N | Active | Checkbox | TRUE or FALSE |
| 15 | O | Inactive | Checkbox | TRUE or FALSE |
| 16 | P | Steady | Checkbox | TRUE or FALSE |
| 17 | Q | Voice Tone | Dropdown text | May be empty |
| 18 | R | Notes | Text | May be empty |

---

## Step 3: Checkbox parsing and relationship labels

Google Sheets may return checkbox values as the literal string `"TRUE"`/`"FALSE"`, a boolean `true`/`false`, or occasionally `"1"`/`"0"`. Normalize before evaluating:

- Treat `"TRUE"`, `true`, and `"1"` as **set**.
- Treat everything else (`"FALSE"`, `false`, `"0"`, empty) as **not set**.

Map columns K through P to labels when set:

| Column | Label |
|--------|-------|
| K | Long Term VIP |
| L | Friend |
| M | New Client |
| N | Active |
| O | Inactive |
| P | Steady |

Collect every set label for a client, in the column order above (K → P), and join with ` · `.

**If all six are FALSE for a client, omit the Relationship line entirely** from that client's output block. Do not print an empty Relationship line.

---

## Step 4: Output format

### File header (always include, verbatim, at the top of the file):

```markdown
# LWS Client Context
*Source: LWS Migration Tracker → clients-md tab*
*Upload this file to the Writing & Content project to replace the previous version.*
*Gives Claude writing/tone context for all active LWS hosted clients.*

---
```

### Per-client block:

```markdown
## [Client Name]
**Contact:** [First Name] · [email]
**Industry:** [Industry] | **Region:** [Region chain] | **National:** [Y/N]
**Relationship:** [Label1 · Label2 · ...]
**Voice Tone:** [value]
**Notes:** [value]

---
```

### Display rules (apply per client, in this order):

1. **Client Name (`##` heading):** Always shown, taken from Column A.
2. **Contact line:** Always show the first name (Column C). If email (Column D) is filled, append ` · [email]`. If phone (Column E) is also filled, append another ` · [phone]` after the email. If there is no first name at all, show `**Contact:** —`.
3. **Industry line:**
   - Always show Industry from Column F.
   - Region: join Columns G, H, I with ` · `, skipping any that are empty.
   - If National (Column J) = `Y`, append ` (National)` immediately after the region chain.
   - If G, H, and I are all empty AND National = `N`, show `Region: —`.
4. **Relationship line:** Only include this line if at least one of K-P is set (per Step 3). Omit the line entirely if all six are FALSE. Do not show an empty or placeholder Relationship line.
5. **Voice Tone line:** Only include if Column Q is non-empty. Omit the line entirely if blank.
6. **Notes line:** Only include if Column R is non-empty. Omit the line entirely if blank.
7. **Separator:** A `---` line follows every client block, including the very last client in the file. No trailing content after the final `---`.

**General rule: never print a field label with an empty or placeholder value.** If a line has nothing to show, the whole line is omitted, not shown as blank or with an em-dash placeholder (the only exception is the Region field, which explicitly uses `—` per rule 3, and the Contact field with no name at all).

---

## Step 5: Worked example

Input (3 sample rows):

| Name | First | Email | Phone | Industry | Reg1 | Reg2 | Reg3 | Natl | VIP | Friend | New | Active | Inactive | Steady | Voice | Notes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| B-Line Counseling | Jose | jmbarr812@gmail.com | | Counseling/Therapy | North Jersey | | | N | TRUE | | | TRUE | | | Warm/Casual | |
| Energy Services NA | Al | al@oem-online.com | | Energy Services | | | | Y | | | | TRUE | | | | |
| Jon Wolf NJ | Jon | jonwolf@livewebstudios.com | | Personal/Music | North Jersey | Saddle Brook | | Y | | | | TRUE | | | | |

Output:

```markdown
## B-Line Counseling
**Contact:** Jose · jmbarr812@gmail.com
**Industry:** Counseling/Therapy | **Region:** North Jersey | **National:** N
**Relationship:** Long Term VIP · Active
**Voice Tone:** Warm/Casual

---

## Energy Services NA
**Contact:** Al · al@oem-online.com
**Industry:** Energy Services | **Region:** — | **National:** Y (National)
**Relationship:** Active

---

## Jon Wolf NJ
**Contact:** Jon · jonwolf@livewebstudios.com
**Industry:** Personal/Music | **Region:** North Jersey · Saddle Brook | **National:** Y (National)
**Relationship:** Active

---
```

Note what got omitted: no Voice Tone or Notes line for Energy Services NA or Jon Wolf NJ, since those cells were empty. Only lines with real content ever print.

---

## Step 6: File delivery

Filename is always `clients.md`. Not `clients_YYMMDD.md`, not `clients-updated.md`. The Writing & Content project expects a consistent filename to replace the old upload. Delivery mechanics depend on the environment detected in Step 0.

### Step 6a: Sandbox Mode (claude.ai chat or Cowork)

1. Write the full formatted content (header + all client blocks) to `/mnt/user-data/outputs/clients.md`.
2. Present the file to Jon using the file-presentation tool so it's downloadable.
3. Per Jon's standing preference, downloaded files land on the desktop of whatever machine he's using, not the downloads folder. No special handling needed here beyond producing a clean, correctly named file, the platform handles placement.

### Step 6b: Local Machine Mode (Claude Code on Jon's Mac or Windows)

Write the file directly to the Desktop of whichever machine was detected in Step 0. Overwrite any existing `clients.md` already there, that's expected since this is a refresh, not a new file.

- **Mac:** `~/Desktop/clients.md` (user `jonwolf` on `GoldieAir`)
- **Windows:** `%USERPROFILE%\Desktop\clients.md`, resolving to `C:\Users\drfre\Desktop\clients.md`

There is no file-presentation tool in Claude Code. Write directly with the available file-write tool, then confirm the exact path in the final message (Step 7).

---

## Step 7: Run confirmation

After delivering the file, close with a single line. Match it to the mode used:

- **Sandbox Mode:** "Upload this to Writing & Content project to replace the existing `clients.md`."
- **Local Machine Mode:** "Saved to [full path from Step 6b]. Upload this to Writing & Content project to replace the existing `clients.md`."

No other commentary needed. This is a mechanical read-and-format task. Skip a summary of what changed unless Jon asks for one.

---

## Edge cases

1. **Checkbox format drift.** The Drive tool may return checkboxes as strings, booleans, or `1`/`0`. Always normalize per Step 3 before evaluating. Never assume a single consistent format.
2. **Voice Tone dropdown not yet filled.** Many clients won't have this set yet. Empty string means omit the line, not "not set" as literal text.
3. **Notes column with real content.** E.g. PT Energy Services will read something like "Related to Energy Services NA, owners are brothers or cousins." Reproduce as-is, don't rephrase.
4. **Jon's own properties in the sheet.** Jon Wolf NJ, Live Web Studios, and Live Web Photos are Jon's own sites, not client sites, but they live in the same sheet. Include them in `clients.md` like any other row. Do not filter them out.
5. **Growing row count.** Never hardcode a total. Read until Column A is blank, every time.
6. **Multiple region columns.** G, H, I. Join non-empty values with ` · `. All three empty and National = N means `Region: —`.
7. **National flag.** Column J is literal text `Y` or `N`, not a checkbox. Only `Y` triggers the ` (National)` suffix.
8. **Tab misidentification.** If the Drive tool returns multiple tabs, confirm you're parsing `clients-md` specifically, not another tab in the same spreadsheet, before extracting rows.
9. **No Google Drive connector in Claude Code.** If running in Local Machine Mode and the Drive read tool isn't configured, don't fabricate client data. Tell Jon the connector isn't available in this environment and that the sheet read needs to happen from claude.ai, or that he needs to set up the connector for Claude Code.
