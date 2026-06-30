# Frontend Reports ✨

Frontend Reports is a lightweight skill for turning plain text or Markdown into polished, print-ready HTML reports. It is designed for executive memos, case studies, whitepapers, internal documents, and other long-form content that benefits from a refined, publication-quality presentation.

Inspired by [frontend-slides](https://github.com/zarazhangrui/frontend-slides), this project brings a similarly elegant, design-forward approach to reports and documents.

## 🚀 Features

- Generates self-contained, zero-dependency HTML reports
- Uses a print-first layout tuned for A4 output
- Includes a cover page, table of contents, and section-based structure
- Offers multiple visual presets for different report styles
- Supports PDF export and live web sharing
- Fits business, academic, technical, and editorial use cases

## 📦 Installation

This repository can be used as a reusable report-generation skill by local coding agents and CLI-based assistants such as OpenCode, Codex, Kimi Code, Gemini CLI, and similar tools.

### Recommended setup

1. Clone the repository to your local machine.
2. Make sure the folder is available to the agent in the same workspace or skills directory it uses for local tools.
3. Install Node.js if you want to use the PDF export or deployment scripts.
4. Review the core files before generating a report:
   - `SKILL.md` for the instructions and workflow
   - `report-template.md` for the HTML structure
   - `report-base.css` for shared styling and page layout
   - `STYLE_PRESETS.md` for available visual presets

```bash
git clone https://github.com/IbrahimMajdi/frontend-reports.git
cd frontend-reports
```

### Notes for agents

The simplest workflow is to give the agent the GitHub repository link and ask it to use the Frontend Reports skill to generate or refine a report. For PDF export, the script will install Playwright automatically on first use. For live sharing, the deployment script uses Vercel and requires an account if you want to publish the report online.

## 🛠️ Usage

Describe the report you want to create, and the skill will guide the generation flow:

1. Choose the report type and audience
2. Provide content or rough notes
3. Select a visual preset
4. Generate a self-contained HTML report

Example:

```text
Create a polished client proposal with six sections, a strong cover page, and a clean executive tone.
```

You can then review the output in a browser and share it as PDF or a live URL.

## 🧱 Skill Architecture

The repository is organized around a simple, modular workflow:

- `SKILL.md` defines the skill instructions and generation phases
- `report-template.md` provides the HTML structure for each report
- `report-base.css` contains the shared A4 layout and print styling
- `STYLE_PRESETS.md` includes curated visual themes and color palettes
- `scripts/` provides helpers for PDF export and Vercel deployment

This separation keeps content, layout, styling, and sharing logic easy to maintain and customize.

## 🌐 Share Your Report

You can publish your report in two simple ways:

### Export to PDF

```bash
bash scripts/export-pdf.sh ./report.html
```

This creates a print-ready PDF using a headless browser.

### Deploy to a Live URL

```bash
bash scripts/deploy.sh ./report.html
```

This publishes the report to Vercel so it can be shared instantly.

## 🔮 Future Updates

Planned improvements include:

- More report presets and visual themes
- Better automated layout tuning for longer documents
- Additional export options for different paper sizes
- Expanded examples and starter templates
- Support for converting plain text and DOCX files into polished reports

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Notes

The output is intentionally static, self-contained, and print-friendly. It is ideal for documents that need a polished, editorial-quality presentation without requiring a framework or build step.
