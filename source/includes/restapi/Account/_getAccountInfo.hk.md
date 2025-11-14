<h3 id="Get-Account-Information" class="has-code" style="font-size:24px;font-family:'Helvetica',sans-serif;">
Get Account Information
</h3>

<strong style="color:#008756;font-size:1.25em">GET</strong> `https://api-pro.sim.hashkeydev.com/api/v1/account`

**Weight: 5**

Retrieve account balance

**Request Parameters**

| PARAMETER | TYPE | Req'd | Example values      | DESCRIPTION                                                                                                                    |
|-----------|------|-------|---------------------|--------------------------------------------------------------------------------------------------------------------------------|
| accountId | LONG | Y     | 1471090223379184384 | Account ID, for Master Key only (Master Key users can check sub trading account information by inputing sub trading accountId) |
| timestamp | LONG | Y     |                     | Timestamp                                                                                                                      |

**Response Content**

```json
{
  "balances": [
    {
      "asset": "BTC",
      "assetId": "BTC",
      "assetName": "BTC",
      "total": "333.805297855",
      "free": "333.775297855",
      "locked": "0.03"
    },
    {
      "asset": "ETH",
      "assetId": "ETH",
      "assetName": "ETH",
      "total": "239.2252562",
      "free": "239.2252562",
      "locked": "0"
    },
    {
      "asset": "HKD",
      "assetId": "HKD",
      "assetName": "HKD",
      "total": "9775428.24",
      "free": "9775428.24",
      "locked": "0"
    },
    {
      "asset": "USD",
      "assetId": "USD",
      "assetName": "USD",
      "total": "8180584.8854663502",
      "free": "8177843.2054663502",
      "locked": "2741.68"
    },
    {
      "asset": "USDC",
      "assetId": "USDC",
      "assetName": "USDC",
      "total": "12684763.712318516",
      "free": "12684763.712318516",
      "locked": "0"
    },
    {
      "asset": "USDT",
      "assetId": "USDT",
      "assetName": "USDT",
      "total": "91579.017554413172",
      "free": "91579.017554413172",
      "locked": "0"
    }
  ],
  "userId": "4014986192463421361"
}
```

| **PARAMETER**      | **TYPE**     | **Example values**  | **DESCRIPTION**       |
|:-------------------|:-------------|:--------------------|:----------------------|
| balances           | Object Array |                     | Query an asset array  |
| balances.asset     | STRING       | BTC                 | Assets                |
| balances.assetId   | STRING       | BTC                 | Asset ID              |
| balances.assetName | STRING       | BTC                 | Asset Name            |
| balances.total     | STRING       | 100.63264           | Total available funds |
| balances.free      | STRING       | 100.63264           | Available funds       |
| balances.locked    | STRING       | 0                   | Frozen funds          |
| userId             | STRING       | 4014986192463421361 | User ID               |