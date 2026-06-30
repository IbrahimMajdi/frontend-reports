# Frontend Reports

Frontend Reports is a reusable skill for creating polished, print-ready HTML reports from text or Markdown content. It is designed for executive memos, case studies, whitepapers, internal reports, and other long-form documents that need a clean, professional presentation.

## Features

- Generates single-file, zero-dependency HTML reports
- Uses a print-first layout optimized for A4 pages
- Includes a cover page, table of contents, and section-based page structure
- Supports multiple visual presets for different report styles
- Produces export-friendly output for PDF sharing and web deployment
- Works well for business, academic, technical, and editorial content

## Installation

1. Clone or copy this repository into your skills directory.
2. If you are using OpenCode, place the folder in your skills location so the skill can be discovered.
3. For PDF export and deployment, install Node.js.

Example:

```bash
git clone https://github.com/IbrahimMajdi/frontend-reports.git
cd frontend-reports
```

If you plan to export reports to PDF, the scripts will install Playwright automatically on first use.

## Usage

Use the skill by describing the report you want to create. The workflow typically includes:

1. Choosing the report type and audience
2. Providing the content or rough notes
3. Selecting a visual style preset
4. Generating the report as a self-contained HTML file

Example prompt:

```text
Create a professional report for a client proposal with 6 sections, a strong cover page, and a clean executive style.
```

Once the report is generated, you can review it in a browser and export it for sharing.

## Skill Architecture

The repository is organized around a simple report-generation workflow:

- `SKILL.md` defines the skill instructions, generation phases, and behavior
- `report-template.md` provides the HTML structure for the report
- `report-base.css` contains the shared A4 layout and print styling
- `STYLE_PRESETS.md` includes curated visual themes and color palettes
- `scripts/` contains helpers for exporting to PDF and deploying to Vercel

This structure keeps the report logic, visual design, and sharing tools separated so the output remains consistent and easy to customize.

## Sharing Your Report

You can share your report in two main ways:

### Export to PDF

```bash
bash scripts/export-pdf.sh ./report.html
```

This creates a print-ready PDF using a headless browser.

### Deploy to a Live URL

```bash
bash scripts/deploy.sh ./report.html
```

This deploys the report to Vercel so it can be shared as a public web page.

## Notes

The generated reports are designed to be static, self-contained, and easy to print. They are best suited for documents that need a polished, editorial-quality presentation without relying on frameworks or build tools.
