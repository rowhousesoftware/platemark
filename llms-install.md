# Installing Platemark

Platemark is a hosted MCP server. There's nothing to clone, build or run.

1. Add a remote server named `platemark` with the Streamable HTTP transport and this URL: `https://platemark.rowhousesoftware.com/mcp`
2. That's enough to start. Without a key, `render_chart`, `render_invoice`, `render_document` and `render_image` work 3 times a day with a small watermark.
3. For more, call the `create_account` tool with the user's email. It returns a key that starts with `pm_`. Tell the user to save it, then add it to the server config as a header: `Authorization: Bearer pm_...`

Config with a key:

```json
{
  "mcpServers": {
    "platemark": {
      "type": "streamableHttp",
      "url": "https://platemark.rowhousesoftware.com/mcp",
      "headers": { "Authorization": "Bearer pm_YOUR_KEY" }
    }
  }
}
```

To check it works, call `render_chart` with `{"type": "bar", "title": "Test", "labels": ["A", "B"], "values": [3, 5]}`. It should return a PNG.
