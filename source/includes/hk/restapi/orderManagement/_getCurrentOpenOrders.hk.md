<h3 id="Get-Current-Open-Orders" style="font-size:24px;font-family:'Helvetica',sans-serif;">
Get Current Open Orders
</h3>   

<strong style="color:#008756;font-size:1.25em">GET</strong> `https://api-pro.sim.hashkeydev.com/api/v1/spot/openOrders`

Query current active orders

<aside class="notice">
    📘 Note: In regards to master API key. The request parameters of "side" and "accountId". If "accountId" is passed, it will only query the orders under the current account. If not passed, it will first query the main account, and if the results are less than 500, it will then query the sub-accounts.
</aside>

**Weight: 1**

**Request Parameters**

| **PARAMETER** | **TYPE** | Req'd | 	Example values     | **DESCRIPTION**                             |
|---------------|----------|-------|---------------------|---------------------------------------------|
| orderId       | STRING   |       | 1470930457684189696 | Order ID                                    |
| symbol        | STRING   |       | BTCUSD              | Currency pair. Return all if not specified. |
| side          | STRING   |       | BUY                 | Side                                        |
| limit         | INTEGER  |       | 20                  | Default 500, Maximum 1000                   |
| timestamp     | LONG     | Y     |                     | Timestamp                                   |

**Response Content**

```json
[
  {
    "accountId": "1464567707961719552",
    "exchangeId": "301",
    "symbol": "ETHUSD",
    "symbolName": "ETHUSD",
    "clientOrderId": "99999888913",
    "orderId": "1563293653459405312",
    "price": "1900",
    "origQty": "1",
    "executedQty": "0",
    "cummulativeQuoteQty": "0",
    "cumulativeQuoteQty": "0",
    "avgPrice": "0",
    "status": "NEW",
    "timeInForce": "GTC",
    "type": "LIMIT",
    "side": "BUY",
    "stopPrice": "0.0",
    "icebergQty": "0.0",
    "time": "1701095125789",
    "updateTime": "1701095125798",
    "isWorking": true,
    "reqAmount": "0"
  }
]
```

| **PARAMETER**        | **TYPE**         | Example values      | **DESCRIPTION**                                                                                                |
|----------------------|------------------|---------------------|----------------------------------------------------------------------------------------------------------------|
| No                   | Object Array     |                     | Query result array                                                                                             |
| - accountId          | STRING           | 1467298646903017216 | Account number                                                                                                 |
| - exchangeId         | STRING           | 301                 | Exchange number                                                                                                |
| - symbol             | STRING           | BTCUSD              | Trading pair                                                                                                   |
| - symbolName         | STRING           | BTCUSD              | Trading pair name                                                                                              |
| - clientOrderId      | STRING           | 1690084460710352    | An ID defined by the client for the order, it will be automatically generated if it is not sent in the request |
| - orderId            | STRING           | 1470929500342690304 | System-generated order ID (up to 20 characters)                                                                |
| - price              | STRING (decimal) | 28000               | Price                                                                                                          |
| - origQty            | STRING (decimal) | 0.01                | Quantity                                                                                                       |
| - executedQty        | STRING (decimal) | 0                   | Traded Volume                                                                                                  |
| - cumulativeQuoteQty | STRING (decimal) | 0                   | Cumulative volume. Commonly known as Transaction Amount                                                        |
| - avgPrice           | STRING (decimal) | 0                   | Average traded price                                                                                           |
| - status             | STRING           | NEW                 | Order status (see enumeration definition for more details)                                                     |
| - timeInForce        | STRING           | GTC                 | Duration of the order before expiring                                                                          |
| - type               | STRING           | LIMIT               | Order type (see enumeration definition for more details)                                                       |
| - side               | STRING           | BUY                 | BUY or SELL                                                                                                    |
| - stopPrice          | STRING (decimal) | 0.0                 | Not used                                                                                                       |
| - icebergQty         | STRING (decimal) | 0.0                 | Not used                                                                                                       |
| - time               | STRING (decimal) | 1688036585077       | Order creation Timestamp                                                                                       |
| - updateTime         | STRING (decimal) | 1688036585084       | Latest update Timestamp according to status                                                                    |
| - isWorking          | BOOLEAN          | TRUE                | Not used                                                                                                       |
| - reqAmount          | STRING           | 0                   | Requested Cash amount                                                                                          |
| - stpMode            | STRING           | EXPIRE_MAKER        | Self Trade Prevention Mode.<br />Enum: EXPIRE_TAKER, EXPIRE_MAKER<br />Default EXPIRE_TAKER if not specified.  |
