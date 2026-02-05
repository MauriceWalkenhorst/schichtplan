
const { chromium } = require('playwright');
const path = require('path');

(async () => {
    const browser = await chromium.launch({ headless: true });
    const page = await browser.newPage();
    
    const htmlContent = `
    <!DOCTYPE html>
    <html>
    <head>
        <style>
            body {
                width: 400px;
                height: 200px;
                display: flex;
                justify-content: center;
                align-items: center;
                background: linear-gradient(135deg, #1e3a8a 0%, #3b82f6 100%);
                color: white;
                font-family: sans-serif;
                margin: 0;
            }
            .card {
                text-align: center;
                padding: 20px;
                border-radius: 12px;
                background: rgba(255, 255, 255, 0.1);
                backdrop-filter: blur(5px);
                border: 1px solid rgba(255, 255, 255, 0.2);
            }
            h1 { margin: 0; font-size: 24px; }
            p { margin: 10px 0 0; opacity: 0.9; }
        </style>
    </head>
    <body>
        <div class="card">
            <h1>Test Info-Card</h1>
            <p>Technik-Walter System Check</p>
            <p style="font-size: 12px;">Generated via Playwright</p>
        </div>
    </body>
    </html>
    `;

    await page.setViewportSize({ width: 400, height: 200 });
    await page.setContent(htmlContent);
    await page.screenshot({ path: 'test_card.png' });
    
    await browser.close();
    console.log('PNG exported to test_card.png');
})();
