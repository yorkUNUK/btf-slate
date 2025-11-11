<h3 id="Cancel-Order" style="font-size:24px;font-family:'Helvetica',sans-serif;">
Cancel Order
</h3>   

<strong style="color:#cb4452;font-size:1.25em;">DELETE</strong> `https://api-pro.sim.hashkeydev.com/api/v1/spot/order`

Cancel an existing order. Either orderId or clientOrderId must be sent.

**Weight: 1**

**Request Parameters**

| **PARAMETER** | **TYPE** | Req'd | **DESCRIPTION**                           |
|---------------|----------|-------|-------------------------------------------|
| orderId       | STRING   | C     | Order ID                                  |
| clientOrderId | STRING   | C     | An ID defined by the client for the order |
| timestamp     | LONG     | Y     | Timestamp                                 |

**Response Content**

```json
{
  "accountId": "1464567707961719552",
  "symbol": "ETHUSD",
  "clientOrderId": "99999888912",
  "orderId": "1563291927536863744",
  "transactTime": "1701094920045",
  "price": "1900",
  "origQty": "1",
  "executedQty": "0",
  "status": "NEW",
  "timeInForce": "GTC",
  "type": "LIMIT",
  "side": "BUY"
}
```

| **PARAMETER** | **TYPE** | Example values      | **DESCRIPTION**                                                                                                |
|---------------|----------|---------------------|----------------------------------------------------------------------------------------------------------------|
| accountId     | LONG     | 1467298646903017216 | Account number                                                                                                 |
| symbol        | STRING   | BTCUSD              | Trading pair                                                                                                   |
| clientOrderId | STRING   | 1690084460710352    | An ID defined by the client for the order, it will be automatically generated if it is not sent in the request |
| orderId       | LONG     | 1470929500342690304 | System-generated order ID (up to 20 characters)                                                                |
| transactTime  | LONG     | 1690084460716       | Timestamp in milliseconds                                                                                      |
| price         | DECIMAL  | 28000               | Price                                                                                                          |
| origQty       | DECIMAL  | 0.01                | Quantity                                                                                                       |
| executedQty   | DECIMAL  | 0                   | Traded Volume                                                                                                  |
| status        | ENUM     | NEW                 | Order status (see enumeration definition for more details)                                                     |
| timeInForce   | ENUM     | GTC                 | Duration of the order before expiring                                                                          |
| type          | ENUM     | LIMIT               | Order type (see enumeration definition for more details)                                                       |
| side          | ENUM     | BUY                 | BUY or SELL                                                                                                    |

