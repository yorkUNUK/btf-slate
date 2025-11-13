## Account

<h3 id="Get-VIP-Info" class="has-code" style="font-size:24px;font-family:'Helvetica',sans-serif;">
Get VIP Information
</h3>

<strong style="color:#008756;font-size:1.25em">GET</strong> `https://api-pro.sim.hashkeydev.com/api/v1/account/vipInfo`

**Weight: 5**

Retrieve VIP Level and Trading fee rates

**Request Parameters**

| PARAMETER | TYPE   | Req'd | Example values | DESCRIPTION   |
|-----------|--------|-------|----------------|---------------|
| symbols   | STRING | Y     | USDTUSD,XRPUSD | Trading pairs |
| timestamp | LONG   | Y     |                | Timestamp     |

**Response Content**

```json
{
  "code": 0,
  "vipLevel": "0",
  "tradeVol30Day": "0",
  "totalAssetBal": "0",
  "data": [
    {
      "symbol": "USDTUSD",
      "productType": "Token-Fiat",
      "buyMakerFeeCurrency": "USD",
      "buyTakerFeeCurrency": "USD",
      "sellMakerFeeCurrency": "USD",
      "sellTakerFeeCurrency": "USD",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "BTCUSDC",
      "productType": "Token-Token",
      "buyMakerFeeCurrency": "BTC",
      "buyTakerFeeCurrency": "BTC",
      "sellMakerFeeCurrency": "USDC",
      "sellTakerFeeCurrency": "USDC",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "COMPUSD",
      "productType": "Token-Fiat",
      "buyMakerFeeCurrency": "USD",
      "buyTakerFeeCurrency": "USD",
      "sellMakerFeeCurrency": "USD",
      "sellTakerFeeCurrency": "USD",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "AVAXUSD",
      "productType": "Token-Fiat",
      "buyMakerFeeCurrency": "USD",
      "buyTakerFeeCurrency": "USD",
      "sellMakerFeeCurrency": "USD",
      "sellTakerFeeCurrency": "USD",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "BTCUSD",
      "productType": "Token-Fiat",
      "buyMakerFeeCurrency": "USD",
      "buyTakerFeeCurrency": "USD",
      "sellMakerFeeCurrency": "USD",
      "sellTakerFeeCurrency": "USD",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "USDTHKD",
      "productType": "Token-Fiat",
      "buyMakerFeeCurrency": "HKD",
      "buyTakerFeeCurrency": "HKD",
      "sellMakerFeeCurrency": "HKD",
      "sellTakerFeeCurrency": "HKD",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "AAVEUSD",
      "productType": "Token-Fiat",
      "buyMakerFeeCurrency": "USD",
      "buyTakerFeeCurrency": "USD",
      "sellMakerFeeCurrency": "USD",
      "sellTakerFeeCurrency": "USD",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "ETHUSD",
      "productType": "Token-Fiat",
      "buyMakerFeeCurrency": "USD",
      "buyTakerFeeCurrency": "USD",
      "sellMakerFeeCurrency": "USD",
      "sellTakerFeeCurrency": "USD",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "BTCHKD",
      "productType": "Token-Fiat",
      "buyMakerFeeCurrency": "HKD",
      "buyTakerFeeCurrency": "HKD",
      "sellMakerFeeCurrency": "HKD",
      "sellTakerFeeCurrency": "HKD",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "ETHUSDC",
      "productType": "Token-Token",
      "buyMakerFeeCurrency": "ETH",
      "buyTakerFeeCurrency": "ETH",
      "sellMakerFeeCurrency": "USDC",
      "sellTakerFeeCurrency": "USDC",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "BTCUSDT",
      "productType": "Token-Token",
      "buyMakerFeeCurrency": "BTC",
      "buyTakerFeeCurrency": "BTC",
      "sellMakerFeeCurrency": "USDT",
      "sellTakerFeeCurrency": "USDT",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "DOTUSD",
      "productType": "Token-Fiat",
      "buyMakerFeeCurrency": "USD",
      "buyTakerFeeCurrency": "USD",
      "sellMakerFeeCurrency": "USD",
      "sellTakerFeeCurrency": "USD",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "MKRUSD",
      "productType": "Token-Fiat",
      "buyMakerFeeCurrency": "USD",
      "buyTakerFeeCurrency": "USD",
      "sellMakerFeeCurrency": "USD",
      "sellTakerFeeCurrency": "USD",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "RNDRUSD",
      "productType": "Token-Fiat",
      "buyMakerFeeCurrency": "USD",
      "buyTakerFeeCurrency": "USD",
      "sellMakerFeeCurrency": "USD",
      "sellTakerFeeCurrency": "USD",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "ETHUSDT",
      "productType": "Token-Token",
      "buyMakerFeeCurrency": "ETH",
      "buyTakerFeeCurrency": "ETH",
      "sellMakerFeeCurrency": "USDT",
      "sellTakerFeeCurrency": "USDT",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "LTCUSD",
      "productType": "Token-Fiat",
      "buyMakerFeeCurrency": "USD",
      "buyTakerFeeCurrency": "USD",
      "sellMakerFeeCurrency": "USD",
      "sellTakerFeeCurrency": "USD",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "MATICUSD",
      "productType": "Token-Fiat",
      "buyMakerFeeCurrency": "USD",
      "buyTakerFeeCurrency": "USD",
      "sellMakerFeeCurrency": "USD",
      "sellTakerFeeCurrency": "USD",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "UNIUSD",
      "productType": "Token-Fiat",
      "buyMakerFeeCurrency": "USD",
      "buyTakerFeeCurrency": "USD",
      "sellMakerFeeCurrency": "USD",
      "sellTakerFeeCurrency": "USD",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "USDTUSDC",
      "productType": "Token-Token",
      "buyMakerFeeCurrency": "USDT",
      "buyTakerFeeCurrency": "USDT",
      "sellMakerFeeCurrency": "USDC",
      "sellTakerFeeCurrency": "USDC",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "DYDXUSD",
      "productType": "Token-Fiat",
      "buyMakerFeeCurrency": "USD",
      "buyTakerFeeCurrency": "USD",
      "sellMakerFeeCurrency": "USD",
      "sellTakerFeeCurrency": "USD",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "LINKUSD",
      "productType": "Token-Fiat",
      "buyMakerFeeCurrency": "USD",
      "buyTakerFeeCurrency": "USD",
      "sellMakerFeeCurrency": "USD",
      "sellTakerFeeCurrency": "USD",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "SPICEUSDC",
      "productType": "ST-Token",
      "buyMakerFeeCurrency": "USDC",
      "buyTakerFeeCurrency": "USDC",
      "sellMakerFeeCurrency": "USDC",
      "sellTakerFeeCurrency": "USDC",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "ETHHKD",
      "productType": "Token-Fiat",
      "buyMakerFeeCurrency": "HKD",
      "buyTakerFeeCurrency": "HKD",
      "sellMakerFeeCurrency": "HKD",
      "sellTakerFeeCurrency": "HKD",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "ATOMUSD",
      "productType": "Token-Fiat",
      "buyMakerFeeCurrency": "USD",
      "buyTakerFeeCurrency": "USD",
      "sellMakerFeeCurrency": "USD",
      "sellTakerFeeCurrency": "USD",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "LDOUSD",
      "productType": "Token-Fiat",
      "buyMakerFeeCurrency": "USD",
      "buyTakerFeeCurrency": "USD",
      "sellMakerFeeCurrency": "USD",
      "sellTakerFeeCurrency": "USD",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    },
    {
      "symbol": "SNXUSD",
      "productType": "Token-Fiat",
      "buyMakerFeeCurrency": "USD",
      "buyTakerFeeCurrency": "USD",
      "sellMakerFeeCurrency": "USD",
      "sellTakerFeeCurrency": "USD",
      "actualMakerRate": "0.0015",
      "actualTakerRate": "0.0015"
    }
  ],
  "updateTimestamp": "1709330424013"
}
```

