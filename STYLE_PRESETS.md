# Report Style Presets

Ten curated visual presets for HTML reports. Each preset defines a complete color palette, typography system, and page aesthetic.

Use these as starting points during Phase 2 style discovery. Each can be customized further based on the user's content and preferences.

---

## 1. Corporate

**Best for:** Executive memos, board reports, internal strategy documents
**Formality:** High
**Scheme:** Light

```css
:root {
    --color-page-bg:       #ffffff;
    --color-text:          #1a1a1a;
    --color-muted:         #6b7280;
    --color-accent:        #1e3a5f;
    --color-accent-light:  #eef2f6;
    --color-rule:          #d1d5db;
    --color-cover-bg:      #1e3a5f;
    --color-cover-text:    #ffffff;
    --color-callout-bg:    #f9fafb;
    --color-code-bg:       #f3f4f6;
    --color-screen-bg:     #f3f4f6;

    --font-display: 'Cabinet Grotesk', 'Inter', sans-serif;
    --font-heading: 'Cabinet Grotesk', 'Inter', sans-serif;
    --font-body:    'Satoshi', 'Inter', sans-serif;
    --font-mono:    'JetBrains Mono', monospace;
}
```

**Signature:** Navy cover, clean sans-serif throughout, thin rules, generous margins. Cover has a horizontal accent stripe at 1/3 height. Section headings use weight contrast (800/400) rather than color.

---

## 2. Editorial

**Best for:** Whitepapers, thought leadership, public reports
**Formality:** Medium
**Scheme:** Light

```css
:root {
    --color-page-bg:       #fefcf5;
    --color-text:          #1a1a18;
    --color-muted:         #6b6359;
    --color-accent:        #b91c1c;
    --color-accent-light:  #fef2f2;
    --color-rule:          #e5ddd0;
    --color-cover-bg:      #1a1a18;
    --color-cover-text:    #fefcf5;
    --color-callout-bg:    #f8f5ef;
    --color-code-bg:       #f3efe8;
    --color-screen-bg:     #f3efe8;

    --font-display: 'Playfair Display', Georgia, serif;
    --font-heading: 'Source Serif 4', Georgia, serif;
    --font-body:    'Source Serif 4', Georgia, serif;
    --font-mono:    'JetBrains Mono', monospace;
}
```

**Signature:** Warm paper background, serif body text, red accent. Cover is near-black with reversed white serif title. Drop caps on section openers. Wide left margin for marginal notes.

---

## 3. Minimal Financial

**Best for:** Investment memos, quarterly reports, financial summaries
**Formality:** High
**Scheme:** Light

```css
:root {
    --color-page-bg:       #ffffff;
    --color-text:          #111827;
    --color-muted:         #6b7280;
    --color-accent:        #059669;
    --color-accent-light:  #ecfdf5;
    --color-rule:          #e5e7eb;
    --color-cover-bg:      #ffffff;
    --color-cover-text:    #111827;
    --color-callout-bg:    #f9fafb;
    --color-code-bg:       #f3f4f6;
    --color-screen-bg:     #f3f4f6;

    --font-display: 'Inter', 'Helvetica Neue', sans-serif;
    --font-heading: 'Inter', 'Helvetica Neue', sans-serif;
    --font-body:    'Inter', 'Helvetica Neue', sans-serif;
    --font-mono:    'JetBrains Mono', monospace;
}
```

**Signature:** All-white, green accent. Numbers use tabular figures. Cover is minimal — centered title, thin emerald rule above meta. Heavy use of data tables and KPI callout boxes. No serif fonts anywhere. Tight tracking on headings.

---

## 4. Academic Paper

**Best for:** Research papers, conference proceedings, journals
**Formality:** High
**Scheme:** Light

