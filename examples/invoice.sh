#!/bin/sh
# An invoice PDF with the totals worked out. Prints the PDF link and the totals as JSON.
# Works with no key 3 times a day (watermarked). Set PLATEMARK_KEY for more.
curl https://platemark.rowhousesoftware.com/v1/documents \
  ${PLATEMARK_KEY:+-H "Authorization: Bearer $PLATEMARK_KEY"} \
  -H "Content-Type: application/json" \
  -d '{
    "type": "invoice",
    "response": "json",
    "from": { "name": "Harbor Design Co.", "email": "billing@harbor.example" },
    "to": { "name": "Ledgerline, Inc." },
    "items": [
      { "description": "Website design", "quantity": 24, "unit_price": 65 },
      { "description": "Hosting, 12 months", "unit_price": 120 }
    ],
    "tax": { "percent": 6, "label": "Sales tax (6%)" },
    "due_days": 30
  }'
