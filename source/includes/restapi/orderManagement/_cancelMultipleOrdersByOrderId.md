<h3 id="Cancel-Multiple-Orders-By-OrderId" style="font-size:24px;font-family:'Helvetica',sans-serif;">
Cancel Multiple Orders By OrderId
</h3>   

<strong style="color:#cb4452;font-size:1.25em;">DELETE</strong> `https://api-pro.sim.hashkeydev.com/api/v1/spot/cancelOrderByIds`

Cancel orders in batches according to order IDs (Maximum of 100 orders in a single batch)

<aside class="notice">
    📘 Note: A return code of 0 from the code indicates that the cancel order request has been executed. To determine if it was successful, you need to check the results in the result field. If the result is null, it means all were successful. If it is non empty, the orderId represents the ID of the order that failed to cancel, and code represents the reason for the cancellation failure.
</aside>

**Weight: 5**

**Upper Limit: 100 orders/batch**

**Request Parameters**

| **PARAMETER** | **TYPE** | Req'd | Example values                        | **DESCRIPTION**                |
|---------------|----------|-------|---------------------------------------|--------------------------------|
| ids           | STRING   | Y     | 202212231234567895,202212231234567896 | Order id (multiple, separated) |
| timestamp     | LONG     | Y     | 1714311403031                         | Timestamp                      |

**Response Content**

> Success

```json
{
  "code": "0000",
  "result": []
}
```

> Certain error happened

```json
{
  "code": "0000",
  "result": [
    {
      "orderId": "1507155386372816640",
      "code": "0211"
    },
    {
      "orderId": "1507155487740667904",
      "code": "0211"
    }
  ]
}
```

| **PARAMETER**   | **TYPE**     | Example values    | **DESCRIPTION**                                           |
|-----------------|--------------|-------------------|-----------------------------------------------------------|
| code            | STRING       | 0000              | 	0000 means request is executed                           |
| result          | Object Array |                   |                                                           |
| result.orderId	 | STRING       | 16880363408511681 | Order ID                                                  |
| result.code	    | STRING       | 0211              | Return error code for each order (For unsuccessful order) |
