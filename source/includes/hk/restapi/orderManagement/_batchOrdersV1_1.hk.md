<h3 id="Batch-Orders-v1_1" style="font-size:24px;font-family:'Helvetica',sans-serif;">
Create Multiple orders by Symbol v1.1
</h3>   

<strong style="color:#0074e1;font-size:1.25em;">POST</strong> `https://api-pro.sim.hashkeydev.com/api/v1/spot/batchOrders-1`

Create orders in batches up to 20 orders at a time. Currently only support for same symbol.

**Weight: 5**

**Upper Limit: 20 orders/batch**

**Request Parameters**

```shell
curl --request POST \
     --url 'https://api-pro.sim.hashkeydev.com/api/v1/spot/batchOrders-1?timestamp=1707492562526&signature=f19400b8b39964fd596280bbf03b37d39ff858d97e522a82d4994ecddd961e71' \
     --header 'X-HK-APIKEY: NuVdtBcogpRjyQ6sMMlC6KEB0xuXZbng9zXDPyT0TOWHp64UEkyIJ287bBhaW4vy' \
     --header 'accept: application/json' \
     --header 'content-type: application/json' \
     --data '
[
  {
    "symbol": "BTCUSD",
    "side": "SELL",
    "type": "LIMIT",
    "price": "52000",
    "quantity": "0.01",
    "newClientOrderId": "123456789"
  },
  {
    "symbol": "BTCUSD",
    "side": "BUY",
    "type": "LIMIT",
    "price": "43000",
    "quantity": "0.01",
    "newClientOrderId": "123456790"
  }
]
'
```

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
  "code": 0,
  "result": [
    {
      "code": "0000",
      "order": {
        "accountId": "1464567707961719552",
        "symbol": "BTCUSD",
        "symbolName": "BTCUSD",
        "clientOrderId": "122455",
        "orderId": "1563289422480390912",
        "transactTime": "1701094621417",
        "price": "35000",
        "origQty": "0.01",
        "executedQty": "0",
        "status": "NEW",
        "timeInForce": "GTC",
        "type": "LIMIT",
        "side": "SELL",
        "reqAmount": "0"
      }
    },
    {
      "code": "0000",
      "order": {
        "accountId": "1464567707961719552",
        "symbol": "BTCUSD",
        "symbolName": "BTCUSD",
        "clientOrderId": "122433",
        "orderId": "1563289422622997248",
        "transactTime": "1701094621434",
        "price": "35000",
        "origQty": "0.01",
        "executedQty": "0",
        "status": "NEW",
        "timeInForce": "GTC",
        "type": "LIMIT",
        "side": "SELL",
        "reqAmount": "0"
      }
    }
  ],
  "concentration": ""
}
```

| **PARAMETER**       | **TYPE**     | Example values         | **DESCRIPTION**                                                                                                |
|---------------------|--------------|------------------------|----------------------------------------------------------------------------------------------------------------|
| code                | INTEGER      | 0                      | 	Error code                                                                                                    |
| result              | Object Array |                        | Batch order result                                                                                             |
| -code               | INTEGER      | 0                      | Error code of an order                                                                                         |
| -msg	               | STRING       | "Create order failed"	 | Error message                                                                                                  |
| -order	             | Object Array |                        | Order response data                                                                                            |
| order.accountId     | LONG         | 1467298646903017216    | Account number                                                                                                 |
| order.symbol        | STRING       | BTCUSD                 | Trading pair                                                                                                   |
| order.symbolName    | STRING       | BTCUSD                 | Trading pair name                                                                                              |
| order.clientOrderId | STRING       | 1690084460710352       | An ID defined by the client for the order, it will be automatically generated if it is not sent in the request |
| order.orderId       | LONG         | 1470929500342690304    | System-generated order ID (up to 20 characters)                                                                |
| order.transactTime  | LONG         | 1690084460716          | Timestamp in milliseconds                                                                                      |
| order.price         | DECIMAL      | 28000                  | Price                                                                                                          |
| order.origQty       | DECIMAL      | 0.01                   | Quantity                                                                                                       |
| order.executedQty   | DECIMAL      | 0                      | Traded Volume                                                                                                  |
| order.status        | ENUM         | NEW                    | Order status (see enumeration definition for more details)                                                     |
| order.timeInForce   | ENUM         | GTC                    | Duration of the order before expiring                                                                          |
| order.type          | ENUM         | LIMIT                  | Order type (see enumeration definition for more details)                                                       |
| order.side          | ENUM         | BUY                    | BUY or SELL                                                                                                    |
| order.reqAmount     | STRING       | 0                      | Requested Cash amount                                                                                          |
| concentration       | STRING       |                        | Concentration reminder message                                                                                 |

