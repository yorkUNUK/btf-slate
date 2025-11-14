<h3 id="Query-Account-Type" class="has-code" style="font-size:24px;font-family:'Helvetica',sans-serif;">
Query Account Type
</h3>

<strong style="color:#008756;font-size:1.25em">GET</strong> `https://api-pro.sim.hashkeydev.com/api/v1/account/type`

**Account Type**

| accountType | Type                     |
|:------------|:-------------------------|
| 1           | Trading Account          |
| 5           | Custody Account          |
| 6           | Fiat Account             |
| 7           | OPT Account              |
| 9           | Prefund Account          |
| 1           | Sub Main Trading Account |
| 5           | Sub Custody Account      |

**Weight: 5**

**Request Parameters**

| PARAMETER | TYPE | Req'd | Example values      | DESCRIPTION                                                                                                                    |
|-----------|------|-------|---------------------|--------------------------------------------------------------------------------------------------------------------------------|
| timestamp | LONG | Y     |                     | Timestamp                                                                                                                      |

**Response Content**

```json
[
  {
    "accountId": "1954336770171707136",
    "accountLabel": "Main Trading Account",
    "accountType": 1,
    "accountIndex": 0,
    "userId": "1954336770188484352"
  },
  {
    "accountId": "1954336770171707137",
    "accountLabel": "Custody Account",
    "accountType": 5,
    "accountIndex": 0,
    "userId": "1954336770188484352"
  },
  {
    "accountId": "1954336770171707138",
    "accountLabel": "Fiat Account",
    "accountType": 6,
    "accountIndex": 0,
    "userId": "1954336770188484352"
  },
  {
    "accountId": "2076829658620461312",
    "accountLabel": "OPT Account",
    "accountType": 7,
    "accountIndex": 0,
    "userId": "1954336770188484352"
  },
  {
    "accountId": "1954336770171707139",
    "accountLabel": "Prefund Account",
    "accountType": 9,
    "accountIndex": 0,
    "userId": "1954336770188484352"
  },
  {
    "accountId": "1954346689088298752",
    "accountLabel": "Sub Main Trading Account",
    "accountType": 1,
    "accountIndex": 0,
    "userId": "1954346688375497216"
  },
  {
    "accountId": "1954346689088298753",
    "accountLabel": "Sub Custody Account",
    "accountType": 5,
    "accountIndex": 0,
    "userId": "1954346688375497216"
  }
]
```

| **PARAMETER** | **TYPE**     | **Example values**  | **DESCRIPTION**          |
|:--------------|:-------------|:--------------------|:-------------------------|
| *             | Object Array |                     | Query subaccount results |
| accountId     | STRING       | 1954336770171707136 | Account Number           |
| accountLabel  | STRING       | Custody Account     | Account Label            |
| accountType   | INTEGER      | 1                   | Account Type             |
| accountIndex  | INTEGER      | 0                   | //Ignore                 |
| userId        | STRING       | 1954336770188484352 | UserId of the account    |
