# Platemark

Send data, get back a finished file. Platemark is a hosted MCP server and REST API that makes chart images from numbers, PDFs with the math done to the cent (invoices, quotes, receipts, certificates, letters), social images from templates, and short videos.

Language models slip on arithmetic and page layout. Platemark takes both off their hands. The agent passes quantities and prices, and Platemark does the sums, formats money for the currency and returns a PDF link with the totals as JSON. So what the agent says always matches the document.

The server is hosted, so there's nothing to install or run. This repo holds the listing file and some examples. The server code isn't here.

## Connect

Endpoint: `https://platemark.rowhousesoftware.com/mcp` (Streamable HTTP)

```json
{
  "mcpServers": {
    "platemark": {
      "type": "http",
      "url": "https://platemark.rowhousesoftware.com/mcp",
      "headers": { "Authorization": "Bearer pm_YOUR_KEY" }
    }
  }
}
```

## No key? Try it anyway

Leave the header off. `render_chart`, `render_invoice`, `render_document` and `render_image` work 3 times a day per address, with a small watermark. Video needs a key.

For more, the agent calls `create_account` with your email and gets a free key back: 100 credits a month. Or get one at [platemark.rowhousesoftware.com](https://platemark.rowhousesoftware.com/#key).

## Tools

| Tool | What it does | Credits |
|-|-|-|
| `render_chart` | Bar, horizontal bar, stacked bar, line, area, pie or donut chart from numbers. Returns the PNG and a link, plus one sentence of alt text. | 1 |
| `render_invoice` | Invoice PDF from line items, tax, discount, shipping and amount paid. Returns the link and the totals. | 2 |
| `render_document` | Quote, receipt, certificate or letter PDF. | 2 |
| `list_templates` | Image templates and their slots. Filter by tag, like `real estate`, `og` or `story`. | 0 |
| `render_image` | Fills a template and returns the PNG. Text shrinks to fit its box. | 1 |
| `render_video` | MP4 up to 90 seconds from template or photo scenes, with slow zooms and fades, plus music if you want it. Returns a job id. | 0.5 per second |
| `video_status` | Status of a video job, with the MP4 link when it's done. | 0 |
| `account_status` | Plan and credits left. | 0 |
| `create_account` | Free account and API key, so an agent can sign itself up. | 0 |

## Examples

Things to ask an agent once it's connected:

- "Make a bar chart of our monthly revenue: Jan 12,400, Feb 15,800, Mar 14,200. Highlight March."
- "Invoice Ledgerline for 24 hours of website design at $65 and a year of hosting at $120, 6% sales tax, due in 30 days."
- "Make a certificate of completion for Jordan Ellis for the October safety course."

The [examples](examples) folder has the same calls for scripts:

- [chart.sh](examples/chart.sh): a chart PNG with curl
- [invoice.sh](examples/invoice.sh): an invoice PDF, with the link and totals back as JSON
- [og_image.py](examples/og_image.py): a link preview image from Python
- [render_invoice.json](examples/render_invoice.json): what an agent sends to `render_invoice`
- [mcp-config.json](examples/mcp-config.json): the client config above

All of them run with no key. Set `PLATEMARK_KEY` to use yours.

The invoice example comes back with a subtotal of 1,680.00, tax of 100.80 and 1,780.80 due.

## REST API

Same features over HTTP at `https://platemark.rowhousesoftware.com/v1`: `POST /v1/charts`, `/v1/documents`, `/v1/images` and `/v1/videos`. See the [docs](https://platemark.rowhousesoftware.com/docs), the [OpenAPI spec](https://platemark.rowhousesoftware.com/openapi.json) or [llms.txt](https://platemark.rowhousesoftware.com/llms.txt).

## Pricing

Free: 100 credits a month with a small watermark. Paid plans start at $19 a month for 2,000 credits, with no watermark. [All plans](https://platemark.rowhousesoftware.com/#pricing).

## Links

- Site: https://platemark.rowhousesoftware.com
- Docs: https://platemark.rowhousesoftware.com/docs
- Official MCP registry: `com.rowhousesoftware/platemark`
- Privacy: https://platemark.rowhousesoftware.com/privacy
- Terms: https://platemark.rowhousesoftware.com/terms
- Support: support@rowhousesoftware.com

Made by [Rowhouse Software](https://rowhousesoftware.com).
