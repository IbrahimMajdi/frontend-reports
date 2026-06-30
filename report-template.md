# Report HTML Template

Reference architecture for generating print-first HTML reports. Every report follows an A4 page model: sections render as discrete pages on screen and use CSS `@page` + `page-break` rules for clean PDF output.

## Base HTML Structure

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Title — Subtitle</title>

    <!-- Fonts: from chosen preset (Google Fonts or Fontshare) -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=...">

    <style>
        /* =============================================
           CSS CUSTOM PROPERTIES (THEME)
           Change these to change the whole look
           ============================================= */
        :root {
            /* --- Colors --- */
            --color-page-bg:       #ffffff;
            --color-text:          #1a1a1a;
            --color-muted:         #666666;
            --color-accent:        #1a3a7a;
            --color-accent-light:  #e8edf5;
            --color-rule:          #dddddd;
            --color-cover-bg:      #1a3a7a;
            --color-cover-text:    #ffffff;
            --color-callout-bg:    #f8f8f8;
            --color-code-bg:       #f5f5f0;
            --color-table-header-bg: #f0f0ee;
            --color-table-stripe:  rgba(0,0,0,0.02);
            --color-table-hover:   rgba(0,0,0,0.04);
            --color-screen-bg:     #f5f5f0;

            /* --- Typography --- */
            --font-display: 'Playfair Display', Georgia, serif;
            --font-heading: 'Inter', 'Helvetica Neue', sans-serif;
            --font-body:    'Source Serif 4', Georgia, serif;
            --font-mono:    'JetBrains Mono', 'SF Mono', monospace;

            /* --- Sizes (print: pt, screen: px) --- */
            --cover-title-size: 48pt;   /* 64px on screen */
            --h1-size:          24pt;   /* 32px */
            --h2-size:          18pt;   /* 24px */
            --h3-size:          14pt;   /* 19px */
            --h4-size:          12pt;   /* 16px */
            --body-size:        11pt;   /* 16px */
            --subtitle-size:    14pt;   /* 19px */
            --small-size:       9pt;    /* 13px */
            --body-leading:     1.6;

            /* --- Layout --- */
            --measure: 68ch;
            --page-margin-top: 20mm;
            --page-margin-bottom: 20mm;
            --page-margin-inner: 22mm;
            --page-margin-outer: 22mm;
            --page-x: var(--page-margin-inner);
            --page-y: var(--page-margin-top);
        }

        /* =============================================
           FULL report-base.css CONTENTS HERE
           ============================================= */
        /* (insert the entire report-base.css) */

        /* =============================================
           PRESET-SPECIFIC OVERRIDES
           ============================================= */
        /* (chosen preset's additional styles) */
    </style>
