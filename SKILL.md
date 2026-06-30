---
name: frontend-reports
description: Create professional, print-ready HTML reports from text or Markdown content. Use when the user wants to build a report, memo, whitepaper, case study, annual report, or any long-form document. Produces A4-optimized single-file HTML with zero dependencies, ready for PDF export.
---

# Frontend Reports

Create zero-dependency, print-first HTML reports that look great on screen and render beautifully in PDF. Single-file HTML with inline CSS, A4 page grid, and typography-first design.

## Core Principles

1. **Zero Dependencies** — Single HTML files with inline CSS. No npm, no build tools, no JavaScript needed.
2. **Print-First, Screen-Native** — Designed for A4 (210×297mm) as the primary canvas. Screen rendering is the preview; PDF is the delivery. Every report must print cleanly without JS.
3. **Typography-First** — Reports are read, not watched. Choose high-legibility fonts, proper measure (65-75ch), generous leading, and a clear heading hierarchy.
4. **Show, Don't Tell** — Generate visual style previews (cover pages) before building the full report. People discover their taste by seeing options.
5. **Distinctive Design** — No generic templates. Each report must feel custom-crafted for its content and purpose.
6. **Page Architecture** — Every report has: cover page, table of contents, section pages with running headers, and optional appendices. Page breaks land on natural boundaries.

## Design Aesthetics

You tend to converge toward generic, "on distribution" outputs. In frontend design, this creates what users call the "AI slop" aesthetic. Avoid this: make creative, distinctive frontends that surprise and delight and adapted for reading:

- **Typography**: Choose beautiful, distinctive fonts that suit long-form reading. Avoid Arial, Inter, system-ui. Consider: Instrument Serif, Newsreader, Literata for body; Satoshi, Cabinet Grotesk, Synch for headings. Set body at comfortable size (11-12pt for print, 16-18px for screen) with 1.5-1.7 leading. Keep body paragraphs left-aligned and ragged-right by default; only justify text when the brief or a specific component explicitly opts in.
- **Color & Palette**: Commit to a cohesive palette. Reports benefit from restrained color — a dominant neutral base, one accent for highlights/headings, and a secondary accent sparingly for callouts.
- **Space**: Generous margins (20-25mm for print), consistent vertical rhythm, breathing room around sections. White space signals quality.
- **Page Elements**: Running headers with section title, page numbers, hairline rules for section breaks. Cover page as a full-bleed typographic statement.
- **Tables & Data**: Clean, minimal table styling — hairline borders, subtle row shading, right-aligned numbers, left-aligned text. Use CSS `@media print` for optimal table breaks.
- **No Motion**: Reports are static. Animation has no place in a document meant for reading and printing.

**Avoid:**
- Overused fonts (Inter, Roboto, Arial, system-ui stacks)
- Purple-on-white color schemes
- Card-based dashboard layouts in a document context
- Excess shadows, gradients, or decorative flourishes that degrade print quality

Interpret creatively and make unexpected choices that feel genuinely designed for the context. Vary between light and dark themes, different fonts, different aesthetics. You still tend to converge on common choices (Space Grotesk, for example) across generations. Avoid this: it is critical that you think outside the box!

## Page Model

**The A4 canvas is the only supported format.** Every report uses this page grid:

- **Page size**: 210mm × 297mm (A4)
- **Margins**: 20mm top/bottom, 22mm left/right
- **Content width**: ~166mm (≈65-75ch at 11-12pt)
- **Baseline grid**: 6px (0.16rem) increments
- **Column grid**: Optional 2-column or 3-column layout inside content area
- **Shared horizontal inset**: header text, footer text, header/footer rule lines, and `.page-content` must use the same left/right page inset. Do not center a narrower `.col-1` column unless the header/footer are also moved to that same column edge.

The report renders as a continuous scroll on screen (each `.page` or `<section>` acts as a page break) and uses `@page` rules with `page-break-before` for print output.

**When generating, read `report-base.css` and include its full contents in every report.**

---

## Phase 0: Detect Mode

Determine what the user wants:

- **Mode A: New Report** — Create from scratch. Go to Phase 1.
- **Mode B: Enhancement** — Improve an existing HTML report. Read it, understand it, enhance. Follow modification rules below.

### Mode B: Modification Rules

