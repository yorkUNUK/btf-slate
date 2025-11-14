<h3 id="Get-Fund-Statement" class="has-code" style="font-size:24px;font-family:'Helvetica',sans-serif;">
Get Fund Statement
</h3>

<strong style="color:#008756;font-size:1.25em">GET</strong> `https://api-pro.sim.hashkeydev.com/api/v1/account/balanceFlow`

**Weight: 3**

**Request Parameters**

* Only master account Master API key can call this interface, sub-accounts will return insufficient privilege type error code
* All orders returned are final
* Deposit, Withdrawal failed will not be returned
* Query of trade history supports the past 14 days time range(though the endpoint support up to get 7 days data for each request). The other types support maximum 30 days. Exceeded amount will return error code "Exceed maximum time range of N days"
* Remark can only support up to 128 characters

| **PARAMETER** | **TYPE** | **Req'd** | **DESCRIPTION**                                                                                                                                    |
|:--------------|:---------|:----------|:---------------------------------------------------------------------------------------------------------------------------------------------------|
| accountId     | LONG     |           | Account ID                                                                                                                                         |
| type          | STRING   | Y         | Transaction type:<br />"trade"<br />"deposit"<br />"fiatDeposit"<br />"withdraw"<br />"fiatWithdraw"<br />"transfer"<br />"reversal"<br />"refund" |
| clientOrderId | STRING   |           | Corresponds to types: "trade", "withdraw", "fiatWithdraw", "transfer"                                                                              |
| remark        | STRING   |           | Remark                                                                                                                                             |
| startTime     | LONG     | Y         | Start timestamp                                                                                                                                    |
| endTime       | LONG     | Y         | End timestamp                                                                                                                                      |
| beginId       | INT      |           | Start record number. Default: 0<br />E.g. If input ID is 1, return starting ID as 2                                                                |
| limit         | INT      |           | Limit                                                                                                                                              |
| timestamp     | LONG     | Y         | Timestamp                                                                                                                                          |

**Response Content**

**Type = trade**

Supported for the past 7 days time range

```json
[
  {
        "id": "47049",
        "accountId": "1617382306753847296",
        "type": "trade",
        "netBaseAmount": "0.00015",
        "baseCcy": "BTC",
        "baseAssetBalance": "96.53346265",
        "netQuoteAmount": "-9.622275",
        "quoteCcy": "USDC",
        "quoteAssetBalance": "887623.4732212",
        "direction": "BUY",
        "fee": "0.000000225",
        "feeCcy": "BTC",
        "clientOrderId": "99999999980097",
        "orderId": "1733373323360866560",
        "tradeId": "1733373323528638720",
        "transactTime": "1721370202000"  //Trade Completed time
  },
  {
        "id": "47050",
        "accountId": "1617382306753847296",
        "type": "trade",
        "netBaseAmount": "0.29951",
        "baseCcy": "BTC",
        "baseAssetBalance": "96.83297265",
        "netQuoteAmount": "-9984.7019729",
        "quoteCcy": "USD",
        "quoteAssetBalance": "679.337974140649999999",
        "direction": "BUY",
        "fee": "14.97705295935",
        "feeCcy": "USD",
        "clientOrderId": "99999999980098",
        "orderId": "1733374982912741632",
        "tradeId": "1733374983021793536",
        "transactTime": "1721370400000" //Trade Completed time
  }
]
```

| **PARAMETER**          | **TYPE** | **DESCRIPTION**                                                                            |
|:-----------------------|:---------|:-------------------------------------------------------------------------------------------|
| id                     | STRING   | Record ID                                                                                  |
| accountId              | STRING   | Account ID                                                                                 |
| type                   | STRING   | "trade"                                                                                    |
| netBaseAmount          | STRING   | Order Quantity<br />Default Value =""<br />Buy direction (+ve)<br />Sell direction (-ve)   |
| baseCcy                | STRING   | Base currency                                                                              |
| baseAssetBalance       | STRING   | Base asset balance<br />Default Value =""                                                  |
| netQuoteAmount         | STRING   | Price * Quantity<br />Default Value =""<br />Buy direction (-ve)<br />Sell direction (+ve) |
| quoteAssetBalance      | STRING   | Quote asset balance<br />Default Value =""                                                 |
| quoteCcy               | STRING   | E.g. USDT, USDC, USD                                                                       |
| direction              | STRING   | BUY or SELL                                                                                |
| fee                    | STRING   | Trading fee<br />Default Value = 0                                                         |
| feeSupplementaryAmount | STRING   | Supplementary commission fee to meet minimum commission fee requirement                    |
| feeCcy                 | STRING   | E.g. BTC, ETH, USDC                                                                        |
| clientOrderId          | STRING   | Client order ID                                                                            |
| orderId                | STRING   | Order ID                                                                                   |
| tradeId                | STRING   | Trade ID                                                                                   |
| transactTime           | STRING   | Trade completed and settled time  <br /> 结算完成时间                                            |

**Type = fiatDeposit/fiatWithdraw**

Supported for the past 30 days time range

```json
[
  {
    "id": "3",
    "accountId": "1491920242963768578",
    "type": "fiatDeposit",
    "netFiatAmount": "100001",
    "fiatCcy": "USD",
    "fiatBalance": "897400",
    "fee": "0",
    "feeCcy": "USD",
    "orderId": "FD486905037302665216",
    "remark": "",
    "transactTime": "1693895601000"
  },
  {
    "id": "1",
    "accountId": "1491920242963768578",
    "type": "fiatWithdraw",
    "netFiatAmount": "50001",
    "fiatCcy": "USD",
    "fiatBalance": "797399",
    "fee": "0",
    "feeCcy": "USD",
    "orderId": "FW486905166923436032",
    "remark": "",
    "transactTime": "1693895424000"
  }
]
```

