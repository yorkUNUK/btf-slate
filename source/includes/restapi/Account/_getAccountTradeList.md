<h3 id="Get-Account-Trade-List" class="has-code" style="font-size:24px;font-family:'Helvetica',sans-serif;">
Get Account Trade List
</h3>

<strong style="color:#008756;font-size:1.25em">GET</strong> `https://api-pro.sim.hashkeydev.com/api/v1/account/trades`

**Weight: 5**

Query account history and transaction records

**Request Parameters**

* If there is only fromId, It will return trades with IDs bigger than fromId, sorted in descending order.
* If there is only toId. It will return trades with IDs less than toId, sorted in descending order
* If both fromId and toId are provided. It will return trades between fromId and toId, sorted in descending order
* If neither fromId or toId is provided, it will return the latest trade records, sorted in descending order.

| **PARAMETER** | **TYPE** | Req'd | **DESCRIPTION**                                         |
|:--------------|:---------|:------|:--------------------------------------------------------|
| symbol        | STRING   |       | Trading pair                                            |
| startTime     | LONG     |       | Start Timestamp                                         |
| endTime       | LONG     |       | End Timestamp. Only supports the last 30 days timeframe |
| clientOrderId | STRING   |       | Client Order ID                                         |
| fromId        | LONG     |       | Starting ID                                             |
| toId          | LONG     |       | End ID                                                  |
| limit         | INT      |       | Limit of record                                         |
| accountId     | LONG     |       | Account ID                                              |
| timestamp     | LONG     | Y     | Timestamp                                               |

**Response Content**

```json
[
  {
    "id": "2000868574042843648",
    "clientOrderId": "1753258121083398",
    "ticketId": "4625196823998763008",
    "symbol": "BTCUSDT",
    "symbolName": "BTCUSDT",
    "orderId": "2000868573824739840",
    "matchOrderId": "0",
    "price": "120001.01",
    "qty": "0.001",
    "commission": "0.000002",
    "commissionAsset": "BTC",
    "time": "1753258121180",
    "isBuyer": true,
    "isMaker": false,
    "fee": {
      "feeCoinId": "BTC",
      "feeCoinName": "BTC",
      "fee": "0.000002",
      "originFee": "0.000002",
      "originCoinId": "BTC",
      "originCoinName": "BTC"
    },
    "feeCoinId": "BTC",
    "feeAmount": "0.000002",
    "feeSupplementaryAmount": "0.00000634",
    "makerRebate": "0",
    "accountId": "1816094214250944000",
    "hskDeduct": false,
    "hskDeductPrice": ""
  }
]
```

| **PARAMETER**          | **TYPE**         | **Example values**  | **DESCRIPTION**                                                                                                |
|------------------------|------------------|---------------------|----------------------------------------------------------------------------------------------------------------|
| *                      | Object Array     |                     | Check transaction results                                                                                      |
| id                     | STRING           | 1470930841345474561 | Unique transaction ID                                                                                          |
| clientOrderId          | STRING           | 999999999800021     | An ID defined by the client for the order, it will be automatically generated if it is not sent in the request |
| ticketId               | STRING           | 1478144171272585249 | Execution ID, the execution ID is the same for the direction of a single trade.                                |
| symbol                 | STRING           | BTCUSD              | Trading pair                                                                                                   |
| symbolName             | STRING           | BTCUSD              | Trading pair name                                                                                              |
| orderId                | STRING           | 1470930841211329280 | Order ID                                                                                                       |
| matchOrderId           | STRING           |                     | //Ignore                                                                                                       |
| price                  | STRING (decimal) | 29851.03            | Price                                                                                                          |
| qty                    | STRING (decimal) | 0.0005              | Quantity                                                                                                       |
| commission             | STRING (decimal) | 0.02985103          | Commission fee                                                                                                 |
| commissionAsset        | STRING           | USD                 | Currency of commission fee                                                                                     |
| time                   | STRING (decimal) | 1690084620567       | Millisecond Timestamp — trade time (traded but not yet settled) 撮合成交时间                                         |
| isBuyer                | BOOLEAN          | false               | Whether the trade is a buyer                                                                                   |
| isMaker                | BOOLEAN          | false               | Whether the trade is a maker                                                                                   |
| fee                    | Object           |                     | Fee information                                                                                                |
| fee.feeCoinId          | STRING           | USD                 | Fee currency                                                                                                   |
| fee.feeCoinName        | STRING           | USD                 | Fee currency name                                                                                              |
| fee.fee                | STRING (decimal) | 0.02985103          | Transaction fee amount after HSK deduction                                                                     |
| fee.originFee          | STRING (decimal) | 0.03085103          | The commission fee before HSK deduction.                                                                       |
| fee.originCoinId       | STRING           | USD                 | The commission fee before HSK deduction                                                                        |
| fee.originCoinName     | STRING           | USD                 | The commission fee coin                                                                                        |
| feeCoinId              | STRING           | USD                 | Fee currency                                                                                                   |
| feeAmount              | STRING (decimal) | 0.02985103          | Amount of transaction fee                                                                                      |
| feeSupplementaryAmount | STRING           | 0.00000634          | Supplementary commission fee to meet minimum commission fee requirement                                        |
| makerRebate            | STRING           | 0                   | Return                                                                                                         |
| accountId              | STRING           | 1545583349011201280 | Account ID                                                                                                     |
| hskDeduct              | BOOLEAN          | true                | true: successfully deducted HSK  false                                                                         |
| hskDeductPrice         | STRING           | 0.001               | commission Coin price / HSK price                                                                              |