</head>
<body>

    <!-- ============================================
         COVER PAGE
         ============================================ -->
    <section class="page cover-page">
        <div class="cover-label">Report</div>
        <h1 class="cover-title">The State of the Industry 2025</h1>
        <p class="cover-subtitle">A comprehensive analysis of market trends, competitive landscape, and strategic opportunities shaping the year ahead.</p>
        <div class="cover-meta">
            <span>Prepared by: Strategy Team</span>
            <span>Date: January 2025</span>
            <span>Classification: Internal — Confidential</span>
        </div>
    </section>

    <!-- ============================================
         TABLE OF CONTENTS
         ============================================ -->
    <section class="page toc-page">
        <h2 class="toc-title">Contents</h2>
        <ol class="toc-list">
            <li>
                <span class="toc-num">01</span>
                <span class="toc-label">Executive Summary</span>
                <span class="toc-leader">···································</span>
                <span class="toc-page-ref">3</span>
            </li>
            <li>
                <span class="toc-num">02</span>
                <span class="toc-label">Market Overview</span>
                <span class="toc-leader">···································</span>
                <span class="toc-page-ref">5</span>
            </li>
            <!-- ... -->
        </ol>
    </section>

    <!-- ============================================
         SECTION PAGE
         ============================================ -->
    <section class="page section-page" data-section="1">
        <header class="page-header">
            <span class="section-title">01 · Executive Summary</span>
            <span class="section-meta">Confidential</span>
        </header>

        <div class="page-content col-1">
            <p class="section-number">Section 01</p>
            <h1 class="section-heading">Executive Summary</h1>
            <hr class="section-rule" aria-hidden="true">

            <p class="lead">The industry is undergoing its most significant transformation in a decade. This report examines the key drivers, challenges, and opportunities that will define the competitive landscape through 2026.</p>

            <p>The past twelve months have seen unprecedented shifts in consumer behavior, regulatory frameworks, and technological capability. Organizations that adapt quickly to these changes are positioning themselves for outsized growth, while those that maintain the status quo risk irrelevance.</p>

            <h2>Key Findings</h2>

            <p>Our analysis reveals three primary forces reshaping the industry:</p>

            <ol>
                <li><strong>Digital acceleration</strong> — Adoption of AI-driven tools has increased 340% year-over-year, fundamentally changing how organizations operate and compete.</li>
                <li><strong>Regulatory evolution</strong> — New compliance requirements across major markets are creating both challenges and opportunities for market participants.</li>
                <li><strong>Shifting consumer expectations</strong> — Modern consumers demand personalization, transparency, and speed — and they will switch providers to get them.</li>
            </ol>

            <blockquote>The organizations that will thrive are those that treat transformation not as a project, but as a permanent operating philosophy. The window for action is closing.</blockquote>

            <!-- Table example -->
            <h2>Performance Overview</h2>
            <table>
                <thead>
                    <tr>
                        <th>Metric</th>
                        <th>2024</th>
                        <th>2025 (est.)</th>
                        <th>Change</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Market Size ($B)</td>
                        <td>142.3</td>
                        <td>168.7</td>
                        <td>+18.6%</td>
                    </tr>
                    <tr>
                        <td>Active Users (M)</td>
                        <td>84.2</td>
                        <td>102.1</td>
                        <td>+21.3%</td>
                    </tr>
                    <tr>
                        <td>Avg. Revenue/User ($)</td>
                        <td>1,690</td>
                        <td>1,652</td>
                        <td>−2.3%</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <footer class="page-footer">
            <span class="page-num">3</span>
        </footer>
    </section>

    <!-- ============================================
         APPENDIX PAGE (if needed)
         ============================================ -->
    <section class="page section-page" data-section="appendix-a">
        <header class="page-header">
            <span class="section-title">Appendix A · Methodology</span>
        </header>

        <div class="page-content col-1">
            <p class="section-number">Appendix A</p>
            <h1 class="section-heading">Research Methodology</h1>
            <hr class="section-rule" aria-hidden="true">

            <p>This report draws on data from the following sources:</p>

            <ul>
                <li>Primary research: 200+ executive interviews conducted Q3–Q4 2024</li>
                <li>Secondary research: Industry analyst reports, regulatory filings, and market data</li>
                <li>Proprietary data: Internal analytics and customer feedback across 15 markets</li>
            </ul>

            <p>All financial data is reported in USD unless otherwise noted. Market size estimates use a bottom-up methodology based on revenue reported by publicly traded companies in the sector, supplemented by private company estimates from industry sources.</p>

            <div class="callout callout-info">
                <strong>Note on Estimates:</strong> Projections for 2025–2026 use a consensus forecast drawn from 12 leading industry analysts. Ranges reflect a 95% confidence interval.
            </div>
        </div>

        <footer class="page-footer">
            <span class="page-num">12</span>
        </footer>
    </section>

