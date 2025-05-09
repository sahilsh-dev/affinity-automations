import requests
import json
from bs4 import BeautifulSoup

URL = "https://www.olx.in/items/q-car-cover"
HEADERS = {
    "User-Agent": (
        "Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
        "AppleWebKit/537.36 (KHTML, like Gecko) "
        "Chrome/90.0.4430.93 Safari/537.36"
    )
}


def fetch_data(url):
    response = requests.get(url)
    response.raise_for_status()
    print(response.text)
    return response.text


def parse_items(html):
    soup = BeautifulSoup(html, "html.parser")
    script = soup.find("script", id="__NEXT_DATA__")
    data = json.loads(script.string)
    items = (
        data["props"]["pageProps"]["initialData"]["searchResults"]["data"]
    )
    results = []
    for it in items:
        ad = {
            "id": it.get("_id"),
            "title": it.get("title"),
            "price": it.get("price"),
            "location": it.get("locations")[0].get("name") if it.get("locations") else None,
            "url": it.get("url")
        }
        results.append(ad)
    return results


def save_to_file(data, filename="results.json"):
    with open(filename, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=2)


if __name__ == "__main__":
    print("Starting OLX scraping...")
    html = fetch_data(URL)
    items = parse_items(html)
    save_to_file(items)
    print(f"Saved {len(items)} items to results.json")