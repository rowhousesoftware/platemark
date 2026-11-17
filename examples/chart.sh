#!/bin/sh
# A bar chart PNG. Works with no key 3 times a day (watermarked). Set PLATEMARK_KEY for more.
curl https://platemark.rowhousesoftware.com/v1/charts \
  ${PLATEMARK_KEY:+-H "Authorization: Bearer $PLATEMARK_KEY"} \
  -H "Content-Type: application/json" \
  -d '{
    "type": "bar",
    "title": "Monthly revenue",
    "subtitle": "USD, first half of 2026",
    "format": "currency",
    "labels": ["Jan", "Feb", "Mar", "Apr", "May", "Jun"],
    "values": [12400, 15800, 14200, 19900, 23100, 27600],
    "highlight": "Jun"
  }' > chart.png
