const fs = require("node:fs/promises");
const path = require("node:path");
const { firefox } = require("playwright");

async function main() {
  const [, , url, requestedFilename = "screenshot.png"] = process.argv;

  if (!url) {
    console.error("Usage: node scripts/playwright-screenshot.js <url> [filename]");
    process.exitCode = 1;
    return;
  }

  const outputRoot = path.resolve("/output");
  const outputPath = path.resolve(outputRoot, requestedFilename);

  if (
    outputPath === outputRoot ||
    !outputPath.startsWith(`${outputRoot}${path.sep}`)
  ) {
    throw new Error("The screenshot filename must stay inside /output");
  }

  const viewport = {
    width: Number(process.env.PLAYWRIGHT_WIDTH || 1440),
    height: Number(process.env.PLAYWRIGHT_HEIGHT || 1200),
  };

  await fs.mkdir(path.dirname(outputPath), { recursive: true });

  const browser = await firefox.launch({ headless: true });

  try {
    const page = await browser.newPage({ viewport });

    await page.goto(url, {
      waitUntil: "networkidle",
      timeout: 60_000,
    });

    await page.screenshot({
      path: outputPath,
      fullPage: true,
    });

    console.log(`title: ${await page.title()}`);
    console.log(`url: ${page.url()}`);
    console.log(`screenshot: ${outputPath}`);
  } finally {
    await browser.close();
  }
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
