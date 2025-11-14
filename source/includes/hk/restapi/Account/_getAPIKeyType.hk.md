<h3 id="Get-API-Key-Type" class="has-code" style="font-size:24px;font-family:'Helvetica',sans-serif;">
Get API Key Type
</h3>

<strong style="color:#008756;font-size:1.25em">GET</strong> `https://api-pro.sim.hashkeydev.com/api/v1/account/checkApiKey`

**Weight: 1**

**Request Parameters**

| PARAMETER | TYPE | Req'd | Example values      | DESCRIPTION                                                                                                                    |
|-----------|------|-------|---------------------|--------------------------------------------------------------------------------------------------------------------------------|
| timestamp | LONG | Y     |                     | Timestamp                                                                                                                      |

**Response Content**

```json
{
  "accountType": "master"
}
```

| **PARAMETER** | **TYPE** | **Example values** | **DESCRIPTION** |
|:--------------|:---------|:-------------------|:----------------|
| accountType   | STRING   | master (Default)   | Account Type    |