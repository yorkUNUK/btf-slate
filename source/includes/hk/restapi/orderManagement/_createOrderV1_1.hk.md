<h3 id="Create-Order-v1_1" style="font-size:24px;font-family:'Helvetica',sans-serif;">
Create Order v1.1
</h3>   

<strong style="color:#0074e1;font-size:1.25em">POST</strong> `https://api-pro.sim.hashkeydev.com/api/v1.1/spot/order`

<aside class="notice">
    📘 Note: Supports specifying both the cash amount and the quantity for market orders, regardless of whether it's a buy or sell order
</aside>

**Weight: 1**

Certain parameters are mandatory depending on the order `type`:

| Type        | Mandatory parameters |
|-------------|----------------------|
| LIMIT       | quantity, price      |
| MARKET      | quantity or amount   |
| LIMIT_MAKER | quantity, price      |

**Request Parameters**

| **PARAMETER**    | **TYPE** | Req'd | **DESCRIPTION**                                                                                                                                                                                                                                                                                                                                                                                           |
|------------------|----------|-------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| symbol           | STRING   | Y     | Name of instrument<br />e.g. "BTCUSD", "ETHUSD"                                                                                                                                                                                                                                                                                                                                                           |
| side             | ENUM     | Y     | BUY or SELL                                                                                                                                                                                                                                                                                                                                                                                               |
| type             | ENUM     | Y     | Currently offer 3 order types:<br /><br />- LIMIT - Limit order<br />- MARKET - Market order<br />- LIMIT_MAKER - Maker Limit order                                                                                                                                                                                                                                                                       |
| quantity         | DECIMAL  | C     | Order quantity in units of the instrument<br /><br />- Limit order: Represents the amount of the base asset you want to buy or sell.<br />  For example: BTC/USD pair, if quantity is 0.5, you're ordering 0.5 BTC<br /><br />- Market order: Represents the amount of the base asset to buy or sell<br />For example: BTC/USDT pair, if quantity is 0.5, you're buying 0.5 BTC worth at the market price |
| amount           | DECIMAL  | C     | Cash amount in the units of quote asset. Market order only<br /><br />- Market order: Represents the amount of the quote asset you want to use for the trade<br />For example: For BTC/USD pair, if amount = 1000, you are placing a MARKET buy order to purchase BTC using 1000 USD at the current market price.                                                                                         |
| price            | DECIMAL  | C     | Required for LIMIT and LIMIT_MAKER order                                                                                                                                                                                                                                                                                                                                                                  |
| newClientOrderId | STRING   |       | An ID defined by the client for the order, it will be automatically generated if it is not sent in the request. (up to 255 characters)                                                                                                                                                                                                                                                                    |
| timeInForce      | ENUM     |       | **"GTC"** for Limit order & Limit maker order<br /> **"IOC"** for Limit order & Market order<br /> **"FOK"** for Limit order                                                                                                                                                                                                                                                                              |
| recvWindow       | LONG     |       | Recv Window. Default 5000                                                                                                                                                                                                                                                                                                                                                                                 |
| timestamp        | LONG     | Y     | Timestamp                                                                                                                                                                                                                                                                                                                                                                                                 |
| stpMode          | ENUM     | C     | Self Trade Prevention Mode.<br />Enum: EXPIRE_TAKER, EXPIRE_MAKER<br />Default EXPIRE_TAKER if not specified.                                                                                                                                                                                                                                                                                             |

**Response Content**

```json
{
  "accountId": "1464567707961719552",
  "symbol": "ETHUSD",
  "symbolName": "ETHUSD",
  "clientOrderId": "99999888905",
  "orderId": "1563277167764290304",
  "transactTime": "1701093160541",
  "price": "1900",
  "origQty": "0.03",
  "executedQty": "0",
  "status": "NEW",
  "timeInForce": "GTC",
  "type": "LIMIT",
  "side": "BUY",
  "reqAmount": "0",
  "concentration": ""
}
```

| **PARAMETER** | **TYPE** | Example values      | **DESCRIPTION**                                                                                                |
|---------------|----------|---------------------|----------------------------------------------------------------------------------------------------------------|
| accountId     | LONG     | 1467298646903017216 | Account number                                                                                                 |
| symbol        | STRING   | BTCUSD              | Trading pair                                                                                                   |
| symbolName    | STRING   | BTCUSD              | Trading pair name                                                                                              |
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
| reqAmount     | STRING   | 0                   | Requested Cash amount                                                                                          |
| concentration | STRING   |                     | Concentration reminder message                                                                                 |