```css
:root {
    --color-page-bg:       #ffffff;
    --color-text:          #000000;
    --color-muted:         #555555;
    --color-accent:        #2563eb;
    --color-accent-light:  #eff6ff;
    --color-rule:          #cccccc;
    --color-cover-bg:      #ffffff;
    --color-cover-text:    #000000;
    --color-callout-bg:    #f8f9fa;
    --color-code-bg:       #f5f5f5;
    --color-screen-bg:     #f5f5f5;

    --font-display: 'STIX Two Text', Georgia, serif;
    --font-heading: 'STIX Two Text', Georgia, serif;
    --font-body:    'STIX Two Text', Georgia, serif;
    --font-mono:    'Fira Code', 'SF Mono', monospace;
}
```

**Signature:** Full black-on-white, serif throughout, blue citation link color. Cover is title block only (centered, no background color). Two-column layout for body. Numbered sections (1., 1.1, 1.1.1). Bibliography section at end. Figure/table captions.

---

## 5. Brand White

**Best for:** Client proposals, pitch decks, external communications
**Formality:** Medium
**Scheme:** Light

```css
:root {
    --color-page-bg:       #ffffff;
    --color-text:          #1a1a2e;
    --color-muted:         #7c7c8a;
    --color-accent:        #6366f1;
    --color-accent-light:  #eef2ff;
    --color-rule:          #e2e4ea;
    --color-cover-bg:      #ffffff;
    --color-cover-text:    #1a1a2e;
    --color-callout-bg:    #f8f8ff;
    --color-code-bg:       #f4f4f8;
    --color-screen-bg:     #f4f4f8;

    --font-display: 'Satoshi', 'Inter', sans-serif;
    --font-heading: 'Satoshi', 'Inter', sans-serif;
    --font-body:    'Source Serif 4', Georgia, serif;
    --font-mono:    'JetBrains Mono', monospace;
}
```

**Signature:** Clean white with indigo accent. Cover uses a large outline/title with an accent-colored decorative element (large numeral, geometric shape, or branded icon). Body is serif for readability, headings are sans-serif. Designed to be customized with a client's brand color.

---

## 6. Swiss Grid

**Best for:** Data-heavy reports, consulting deliverables, analytics
**Formality:** Medium
**Scheme:** Light

```css
:root {
    --color-page-bg:       #ffffff;
    --color-text:          #0a0a0a;
    --color-muted:         #71717a;
    --color-accent:        #dc2626;
    --color-accent-light:  #fef2f2;
    --color-rule:          #d4d4d8;
    --color-cover-bg:      #0a0a0a;
    --color-cover-text:    #ffffff;
    --color-callout-bg:    #fafafa;
    --color-code-bg:       #f5f5f5;
    --color-screen-bg:     #f5f5f5;

    --font-display: 'Helvetica Now Display', 'Inter', sans-serif;
    --font-heading: 'Helvetica Now Display', 'Inter', sans-serif;
    --font-body:    'Helvetica Now Text', 'Inter', sans-serif;
    --font-mono:    'JetBrains Mono', 'SF Mono', monospace;
}
```

**Signature:** Swiss/International Typographic Style. Cover is black with reversed white title, left-aligned, with a thin red rule. Content uses strict grid layouts — modular, structured, precise. Red accent sparingly. Tabular data is a primary design element. No decorative flourishes.

---

## 7. Vintage Report

**Best for:** Historical analysis, archival documents, heritage brand reports
**Formality:** Medium
**Scheme:** Warm

```css
:root {
    --color-page-bg:       #f5efe0;
    --color-text:          #2d2416;
    --color-muted:         #7a6b55;
    --color-accent:        #8b4513;
    --color-accent-light:  #f5eee6;
    --color-rule:          #c4b59a;
    --color-cover-bg:      #2d2416;
    --color-cover-text:    #f5efe0;
    --color-callout-bg:    #ede5d3;
    --color-code-bg:       #e8dfcc;
    --color-screen-bg:     #e8dfcc;

    --font-display: 'Playfair Display', Georgia, serif;
    --font-heading: 'Playfair Display', Georgia, serif;
    --font-body:    'STIX Two Text', Georgia, serif;
    --font-mono:    'IBM Plex Mono', monospace;
}
```

**Signature:** Aged paper background (cream/beige), warm brown ink, saddle-brown accent. Cover uses a decorative border pattern (CSS-generated filigree or double rules). Section headings use small caps. Ornamental page number treatment. Feels archival.

