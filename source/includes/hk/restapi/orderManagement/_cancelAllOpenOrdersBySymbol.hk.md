<h3 id="Cancel-All-Open-Orders-By-Symbol" style="font-size:24px;font-family:'Helvetica',sans-serif;">
Cancel All Open Orders by Symbol
</h3>   

<strong style="color:#cb4452;font-size:1.25em;">DELETE</strong> `https://api-pro.sim.hashkeydev.com/api/v1/spot/openOrders`

Cancel all open orders (Same symbol only)

**Weight: 5**

**Upper Limit: 1000 orders/batch**

**Request Parameters**

| **PARAMETER** | **TYPE** | Req'd | Example values | **DESCRIPTION**    |
|---------------|----------|-------|----------------|--------------------|
| symbol        | STRING   | Y     | BTCUSDT        | Currency pair name |
| side          | STRING   |       | BUY            | BUY or SELL        |
| timestamp     | LONG     | Y     | 1714311403031  | Timestamp          |

**Response Content**

```json
{
  "success": true
}
```

| **PARAMETER** | **TYPE** | Example values | **DESCRIPTION**     |
|---------------|----------|----------------|---------------------|
| success       | BOOLEAN  | TRUE           | 	Whether successful |
