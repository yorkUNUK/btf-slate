# REST API

## Get Started

<br>

> REST Sample

```python
import time
import requests
import hashlib
import hmac
import json
from urllib.parse import urlencode, quote

"""
####################################################################################################################################
# Test REST API
#
# Copyright: Hashkey Trading 2024 All rights reserved.
# Please note the API code is provided "As Is" basis, without warranty of any kind, either express or implied, including
# without limitation, warranties that the API code is free of defects, merchantable, non-infringing or fit for a particular purpose
####################################################################################################################################
"""

class RestAPIClient:
    def __init__(self, base_url, user_key, user_secret):
        """
        Initialize the RestAPIClient with base URL, user key, and user secret.

        Args:
            base_url (str): The base URL of the API.
            user_key (str): The user key for authentication.
            user_secret (str): The user secret for authentication.
        """
        self.base_url = base_url
        self.user_key = user_key
        self.user_secret = user_secret
        self.headers = {
            'X-HK-APIKEY': user_key
        }

    def get_timestamp(self):
        """
        Get the current timestamp in milliseconds.

        Returns:
            int: The current timestamp.
        """
        return int(time.time() * 1000)

    def create_signature(self, content):
        """
        Create HMAC signature for authentication.

        Args:
            content (str): The content to be signed.

        Returns:
            str: The HMAC signature.
        """
        content_bytes = content.encode('utf-8')
        hmac_digest = hmac.new(
            self.user_secret.encode('utf-8'),
            content_bytes,
            hashlib.sha256
        ).hexdigest()
        return hmac_digest

    def place_order(self, symbol, side, order_type, quantity, price=None):
        """
        Place an order.

        Args:
            symbol (str): The trading pair symbol (e.g., ETHUSD).
            side (str): The order side (BUY or SELL).
            order_type (str): The order type (LIMIT or MARKET).
            quantity (str): The order quantity.
            price (str, optional): The order price (required for LIMIT orders).

        Returns:
            dict or None: The JSON response if successful, None otherwise.
        """
        timestamp = self.get_timestamp()
        data = {
            "symbol": symbol,
            "side": side,
            "type": order_type,
            "price": price,
            "quantity": quantity,
            "timestamp": timestamp
        }
        if order_type == 'MARKET':
            del data['price']

        data_string = urlencode(data, quote_via=quote)
        signature = self.create_signature(data_string)
        data['signature'] = signature

        response = requests.post(
            f"{self.base_url}/api/v1/spot/order",
            headers=self.headers,
            data=data
        )
        
        if response.status_code == 200:
            response_json = response.json()
            print("Response:")
            print(json.dumps(response_json, indent=4))  # Print formatted JSON response
            return response_json
        else:
            try:
                error_json = response.json()
                print("Error:")
                print(json.dumps(error_json, indent=4))  # Print formatted error response
            except json.JSONDecodeError:
                print(f"Error: {response.status_code} - {response.text}")
            return None

if __name__ == '__main__':
    # Example usage:
    # Create an instance of RestAPIClient with your API credentials
    # For Production please use https://api-pro.hashkey.com
    api_client = RestAPIClient(
        base_url="https://api-pro.sim.hashkeydev.com",
        user_key="your_user_key",
        user_secret="your_user_secret"
    )
    # Place an order with the desired parameters
    api_client.place_order("ETHUSDT", "BUY", "LIMIT", "0.01", "3000")
```

***Sandbox Environment***

* Restful URL: [https://api-pro.sim.hashkeydev.com]

* WebSocket: [wss://stream-pro.sim.hashkeydev.com]

* FIX: [fix-gateway.sim.hashkeydev.com]

*Website:* [hk.sim.hashkeydev.com](https://hk.sim.hashkeydev.com)

***Production Environment***

* Restful URL: [https://api-pro.hashkey.com]

* WebSocket: [wss://stream-pro.hashkey.com/quote/ws/v1]

* FIX: [fix-gateway.hashkey.com]

<br>

***General API Information***

* All **responses** will return a JSON object or array.

* Data is returned in **ascending** order with the earlier data displayed first and subsequent updates appearing later

* All time or timestamp-related variables are measured in milliseconds (ms)

* `HTTP 4XX` error code indicate that the request content is invalid. This typically originates from the client's end.

* `HTTP 429` error code indicates that the request rate limit has been exceeded.

* `HTTP 418` error code when our server have detected the IP address continues to send subsequent requests after receiving `429` error code and is automatically blocked

* `HTTP 5XX` indicates an internal system error. This signifies that the issue originates within the trading system. When addressing this error, it's important not to immediately categorise it as a failed task. The execution status is uncertain, it could potentially be either successful or unsuccessful.

* For **GET** endpoints, parameters must be sent as query strings.

* For **POST**, **PUT**, and **DELETE** endpoints, unless explicitly stated otherwise, parameters must be sent as query strings or in the request body with the content type set to `application/x-www-form-urlencoded`.

* Request Parameters can be sent in any order.

* If there are parameters in both query string and request body, only the parameters of query string will be used.

<br>

***Access Restrictions***

* If any rate limit is violated, a `429` error code will be returned

* Each API endpoint has an associated with a specific weight, and certain endpoints may possess varying weights based on different parameters. Endpoints that consume more resources will have a higher weight assigned to them.

* Upon receiving `429` error code, please take precautionary steps to cease sending requests. API abuse is strictly prohibited

* It is recommended to use Websocket API to obtain corresponding real-time data as much as possible to reduce the traffic of access restrictions caused by frequent API requests.

<br>

***Order Rate Limiting***

* Unless explicitly stated otherwise, each API Key has a default rate limit of 2 requests per second for query-related endpoints, while order-related endpoints allow 10 requests per second.

* When the number of orders exceeds the set limit, a response with an HTTP CODE 429 will be received. Please wait 1 minute for the suspended period to expire.

<br>

***Endpoint Security Types***

* Each endpoint is assigned a security type that determines how you interact with it.

* The API-KEY must be passed in the REST API header as **X-HK-APIKEY**.

* API-KEY and SECRET-KEY are case-sensitive.

* By default, API-KEY have access to all secure endpoints.

<br>

***API-KEY Management***

* Users have to log in the exchange website and apply for an API-KEY, please make sure to remember the following information when creating an API key:
    * **Access key**: API access key
    * **Secret key**: The key used for signature authentication encryption (visible to the application only)

* Users have to assign permissions to API-KEY. There are two kinds of permissions,
    * **READ** read permission is used for data query interfaces such as order query, transaction query, etc.
    * **TRADE** read-write permission is used for order placing, order cancelling, including transfer permission whereby user can transfer between subaccounts under the same main trading account

* Both private REST and WebSocket modes require users to authenticate the transaction through the API-KEY passed in the API header. Refer to the following Authentication chapter for the signature algorithm of the API-KEY.

<aside class="notice">
📘 Please refer to the following URL for Sub-accounts and API Keys management rules: <br />
[https://support.hashkey.com/hc/en-gb/articles/27703184967577-Announcement-on-HashKey-Exchange-s-management-rules-of-sub-accounts-and-API-Keys]
</aside>