| **PARAMETER**          | **TYPE**     | Example values | **DESCRIPTION**                                  |
|------------------------|--------------|----------------|--------------------------------------------------|
| code                   | INTEGER      | 0              | Status code                                      |
| msg                    | STRING       |                | Error message (if any)                           |
| vipLevel               | STRING       | 0              | VIP Level                                        |
| tradeVol30Day          | STRING       | 300000000      | Total trading volume in Last 30 days (USD)       |
| totalAssetBal          | STRING       | 1000000000     | Total asset balance (USD)                        |
| data                   | Object Array |                |                                                  |
| - productType          | STRING       | Token-Token    | Token-Token, Token-Fiat, ST-Token                |
| - buyMakerFeeCurrency  | STRING       | BTC            | Buy maker fee currency                           |
| - buyTakerFeeCurrency  | STRING       | BTC            | Buy taker fee currency                           |
| - sellMakerFeeCurrency | STRING       | USD            | Sell maker fee currency                          |
| - sellTakerFeeCurrency | STRING       | USD            | Sell taker fee currency                          |
| - actualMakerRate      | STRING       | 0.015          | Maker fee including any discount                 |
| - actualTakerRate      | STRING       | 0.015          | Taker fee including any discount                 |
| updateTimeStamp        | STRING       | 1709330424013  | Update timestamp of the request (Daily snapshot) |

