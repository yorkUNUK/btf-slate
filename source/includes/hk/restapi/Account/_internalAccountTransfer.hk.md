<h3 id="Internal-Account-Transfer" class="has-code" style="font-size:24px;font-family:'Helvetica',sans-serif;">
Internal Account Transfer
</h3>

**_This endpoint should be called no more than once per second._**

<strong style="color:#0074e1;font-size:1.25em">POST</strong> `https://api-pro.sim.hashkeydev.com/api/v1/account/assetTransfer`

**Weight: 1**

Internal asset account transfer. Need to grant the account with "Read/Write Permissioin - Allow internal transfer" authority.

**Request Parameters**

| **PARAMETER** | **TYPE**        | Req 'd | **Example values**  | **DESCRIPTION**                |
|:--------------|:----------------|:-------|:--------------------|:-------------------------------|
| fromAccountId | STRING          | Y      | 1467296062716909568 | Source Account ID              |
| toAccountId   | STRING          | Y      | 1473231491689395200 | Destinate Account ID           |
| coin          | STRING          | Y      | USDT                | Coin                           |
| quantity      | STRING(DECIMAL) | Y      | 20                  | Transfer amount                |
| remark        | STRING          |        | TestingRemark       | Remark                         |
| clientOrderId | STRING          |        | 12345678            | Client unique order identifier |
| timestamp     | LONG            | Y      | 1712317312973       | Timestamp                      |

**Response Content**

```json
{
  "success": true,
  "timestamp": 1716048391349,
  "clientOrderId": "",
  "orderId": "1688730736494914304"
}
```

| **PARAMETER** | **TYPE** | **Example values**  | **DESCRIPTION**                                                      |
|---------------|----------|---------------------|----------------------------------------------------------------------|
| success       | BOOLEAN  | TRUE                | Whether successful                                                   |
| timestamp     | LONG     | 1699943911155       | Transfer completed time                                              |
| clientOrderId | STRING   | 12345678            | Client unique order identifier                                       |
| orderId       | STRING   | 1555687946987836672 | Transfer Order ID<br />(Same as Fund statement orderId for transfer) |