---

## 8. Dark Dashboard

**Best for:** Technical reports, developer docs, internal engineering reports
**Formality:** Low
**Scheme:** Dark

```css
:root {
    --color-page-bg:       #0f1117;
    --color-text:          #e4e4e7;
    --color-muted:         #a1a1aa;
    --color-accent:        #22d3ee;
    --color-accent-light:  #0c1929;
    --color-rule:          #27272a;
    --color-cover-bg:      #0f1117;
    --color-cover-text:    #e4e4e7;
    --color-callout-bg:    #18181b;
    --color-code-bg:       #18181b;
    --color-screen-bg:     #09090b;

    --font-display: 'Satoshi', 'Inter', sans-serif;
    --font-heading: 'Satoshi', 'Inter', sans-serif;
    --font-body:    'Satoshi', 'Inter', sans-serif;
    --font-mono:    'JetBrains Mono', 'SF Mono', monospace;
}
```

**Signature:** Dark background, cyan accent. Cover has a subtle grid pattern (CSS gradient) and cyan accent line. Tables use dark header rows. Code blocks are natural. Accent-colored links. Good for technical audiences who spend time in dark-mode IDEs.

---

## 9. Magazine Spread

**Best for:** Annual reports, brand publications, impact reports
**Formality:** Low-Medium
**Scheme:** Bold

```css
:root {
    --color-page-bg:       #fafaf9;
    --color-text:          #1c1917;
    --color-muted:         #78716c;
    --color-accent:        #d97706;
    --color-accent-light:  #fffbeb;
    --color-rule:          #d6d3d1;
    --color-cover-bg:      #1c1917;
    --color-cover-text:    #fafaf9;
    --color-callout-bg:    #f5f5f4;
    --color-code-bg:       #efedea;
    --color-screen-bg:     #efedea;

    --font-display: 'Panchang', 'Syne', sans-serif;
    --font-heading: 'Syne', 'Inter', sans-serif;
    --font-body:    'Instrument Serif', Georgia, serif;
    --font-mono:    'JetBrains Mono', monospace;
}
```

**Signature:** Bold, confident — like a premium brand magazine. Amber accent. Cover is dark with oversized display type (96pt+). Body uses a comfortable serif. Pull quotes are large and centered. Section openers use full-page imagery or bold color blocks. Page numbers are oversized design elements.

---

## 10. Technical Docs

**Best for:** API documentation, SDK guides, technical specifications
**Formality:** Low
**Scheme:** Light

```css
:root {
    --color-page-bg:       #ffffff;
    --color-text:          #0d1117;
    --color-muted:         #656d76;
    --color-accent:        #0969da;
    --color-accent-light:  #ddf4ff;
    --color-rule:          #d0d7de;
    --color-cover-bg:      #0d1117;
    --color-cover-text:    #ffffff;
    --color-callout-bg:    #f6f8fa;
    --color-code-bg:       #f6f8fa;
    --color-screen-bg:     #f6f8fa;

    --font-display: 'Inter', 'Helvetica Neue', sans-serif;
    --font-heading: 'Inter', 'Helvetica Neue', sans-serif;
    --font-body:    'Inter', 'Helvetica Neue', sans-serif;
    --font-mono:    'JetBrains Mono', 'SF Mono', monospace;
}
```

**Signature:** Clean, developer-friendly. Blue accent like GitHub. Cover is dark with white title. Code blocks are the hero — well-styled with line numbers. Tables for API parameters. Callout boxes for tips/warnings. Body is 1-column for readability. Minimal decoration.

---

## Usage

When the user picks a preset during Phase 2:

1. Read the preset's CSS variables and fonts
2. Generate 1 cover-page preview using that preset
3. In Phase 3, inject the full `:root` block from the chosen preset into the report HTML
4. Apply the preset's signature elements (cover style, decorative devices, page chrome)

For **custom wildcard** previews (Phase 2), design a unique style that doesn't match any preset. Refer to the Design Aesthetics section in SKILL.md for guidance.
