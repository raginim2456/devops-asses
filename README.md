
---

## 📌 Features

- ✅ Headless Chromium scraping with Puppeteer
- ✅ Lightweight final Docker image (Python-only)
- ✅ Flask API returns the scraped data in JSON format
- ✅ Dynamic URL passed via environment variable

---

## 🐳 How to Build and Run the Docker Image

### 🔨 Step 1: Build the Docker Image

```bash
docker build -t devopss .

### 🔨 Step 1: Run the Docker Container

Docker run -dp 5000:5000 devopss


🌐 Access the Scraped Data
Once the container is running, visit:
ec2-instance IP address: 51.20.126.147
Edit Inbound Rule to expose the port 5000

http://51.20.126.147:5000/





📌 What This Project Does


Step 1: It scrapes a web page (like https://example.com) using Puppeteer (a Node.js library) and Chromium browser in headless mode.

Step 2: It saves the scraped data (page title, first <h1>, and URL) into a file called scraped_data.json.

Step 3: It runs a Flask web server (Python) that reads this JSON file and shows the data on a webpage (at / endpoint).

Step 4: Everything runs inside one Docker container built using a multi-stage Dockerfile (Node.js + Python).



 How the Code Works
1. scrape.js (Node.js with Puppeteer)
Launches a headless browser (Chromium).

Goes to the URL given by the environment variable SCRAPE_URL.

Extracts:

Title of the page (<title>)

First heading (<h1>)

URL visited

Saves the result into scraped_data.json.

2. server.py (Python with Flask)
Reads scraped_data.json.

Starts a simple web server on port 5000.

When you open the page in a browser, it shows the JSON data.

3. Dockerfile
First builds the Node.js app and installs Chromium.

Then sets up Python + Flask to serve the scraped result.

Final container is very small and optimized.
🎯 Final Summary (One line)
"This project uses Node.js and Puppeteer to scrape a website, saves the data, and serves it via a Flask app inside a lightweight Docker container."





the Output Is:





