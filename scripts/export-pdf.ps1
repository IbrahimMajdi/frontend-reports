<#
.SYNOPSIS
  Export an HTML report to A4 PDF using Puppeteer.
.DESCRIPTION
  Serves the HTML file over a local HTTP server (for font loading),
  renders it with Puppeteer/Chromium, and saves as A4 PDF.
.PARAMETER HtmlPath
  Path to the HTML report file.
.PARAMETER OutputPath
  Output PDF path (optional; defaults to same name as HTML).
.EXAMPLE
  .\scripts\export-pdf.ps1 .\report.html
  .\scripts\export-pdf.ps1 .\report.html .\report.pdf
#>

param(
  [Parameter(Mandatory=$true)][string]$HtmlPath,
  [Parameter(Mandatory=$false)][string]$OutputPath
)

$ErrorActionPreference = "Stop"

$HtmlPath = Resolve-Path -LiteralPath $HtmlPath -ErrorAction Stop
if (-not (Test-Path $HtmlPath)) { Write-Host "File not found: $HtmlPath" -ForegroundColor Red; exit 1 }

$dir = Split-Path $HtmlPath -Parent
$file = Split-Path $HtmlPath -Leaf

if (-not $OutputPath) { $OutputPath = Join-Path $dir "$([System.IO.Path]::GetFileNameWithoutExtension($file)).pdf" }
$OutputPath = [System.IO.Path]::GetFullPath($OutputPath)
$null = New-Item -ItemType Directory -Path (Split-Path $OutputPath -Parent) -Force

Write-Host "Exporting report to PDF..." -ForegroundColor Cyan
Write-Host "  Input:  $HtmlPath"
Write-Host "  Output: $OutputPath"

$tmpDir = Join-Path $env:TEMP ("report-export-" + (Get-Random).ToString())
New-Item -ItemType Directory -Path $tmpDir -Force | Out-Null

try {
  Set-Location -LiteralPath $tmpDir

  @"
{ "name": "export", "private": true, "type": "module" }
"@ | Set-Content package.json

  @'
import puppeteer from 'puppeteer';
import { createServer } from 'http';
import { readFileSync } from 'fs';
import { join, extname } from 'path';

const SERVE_DIR = process.argv[2];
const HTML_FILE = process.argv[3];
const OUTPUT = process.argv[4];

const MIME_TYPES = {
  '.html': 'text/html', '.css': 'text/css', '.js': 'application/javascript',
  '.png': 'image/png', '.jpg': 'image/jpeg', '.svg': 'image/svg+xml',
  '.woff': 'font/woff', '.woff2': 'font/woff2', '.ttf': 'font/ttf',
};

const server = createServer((req, res) => {
  const decoded = decodeURIComponent(req.url);
  const fp = join(SERVE_DIR, decoded === '/' ? HTML_FILE : decoded);
  try {
    const c = readFileSync(fp);
    const ext = extname(fp).toLowerCase();
    res.writeHead(200, { 'Content-Type': MIME_TYPES[ext] || 'application/octet-stream' });
    res.end(c);
  } catch { res.writeHead(404); res.end('Not found'); }
});

const port = await new Promise(r => server.listen(0, () => r(server.address().port)));
console.log('  Server on port', port);

const browser = await puppeteer.launch({ headless: "new", args: ['--no-sandbox'] });
const page = await browser.newPage();
await page.goto('http://localhost:' + port + '/', { waitUntil: 'networkidle0' });
await page.evaluate(() => document.fonts.ready);
await new Promise(r => setTimeout(r, 2000));
const pageCount = await page.evaluate(() => document.querySelectorAll('.page').length);
console.log('  Found', pageCount, 'report pages');
if (pageCount === 0) {
  console.error('  ERROR: No .page elements found in the report.');
  await browser.close();
  server.close();
  process.exit(1);
}
await page.pdf({
  path: OUTPUT, format: 'A4', printBackground: true, preferCSSPageSize: true,
  margin: { top: 0, bottom: 0, left: 0, right: 0 }
});
await browser.close();
server.close();
console.log('Done:', OUTPUT);
'@ | Set-Content export.mjs

  $npmResult = npm install puppeteer@19 2>&1
  if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to install Puppeteer." -ForegroundColor Red
    Write-Host "Try: npm install puppeteer@19" -ForegroundColor Yellow
    exit 1
  }

  $nodeResult = node export.mjs "$dir" "$file" "$OutputPath" 2>&1
  if ($LASTEXITCODE -ne 0) { Write-Host "PDF export failed." -ForegroundColor Red; exit 1 }
  else { Write-Host $nodeResult }
}
finally {
  Set-Location -Path $env:TEMP
  Remove-Item -LiteralPath $tmpDir -Recurse -Force -ErrorAction SilentlyContinue
}

if (Test-Path $OutputPath) {
  $size = (Get-Item -LiteralPath $OutputPath).Length
  Write-Host "SUCCESS: PDF exported ($([math]::Round($size/1KB)) KB)" -ForegroundColor Green
  Write-Host "  $OutputPath"
} else {
  Write-Host "FAILED: PDF not found at $OutputPath" -ForegroundColor Red
  exit 1
}