</body>
</html>
```

## Page Components

### Cover Page
- Full-bleed background (color, image, or pattern)
- Label badge (small uppercase text: "Report", "Whitepaper", etc.)
- Large title (48-64pt display font)
- Subtitle line
- Meta block (author, date, classification) at bottom
- Optional: abstract paragraph above meta

### Table of Contents
- "Contents" heading in heading font
- Numbered entries with leader dots and page references
- Optional: indented sub-entries for sections with subsections
- Generated from the H1/H2 structure of the report

### Section Page
- Running header: section number + title (top of page)
- Section number label
- Section heading (H1 equivalent)
- Decorative rule under heading
- Content in 1/2/3 column grid
- Page number in footer

### Content Components
| Component | HTML | Notes |
|-----------|------|-------|
| Body paragraph | `<p>` | 65-75ch measure, left-aligned ragged-right by default; use `.text-justify` only as an explicit opt-in |
| Heading 2 | `<h2>` | Section sub-heading |
| Heading 3 | `<h3>` | Sub-section |
| Heading 4 | `<h4>` | Sub-sub-section (italic) |
| Bullet list | `<ul><li>` | Hanging indent |
| Numbered list | `<ol><li>` | Hanging indent |
| Table | `<table> <thead> <tbody>` | Clean grid, striped |
| Blockquote | `<blockquote>` | Left-accent border |
| Callout | `<div class="callout">` | Warning/info variants |
| Code block | `<pre><code>` | Monospace, light bg |
| Figure | `<figure><img><figcaption>` | Centered, caption |
| Footnote ref | `<sup><a class="fn-ref">` | Linked superscript |
| Footnotes | `<div class="footnotes"><ol>` | Page-bottom list |

## Multi-Column Layout

Use `col-1`, `col-2`, or `col-3` class on `.page-content`:

```html
<div class="page-content col-2">
    <!-- Content flows into 2 columns -->
</div>
```

For mixed layout within a page, use grid or flex to create distinct zones:

```html
<div class="page-content">
    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 8mm;">
        <div><!-- Left column content --></div>
        <div><!-- Right column content --></div>
    </div>
</div>
```

## Cover Page Variations

### Minimal (white background, centered)
```html
<section class="page cover-page" style="text-align: center; align-items: center;">
```

### Dark (inverted colors)
```html
<section class="page cover-page" style="background: #0a0a0a; color: #fff;">
```

### Split (two-tone)
```html
<section class="page cover-page" style="background: linear-gradient(135deg, var(--color-accent) 0%, var(--color-accent) 40%, var(--color-page-bg) 40%, var(--color-page-bg) 100%);">
```

## Print Considerations

Every report must:

1. Include `@page { size: A4; margin: 0 }` in CSS; `.page` padding owns the visible report margins
2. Use `page-break-before: always` on every `.page` section
3. Set `page-break-inside: avoid` on tables, figures, and callouts
4. Use `orphans: 3; widows: 3` to prevent orphan lines
5. Avoid background colors that waste printer ink (use light tints)
6. Ensure all font sizes are legible at print resolution (min 9pt)
7. Use `break-inside: avoid` instead of `page-break-inside: avoid` for modern browsers, but include both for compatibility
8. Keep header text, footer text, header/footer rule lines, and `.page-content` on the same left/right inset (`--page-x`)
9. For dense pages, add print-only compression before export: reduce heading margins, table cell padding, card/chart gaps, callout margins, and lead text line-height rather than letting a fixed A4 page spill
10. Verify PDF output page count matches the intended `.page` count unless the report intentionally uses flowing multi-page sections
11. Do not justify body paragraphs by default; keep normal reading copy left-aligned and ragged-right unless the brief explicitly requires justified text
12. Force normal print/PDF sheets to white (`html`, `body`, and `.page`) so warm screen paper tints do not export as yellow pages; preserve non-white covers only with an explicit `.cover-page` background
13. Do not add browser/export PDF margins on top of the CSS page padding; this creates a large white frame around every page

## Key Requirements

- Single self-contained HTML file, all CSS/JS inline
- Include the FULL contents of `report-base.css` in the `<style>` block
- Use fonts from Google Fonts or Fontshare — never system fonts
- Every section needs a clear `/* === SECTION NAME === */` comment block
- No JavaScript required (reports are static documents)
- When JavaScript is present, it must degrade gracefully with no visual impact when disabled
- Validate readability: body text at 11pt/16px minimum, line-length at 65-75ch