| **PARAMETER** | **TYPE** | **DESCRIPTION**                                      |
|:--------------|:---------|:-----------------------------------------------------|
| id            | STRING   | Record ID                                            |
| accountId     | STRING   | Account ID                                           |
| type          | STRING   | "fiatDeposit", "fiatWithdraw"                        |
| netFiatAmount | STRING   | Fiat Deposit/Withdraw: amount<br />Default Value = 0 |
| fiatCcy       | STRING   | E.g. HKD, USD                                        |
| fiatBalance   | STRING   | Fiat balance in the account<br />Default Value = 0   |
| fee           | STRING   | Fee amount                                           |
| feeCcy        | STRING   | Fee Currency                                         |
| orderId       | STRING   | Fiat Order ID                                        |
| remark        | STRING   | Remark                                               |
| transactTime  | STRING   | Fiat Deposit/Withdraw Completed Time                 |

**Type = deposit/withdraw/refund**

Supported for the past 30 days time range

```json
[
  {
    "id": "720",
    "accountId": "1978966613676937217",
    "type": "Deposit",
    "netVaAmount": "8989",
    "vaCcy": "USDT",
    "vaChainType": "Tron",
    "vaBalance": "1030784.1498",
    "fee": "0.0001",
    "feeCcy": "USDT",
    "orderId": "D768973742990266368",
    "txnId": "",
    "remark": "",
    "transactTime": "1761145789691",
    "clientOrderId": ""
  },
  {
    "id": "343",
    "accountId": "1954346749805043457",
    "type": "Withdraw",
    "netVaAmount": "180",
    "vaCcy": "USDT",
    "vaChainType": "Tron",
    "vaBalance": "0",
    "fee": "0",
    "feeCcy": "USDT",
    "orderId": "W769152094447452160",
    "txnId": "3dafba8abd7a7b2d02ac9161b41313931c9bafa18cf8cec2c98b1a4ec300be32",
    "remark": "",
    "transactTime": "1761188210875",
    "clientOrderId": "usdttron102303"
  },
  {
    "id": "335",
    "accountId": "1954346689088298753",
    "type": "Refund",
    "netVaAmount": "100.1199",
    "vaCcy": "USDT",
    "vaChainType": "Tron",
    "vaBalance": "200.2697",
    "fee": "0.0001",
    "feeCcy": "USDT",
    "orderId": "refund_D768944634495336448",
    "txnId": "",
    "remark": "",
    "transactTime": "1761139348000",
    "clientOrderId": ""
  }
]
```

| **PARAMETER** | **TYPE** | **DESCRIPTION**                                    |
|:--------------|:---------|:---------------------------------------------------|
| id            | STRING   | Record ID                                          |
| accountId     | STRING   | Account ID                                         |
| type          | STRING   | "Deposit", "Withdraw", "Refund"                    |
| netVaAmount   | STRING   | Deposit/Withdraw: amount<br />Default Value = 0    |
| vaCcy         | STRING   | ETH, BTC, USDC, etc                                |
| vaChainType   | STRING   | Tron                                               |
| vaBalance     | STRING   | Fiat balance in the account<br />Default Value = 0 |
| fee           | STRING   | Deposit/Withdraw Fee<br />Default Value = 0        |
| feeCcy        | STRING   | Fee Currency                                       |
| clientOrderId | STRING   | The unique ID assigned by the client               |
| orderId       | STRING   | Deposit/Withdraw Order ID                          |
| txnId         | STRING   | Chain Transaction ID                               |
| remark        | STRING   | Remark                                             |
| transactTime  | STRING   | Deposit/Withdraw Completed Time                    |

**Type = transfer**

Supported for the past 30 days time range

```json
[
  {
    "id": "2286",
    "fromAccountId": "1471090223379184385",
    "toAccountId": "1471090223379184384",
    "type": "transfer",
    "netTransferAmount": "1",
    "transferCcy": "BTC",
    "fromAccountBalance": "1304.36501272",
    "toAccountBalance": "6080.570119335",
    "orderId": "1944297063069140480",		// Transfer order ID
    "remark": "",
    "transactTime": "1746514272000",
    "clientOrderId": ""
  },
  {
    "id": "2287",
    "fromAccountId": "1471090223379184385",
    "toAccountId": "1471090223379184384",
    "type": "transfer",
    "netTransferAmount": "1",
    "transferCcy": "BTC",
    "fromAccountBalance": "1303.36501272",
    "toAccountBalance": "6081.570119335",
    "orderId": "1944304593916806656",		// Transfer order ID
    "remark": "",
    "transactTime": "1746515169000",
    "clientOrderId": ""
  }
]
```

| **PARAMETER**      | **TYPE** | **DESCRIPTION**                                      |
|:-------------------|:---------|:-----------------------------------------------------|
| id                 | STRING   | Record ID                                            |
| fromAccountId      | STRING   | From Account ID                                      |
| toAccountId        | STRING   | To Account ID                                        |
| type               | STRING   | "transfer"                                           |
| netTransferAmount  | STRING   | Transfer Amount<br />Default Value = 0               |
| transferCcy        | STRING   | ETH, BTC, USDC, etc                                  |
| fromAccountBalance | STRING   | From Account balance<br />Default Value = 0          |
| toAccountBalance   | STRING   | To Account balance<br />Default Value = 0            |
| orderId            | STRING   | Transfer OrderID                                     |
| remark             | STRING   | Remark                                               |
| transactTime       | STRING   | Transfer Completed Time                              |
| clientOrderId      | STRING   | An ID defined by the client for the withdrawal order |