1. **Before modifying:** Read the full report, count existing sections, check page overflow
2. **Adding sections:** Ensure natural page breaks. If a section spans more than 3 printed pages, consider sub-sections
3. **Adding tables/data:** Use the existing table style. If no table style exists, add minimal clean tables
4. **After ANY modification, verify:** the report still prints cleanly, no text overflows columns, no overlapping elements, page breaks are natural
5. **Proactively reorganize:** If content causes overflow or awkward page breaks, reorganize and inform the user
6. **Preserve page-grid alignment:** header, footer, divider lines, and content must share one left/right padding token on screen and in PDF export
7. **Protect PDF export:** dense pages must fit inside the fixed A4 box; tighten print-only spacing for headings, cards, charts, tables, callouts, and lists before allowing a page to spill to an extra PDF sheet
8. **Prevent PDF frames and yellow casts:** use `@page { size: A4; margin: 0; }`, force print `html`, `body`, and normal `.page` backgrounds to white, and let `.page` padding own all visible margins. Preserve a non-white cover only through an explicit `.cover-page` background.

---

## Phase 1: Content Discovery

**Ask ALL questions together** so the user fills everything out at once:

**Question 1 — Type** (header: "Report Type"):
What kind of report is this? Options: Executive memo / Annual report / Case study / Whitepaper / Research paper / Business proposal / Internal document

**Question 2 — Length** (header: "Length"):
Approximately how many pages? Options: Short 1-3 / Medium 4-10 / Long 10-20 / Extended 20+

**Question 3 — Content** (header: "Content"):
Do you have content ready? Options: All content ready (paste text/markdown) / Rough notes / Topic only

**Question 4 — Data** (header: "Data"):
Does the report include data tables, charts, or statistics? Options: Yes, tables and numbers / Yes, charts/graphs needed / Minimal data / No data

**Question 5 — Audience** (header: "Audience"):
Who is the primary audience? Options: Executive leadership / Clients / General public / Academic / Internal team

### Step 1.2: Content Ingestion

If the user has content ready, ask them to share it (Markdown preferred, plain text accepted). Parse the content into:
- Title, subtitle, author, date
- Section headings (H1/H2/H3 hierarchy)
- Body paragraphs
- Lists (bulleted, numbered)
- Tables
- Blockquotes / callouts
- Code blocks (if technical)
- Footnotes

Build a structured outline and confirm with the user before generating.

---

## Phase 2: Style Discovery

**Generate 3 Cover-Page Style Previews.** Each is a self-contained HTML file showing the cover page only — title, subtitle, author, date — styled in a distinct aesthetic direction. Based on report type, audience, and content, infer 3 fitting styles from the presets below.

Read [STYLE_PRESETS.md](STYLE_PRESETS.md) for preset definitions.

| Report Type / Audience | Suggested Presets |
| ---------------------- | ----------------- |
| Executive / Leadership | Corporate, Minimal Financial, Swiss Grid |
| Academic / Research    | Academic Paper, Editorial, Vintage Report |
| Client / Proposal      | Brand White, Corporate, Minimal Financial |
| Public / General       | Editorial, Magazine Spread, Brand White |
| Internal / Team        | Minimal, Swiss Grid, Technical Docs |
| Annual / Stakeholder   | Corporate, Brand White, Magazine Spread |

**Preview mix rules:**
- Generate 3 previews: 2 presets from the table above + 1 custom wildcard
- The wildcard should be a self-generated design that interprets the content's unique character
- For conservative reports (legal, financial), lean toward restrained, high-formality options
- For creative reports (brand, editorial), make one preview adventurous

**Preview authenticity rules:**
- Every preview must look like a real cover page from the user's report, not a diagnostic card
- Never render internal workflow labels: no `preview`, `style option`, `preset`, file names, or template names on the cover itself
- Use the user's actual title, subtitle, author, and date — no lorem ipsum
- Save previews to `.frontend-reports/cover-previews/` (style-a.html, style-b.html, style-c.html)
- Open each preview automatically for the user

### Step 2.1: User Picks

Ask (header: "Style"):
Which style do you prefer? Options: Style A: [Name] / Style B: [Name] / Style C: [Name] / Mix elements

---

## Phase 3: Generate Report

Generate the full report using content from Phase 1 and style from Phase 2.

**Before generating, read these supporting files:**
- [report-template.md](report-template.md) — HTML architecture reference
- [report-base.css](report-base.css) — Mandatory CSS (include in full)
- [STYLE_PRESETS.md](STYLE_PRESETS.md) — Chosen preset's CSS variables and fonts

### HTML Structure

Every report must follow this structure:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Report Title</title>
  <!-- Fonts from chosen preset -->
  <style>
    /* === FULL report-base.css contents here === */
    /* === Chosen preset CSS custom properties === */
    /* === Page-specific styles === */
  </style>
