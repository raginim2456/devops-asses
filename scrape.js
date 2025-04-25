const puppeteer = require('puppeteer');
const fs = require('fs');

const url = process.env.SCRAPE_URL || 'https://example.com';

(async () => {
  const browser = await puppeteer.launch({
    headless: true,
    args: ['--no-sandbox', '--disable-setuid-sandbox'],
    //executablePath: '/usr/bin/chromium-browser'
    executablePath: '/usr/bin/chromium'
  });

  const page = await browser.newPage();
  await page.goto(url, { waitUntil: 'domcontentloaded' });

  const title = await page.title();
  const h1 = await page.$eval('h1', el => el.innerText).catch(() => 'No H1 tag');

  const result = { url, title, h1 };

  fs.writeFileSync('scraped_data.json', JSON.stringify(result, null, 2));

  await browser.close();
})();
