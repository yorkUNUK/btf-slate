<h3 id="Query-Order" style="font-size:24px;font-family:'Helvetica',sans-serif;">
Query Order
</h3>   

<strong style="color:#008756;font-size:1.25em">GET</strong> `https://api-pro.sim.hashkeydev.com/api/v1/spot/order`

Check a single order information

<aside class="notice">
    📘 Note: Average price can be calculated by cumulativeQuoteQty / executedQty
</aside>

**Weight: 1**

**Request Parameters**

| **PARAMETER**     | **TYPE** | Req'd | **DESCRIPTION** |
|-------------------|----------|-------|-----------------|
| orderId           | STRING   | C     | Order ID        |
| origClientOrderId | STRING   | C     | Client order ID |
| accountId         | STRING   |       | Account ID      |
| timestamp         | LONG     | Y     | Timestamp       |

**Response Content**

```json
{
  "accountId": "1816094214250944000",
  "exchangeId": "301",
  "symbol": "BTCUSDT",
  "symbolName": "BTCUSDT",
  "clientOrderId": "1753258121083398",
  "orderId": "2000868573824739840",
  "price": "120002",
  "origQty": "0.001",
  "executedQty": "0.001",
  "cummulativeQuoteQty": "120.00101",
  "cumulativeQuoteQty": "120.00101",
  "avgPrice": "120001.01",
  "status": "FILLED",
  "timeInForce": "GTC",
  "type": "LIMIT",
  "side": "BUY",
  "stopPrice": "0.0",
  "icebergQty": "0.0",
  "time": "1753258121171",
  "updateTime": "1753258121278",
  "isWorking": true,
  "reqAmount": "0",
  "feeCoin": "BTC",
  "feeAmount": "0.000002",
  "feeSupplementaryAmount": "0.00000634",
  "sumFeeAmount": "0.000002",
  "platformFeeCoin": "",
  "sumPlatformFeeAmount": "",
  "ordCxlReason": "",
  "stpMode": "EXPIRE_TAKER"
}
```

| **PARAMETER**          | **TYPE**         | Example values      | **DESCRIPTION**                                                                                                                       |
|------------------------|------------------|---------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| accountId              | STRING           | 1467298646903017216 | Account number                                                                                                                        |
| exchangeId             | STRING           | 301                 | Exchange number                                                                                                                       |
| symbol                 | STRING           | BTCUSD              | Trading pair                                                                                                                          |
| symbolName             | STRING           | BTCUSD              | Trading pair name                                                                                                                     |
| clientOrderId          | STRING           | 1690084460710352    | An ID defined by the client for the order, it will be automatically generated if it is not sent in the request                        |
| orderId                | STRING           | 1470929500342690304 | System-generated order ID (up to 20 characters)                                                                                       |
| price                  | STRING (decimal) | 28000               | Price                                                                                                                                 |
| origQty                | STRING (decimal) | 0.01                | Quantity                                                                                                                              |
| executedQty            | STRING (decimal) | 0                   | Traded Volume                                                                                                                         |
| cumulativeQuoteQty     | STRING (decimal) | 0                   | Cumulative volume. Commonly known as Transaction Amount                                                                               |
| avgPrice               | STRING (decimal) | 0                   | Average traded price                                                                                                                  |
| status                 | STRING           | NEW                 | Order status (see enumeration definition for more details)                                                                            |
| timeInForce            | STRING           | GTC                 | Duration of the order before expiring                                                                                                 |
| type                   | STRING           | LIMIT               | Order type (see enumeration definition for more details)                                                                              |
| side                   | STRING           | BUY                 | BUY or SELL                                                                                                                           |
| stopPrice              | STRING (decimal) | 0.0                 | Not used                                                                                                                              |
| icebergQty             | STRING (decimal) | 0.0                 | Not used                                                                                                                              |
| time                   | STRING (decimal) | 1688036585077       | Order creation Timestamp                                                                                                              |
| updateTime             | STRING (decimal) | 1688036585084       | Latest update Timestamp according to status                                                                                           |
| isWorking              | BOOLEAN          | TRUE                | Not used                                                                                                                              |
| reqAmount              | STRING           | 0                   | Requested Cash amount                                                                                                                 |
| feeCoin                | STRING           | USDT                | The Coin to be charged as commission fee.                                                                                             |
| feeAmount              | STRING           | 0.006               | The commission fee to be charged for the last filled trade without Platform Coin deduction. The unit is number of the "feeCoin"       |
| feeSupplementaryAmount | STRING           | 0.00000634          | Supplementary commission fee to meet minimum commission fee requirement                                                               |
| sumFeeAmount           | STRING           | 0.006               | Accumulated commission to be charged for all trades of the order without Platform Coin deduction. The unit is number of the "feeCoin" |
| platformFeeCoin        | STRING           | HSK                 | Platform Coin used for commission deduction for the order                                                                             |
| sumPlatformFeeAmount   | STRING           | 0.01710699553165824 | Accumulated Platform Coin spent as Commission fee deduction for the order. The unit is number of the platform coin.                   |
| ordCxlReason           | STRING           |                     | Order cancel reason                                                                                                                   |
| stpMode                | STRING           | EXPIRE_MAKER        | Self Trade Prevention Mode.<br />Enum: EXPIRE_TAKER, EXPIRE_MAKER<br />Default EXPIRE_TAKER if not specified.                         |
