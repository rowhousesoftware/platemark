# A 1200x630 link preview image from the og-image template.
# Works with no key 3 times a day (watermarked). Set PLATEMARK_KEY for more.
import os
import requests

headers = {}
if os.environ.get("PLATEMARK_KEY"):
    headers["Authorization"] = f"Bearer {os.environ['PLATEMARK_KEY']}"

r = requests.post(
    "https://platemark.rowhousesoftware.com/v1/images",
    headers=headers,
    json={"template": "og-image", "modifications": {"title": "How we closed the books in 2 days"}},
)
r.raise_for_status()
open("og.png", "wb").write(r.content)
print("Saved og.png.", r.headers.get("x-trial-left", ""), "trial renders left today" if "x-trial-left" in r.headers else "")
