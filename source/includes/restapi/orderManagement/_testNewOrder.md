## Order Management

<h3 id="test-new-order" class="has-code" style="font-size:24px;font-family:'Helvetica',sans-serif;">
Test New Order
</h3>

<strong style="color:#0074e1;font-size:1.25em">POST</strong> `https://api-pro.sim.hashkeydev.com/api/v1/spot/orderTest`

**Weight: 1**

The test endpoint is solely to validate the parameters of the new order, it does not send to matching engine

**Request Parameters**

| PARAMETER        | TYPE    | Req'd | DESCRIPTION                                                                                                                 |
|------------------|---------|-------|-----------------------------------------------------------------------------------------------------------------------------|
| symbol           | STRING  | Y     | Name of instrument, e.g. "BTCUSD", "ETHUSD"                                                                                 |
| side             | ENUM    | Y     | BUY or SELL                                                                                                                 |
| type             | ENUM    | Y     | Currently offer 3 order types: <br/>* LIMIT - Limit order<br/>* MARKET - Market order<br/>* LIMIT_MAKER - Maker Limit order |
| quantity         | DECIMAL | Y     | Order amount in units of the instrument. Commonly known as "orderQty"                                                       |
| price            | DECIMAL | C     | Required for LIMIT and LIMIT_MAKER order                                                                                    |
| newClientOrderId | STRING  |       | An ID defined by the client for the order, it will be automatically generated if not sent (up to 255 characters)            |
| timeInForce      | ENUM    |       | GTC for Limit order, Limit maker order and IOC for Market order                                                             |
| recvWindow       | LONG    |       | Recv Window. Default 5000                                                                                                   |
| timestamp        | LONG    | Y     | Timestamp                                                                                                                   |
| stpMode          | ENUM    | C     | Self Trade Prevention Mode. Enum: EXPIRE_TAKER, EXPIRE_MAKER. Default EXPIRE_TAKER if not specified.                        |

**Response Content**

```JSON
{}
```

Empty
