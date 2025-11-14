<h3 id="Get-OPT-Order-History" class="has-code" style="font-size:24px;font-family:'Helvetica',sans-serif;">
Get OPT Order History
</h3>

<strong style="color:#008756;font-size:1.25em">GET</strong> `https://api-pro.sim.hashkeydev.com/api/v1/account/brokerage/trades`

**Weight: 5**

**Request Parameters**

| PARAMETER | TYPE    | Req'd | DESCRIPTION                                |
|-----------|---------|-------|--------------------------------------------|
| startTime | STRING  | Y     | Start timestamp                            |
| endTime   | STRING  | Y     | End timestamp                              |
| orderId   | STRING  |       | OPT Order ID                               |
| source    | STRING  |       | Automatic/Manual                           |
| pages     | INTEGER |       | Enter integers 1 or 2, default to 1        |
| limit     | INTEGER |       | Limit of record<br>Default: 500, Max: 1000 |
| timestamp | LONG    | Y     | Timestamp                                  |

**Response Content**

```json
[
  {
    "orderId": "SWAP704632933320630272",
    "status": "Processing",
    "buyAmount": "-",
    "buyAsset": "USD",
    "sellAmount": "99.00000000",
    "sellAsset": "USDT",
    "price": "-",
    "updateTime": "2025-04-28 09:59:42",
    "source": "Automatic"
  },
  {
    "orderId": "SWAP699644019747282944",
    "status": "Succeeded",
    "buyAmount": "18.00180019",
    "buyAsset": "USDT",
    "sellAmount": "18.00000000",
    "sellAsset": "USD",
    "price": "0.99990000",
    "updateTime": "2025-04-14 15:35:33",
    "source": "Automatic"
  },
  {
    "orderId": "SWAP699565941616500736",
    "status": "Failed",
    "buyAmount": "21.00000000",
    "buyAsset": "USDT",
    "sellAmount": "21.00000000",
    "sellAsset": "USD",
    "price": "1.00000000",
    "updateTime": "2025-04-14 10:25:17",
    "source": "Automatic"
  }
]
```

| **PARAMETER** | **TYPE**         | **Example values**     | **DESCRIPTION**                         |
|:--------------|:-----------------|:-----------------------|:----------------------------------------|
| orderId       | STRING           | SWAP509692083805077504 | OPT Order ID                            |
| buyAmount     | STRING (decimal) | 99999                  | Buy Amount                              |
| buyAsset      | STRING           | USD                    | Buy Asset                               |
| sellAmount    | STRING (decimal) | 100000                 | Sell Amount                             |
| sellAsset     | STRING           | USDT                   | Sell Asset                              |
| price         | STRING (decimal) | 1.11111111             | Price                                   |
| source        | STRING           | Automatic              | Automatic order<br>Manual order         |
| status        | STRING           | Succeeded              | "Processing"<br>"Succeeded"<br>"Failed" |
| updateTime    | STRING           | 2025-04-10 12:52:42    | Last Updated Time                       |
