<h3 id="Get-Fiat-History" class="has-code" style="font-size:24px;font-family:'Helvetica',sans-serif;">
Get Fiat History
</h3>

<strong style="color:#008756;font-size:1.25em">GET</strong> `https://api-pro.sim.hashkeydev.com/api/v1/account/fiat/history`

```java
📘 For Deposit, how to fill `remark` field

If the remark field is required to be included 
in the API response for the deposit order, it 
should be filled in according to the following 
rules when initiating the transfer. 
SCB intra-bank transfers are not supported for now.

1. Enterprise Bank Account Mode 
(For example, Chong Hing Bank), add REF: `/REF:####`

2. Automatic transfer to trading account: 
`/CMD:autoTF_{trading_accountId}_{customer_custom_field}`

3. Transaction remark:
`/MEMO:{customer_custom_field}`

*Chong Hing Bank sample*:
`/REF:H2A6U8/CMD:autoTF_1471090223379184384_customId1/MEMO:customId2`

*ZA/SCB sample*:
`/REF:/CMD:autoTF_1471090223379184384_customId1/MEMO:customId2`

*No Auto transfer, just remark*:
`/REF:/CMD:/MEMO:customId`
```

**Weight: 5**

**Request Parameters**

| **PARAMETER** | **TYPE** | **Req'd** | **DESCRIPTION**                                                                                                                                                       |
|---------------|----------|-----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| type          | STRING   | Y         | "deposit", "withdraw"                                                                                                                                                 |
| status        | STRING   |           | deposit:<br>• "under_review"<br>• "processing"<br>• "successful"<br>• "failed"<br><br>withdraw:<br>• "under_review"<br>• "processing"<br>• "successful"<br>• "failed" |
| startTime     | LONG     | Y         | Start timestamp                                                                                                                                                       |
| endTime       | LONG     | Y         | End timestamp                                                                                                                                                         |
| channel       | STRING   |           | "auto", "manual"; default "auto"<br>For transaction records prior to 2023/9/1 please use manual channel                                                               |
| remark        | STRING   |           | Remark                                                                                                                                                                |
| limit         | INTEGER  |           | Limit                                                                                                                                                                 |
| recvWindow    | LONG     |           | Recv Window                                                                                                                                                           |
| timestamp     | LONG     | Y         | Timestamp                                                                                                                                                             |
| clientOrderId | STRING   |           | Can be used for filtering                                                                                                                                             |

**Response Content**

```json
[
  {
    "orderId": "NFW773922940306722816",
    "type": "withdraw",
    "remark": "/D773922971355262976",
    "asset": "USD",
    "grossAmount": "100",
    "netAmount": "105",
    "fee": "5",
    "status": "successful",
    "createdTime": "1762325607762",
    "updatedTime": "1762841797000",
    "channel": "auto",
    "clientOrderId": "1234567891104aab"
  },
  {
    "orderId": "NFW773588989415469056",
    "type": "withdraw",
    "remark": "/D773589020879171584",
    "asset": "USD",
    "grossAmount": "100",
    "netAmount": "105",
    "fee": "5",
    "status": "successful",
    "createdTime": "1762245987665",
    "updatedTime": "1762842585000",
    "channel": "auto",
    "clientOrderId": "1234567891104aa"
  },
  {
    "orderId": "NFW773570664979443712",
    "type": "withdraw",
    "remark": "/D773570692198510592",
    "asset": "USD",
    "grossAmount": "1000",
    "netAmount": "1005",
    "fee": "5",
    "status": "processing",
    "createdTime": "1762241618778",
    "updatedTime": "1762241625000",
    "channel": "auto",
    "clientOrderId": "1234567891104"
  }
]
```

| **PARAMETER** | **TYPE** | **DESCRIPTION**                                                                                                                                                                                            |
|---------------|----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| orderId       | STRING   | Fiat Order ID, e.g: `NFW730739521377169408`                                                                                                                                                                |
| type          | STRING   | "deposit", "withdraw"                                                                                                                                                                                      |
| remark        | STRING   | Deposit: The remark message from bank deposit                                                                                                                                                              |
| asset         | STRING   | "USD" or "HKD". Fee Asset is the same as the Transaction Asset.                                                                                                                                            |
| grossAmount   | STRING   | Deposit/Withdraw order amount                                                                                                                                                                              |
| netAmount     | STRING   | Actual fund in amount<br>Deposit: grossAmount - fee<br>Withdraw: grossAmount + fee                                                                                                                         |
| fee           | STRING   | Deposit / Withdraw fee                                                                                                                                                                                     |
| status        | STRING   | deposit:<br>• "under_review"<br>• "processing"<br>• "failed"<br>• "successful"<br>• "withdraw_return"<br><br>withdraw:<br>• "under_review"<br>• "processing"<br>• "failed"<br>• "successful"<br>• "return" |
| createdTime   | STRING   | Order Created Timestamp                                                                                                                                                                                    |
| updatedTime   | STRING   | Order Updated Timestamp                                                                                                                                                                                    |
| channel       | STRING   |                                                                                                                                                                                                            |
| clientOrderId | STRING   | Client order ID                                                                                                                                                                                            |