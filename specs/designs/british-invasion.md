# BRITISH INVASION — design spec
## Location: ~/.claude/specs/designs/british-invasion.md
## Source: https://britishinvasionyears.netlify.app/ (canonical: britishinvasionyears.com) — pulled live 26_07_02
## Client: The British Invasion Years. Jon's own band (keys/guitar). Booking: Blue Raven
## Entertainment / Rachel Hill. Applies to: band and musician-vertical sites (Live Band Web
## Studios family), and as the reference template for tribute/performance act builds generally.

---

## Concept

"Both Sides of the Atlantic." The show's own structure is the site's content structure: opens
British (Beatles, Stones, Who, Kinks), America answers (Monkees, Beach Boys, Turtles, Mamas &
Papas), closes with a full Beatles finale. Theatrical, high-energy, not a generic "tribute band"
template. Real stagecraft language throughout, matches Mode E (musician) from
`jon_voice_master.md` almost exactly, this client site reads like Jon wrote it himself, because
he's in the band.

## Visual direction

- Full-bleed photo hero, rotating stage shots, not a single static image. Purple stage lighting
  recurs across multiple photos (`carnaby-st-stage-wide-purple.jpg`), a mod/60s Carnaby Street
  visual thread worth treating as the palette anchor even without exact hex extracted yet.
- Exact hex values not yet pulled from live CSS: `<!-- COLOR: extract real palette from
  britishinvasionyears.com computed styles before reuse -->`
- Dual-logo lockup in the header: a guitar-pick icon mark plus a full wordmark, stacked.
- Italic accent styling on key words mid-headline ("The Americans that *fired back*," "More Than
  Just *The Beatles*," "Watch *Us Live*") — a consistent typographic tic worth reusing anywhere
  this client's voice needs punch on a single word inside a headline.

## Structure (confirmed from live page)

1. Hero: photo carousel + headline built on the British-vs-American framing + dual CTA ("Tour
   Dates" / "Watch the Show").
2. Upcoming Shows teaser, links out to a full tour page. Standard for any touring-act client.
3. "The Story" block, two sub-sections: "The Show" (concept/setlist framing) and "The Band"
   (member bios woven into narrative prose, not a bulleted roster). Real member quote embedded
   mid-paragraph, not pulled into a separate testimonial block.
4. Social proof line naming acts they've shared a stage with (Ringo Starr, Eric Clapton, Herman's
   Hermits, etc.) — this is the EPK "lead with the draw" rule from `jon_voice_master.md` Mode E,
   applied directly on the homepage instead of being reserved for a separate press kit page.
5. Video section, single embedded promo clip.
6. Photo gallery grid, on-stage shots.
7. Email capture: "Find Out First," one line of copy, no hard sell ("One email a month. That's
   it.").
8. Footer: booking/management block with named contact and phone, licensed agency line (Blue
   Raven Entertainment, License #). Bands need this booker-facing contact block; most other LWS
   client verticals don't.

## Voice

Full Mode E from `jon_voice_master.md`. E2 (press/third-person, "The British Invasion Years"
throughout) for the main narrative, with E1-style first-person color inside member quotes only.
No fanboy language anywhere on the live site, consistent with the kill-list. Confident without
arrogant: "Every guy on this stage has played next to some of the biggest names in rock, and we
bring that to every room we walk into."

JSON-LD: `@type: MusicGroup` or `PerformingGroup`, not `LocalBusiness`, this is a touring act, add
`sameAs` for the socials already live in the footer.