</head>
<body>
  <!-- Cover Page -->
  <section class="page cover-page">...</section>

  <!-- Table of Contents -->
  <section class="page toc-page">...</section>

  <!-- Content Sections -->
  <section class="page section-page" data-section="1">
    <header class="page-header">...</header>
    <div class="page-content">
      <!-- Typographic grid here -->
    </div>
    <footer class="page-footer">...</footer>
  </section>

  <!-- Appendices (optional) -->
  ...
</body>
</html>
```

### Components Reference

Each report uses these standard components:

**Cover Page** — Full-page typographic statement:
- Report title (large display size)
- Subtitle or tagline
- Author, date, organization
- Optional: abstract/blurb below
- Decorative elements per preset (rule, accent shape, watermark)

**Table of Contents** — Auto-generated from heading structure:
- Section numbers with titles
- Optional: subsection indentation
- Hairline rules between items

**Section Page** — Standard content page:
- Running header: section number + title (top)
- Page number (bottom, outer edge)
- Content columns (1, 2, or 3 columns)
- Section opener: larger heading, decorative rule

**Content Blocks**:
- Body text: 65-75ch measure, 1.5-1.7 line-height
- Pull quotes: larger italic text, left-rules or centered
- Callout boxes: subtle background, border-left accent
- Tables: clean grid, header row, alternating stripes (print-friendly)
- Lists: proper hanging indent
- Code blocks: monospace, subtle background (light grey, not dark)
- Footnotes: superscript in text, numbered list at page bottom

### Generation Rules

1. Single self-contained HTML file, all CSS inline
2. Include the FULL contents of `report-base.css` in the `<style>` block
3. Use `@page { size: A4; margin: 0; }`; do not add browser/PDF margins on top of the report page padding
4. Each `<section class="page">` gets `page-break-before: always` for print
5. Use CSS `:root` variables for the chosen preset's palette and fonts
6. Body text at 11-12pt (print) / 16-18px (screen)
7. Proper heading hierarchy: h1 → h2 → h3, each with consistent sizing
8. No JavaScript required. If using JS for convenience features, ensure graceful degradation
9. Every `<img>` must have `alt` text
10. Use one shared left/right inset for `.page`, `.page-header`, `.page-footer`, header/footer rule lines, and `.page-content`
11. Validate no text overflows page boundaries at A4 dimensions
12. Export or render-check the PDF when page density changes; the physical PDF page count must match the intended `.page` count unless the report deliberately uses flowing multi-page sections
13. Check PDF appearance: normal pages must export white, with no warm page tint and no large outer white frame around the A4 canvas

---

## Phase 4: Delivery

1. **Clean up** — Delete `.frontend-reports/cover-previews/` if it exists
2. **Open** — Use `start [filename].html` to launch in browser
3. **Summarize** — Tell the user:
   - File location, preset name, estimated print page count
   - How to print: Ctrl+P (Cmd+P) → Save as PDF — page breaks are pre-set
   - How to customize: `:root` CSS variables for colors, font link for typography
   - Text editing: edit the HTML directly, or paste new content for regeneration
   - Offer revisions: adjust style, reorder sections, add/remove content

---

## Phase 5: Share & Export (Optional)

After delivery, **ask the user:** _"Would you like to share this report? I can export it as a print-ready PDF or deploy it to a live URL."_

Options:
- **Export to PDF** — Print-quality A4 PDF via headless Chrome
- **Deploy to URL** — Shareable web link
- **Both**
- **No thanks**

### 5A: Export to PDF

Run the export script:
```bash
bash scripts/export-pdf.sh <path-to-html> [output.pdf]
```

The script uses headless Chrome to render each page at 300 DPI PDF. If no output path is given, saves next to the HTML file.

### 5B: Deploy to a Live URL

Deploy the report to Vercel for sharing as a web page:
```bash
bash scripts/deploy.sh <path-to-html>
```

---

## Supporting Files

| File | Purpose | When to Read |
| ---- | ------- | ------------ |
| [report-base.css](report-base.css) | Mandatory A4 page grid and layout CSS | Phase 3 (generation) |
| [report-template.md](report-template.md) | HTML architecture and component reference | Phase 3 (generation) |
| [STYLE_PRESETS.md](STYLE_PRESETS.md) | 10 curated visual presets with colors, fonts, and page aesthetics | Phase 2 (style selection) and Phase 3 (generation) |
| [scripts/export-pdf.sh](scripts/export-pdf.sh) | Export report to A4 PDF (macOS/Linux — requires Node.js 18+) | Phase 5 (export) |
| [scripts/export-pdf.ps1](scripts/export-pdf.ps1) | Export report to A4 PDF (Windows — requires Node.js 16+) | Phase 5 (export) |
| [scripts/deploy.sh](scripts/deploy.sh) | Deploy report to Vercel | Phase 5 (deploy) |
