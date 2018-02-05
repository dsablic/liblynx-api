
## <a name="resource-account">Account</a>

Stability: `production`



### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **created_at** | *date-time* | when account was created | `"2015-01-01T12:00:00Z"` |
| **email_domains** | *string* | cr separated email domains | `"*.somedomain.com\nalt.somedomain2.com"` |
| **enable_saml** | *boolean* | saml enabled | `true` |
| **enable_shibboleth** | *boolean* | shibboleth enabled | `true` |
| **id** | *integer* | unique identifier of account | `42` |
| **name** | *string* | unique name of account | `"example"` |
| **publisher_reference** | *string* | publisher reference | `"example"` |
| **updated_at** | *date-time* | when account was updated | `"2015-01-01T12:00:00Z"` |

### <a name="link-POST-account-/api/accounts">Account Create</a>

Create a new account.

```
POST /api/accounts
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **account_name** | *string* | unique name of account | `"example"` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **email_domains** | *string* | cr separated email domains | `"*.somedomain.com\nalt.somedomain2.com"` |
| **enable_saml** | *boolean* | saml enabled | `true` |
| **enable_shibboleth** | *boolean* | shibboleth enabled | `true` |
| **publisher_reference** | *string* | publisher reference | `"example"` |


#### Curl Example

```bash
$ curl -n -X POST https://connect.liblynx.com/api/accounts \
  -d '{
  "account_name": "example",
  "publisher_reference": "example",
  "email_domains": "*.somedomain.com\nalt.somedomain2.com",
  "enable_saml": true,
  "enable_shibboleth": true
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
{
  "created_at": "2015-01-01T12:00:00Z",
  "id": 42,
  "name": "example",
  "publisher_reference": "example",
  "enable_saml": true,
  "enable_shibboleth": true,
  "email_domains": "*.somedomain.com\nalt.somedomain2.com",
  "updated_at": "2015-01-01T12:00:00Z"
}
```

### <a name="link-DELETE-account-/api/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}">Account Delete</a>

Delete an existing account.

```
DELETE /api/accounts/{account_id}
```


#### Curl Example

```bash
$ curl -n -X DELETE https://connect.liblynx.com/api/accounts/$ACCOUNT_ID \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```

### <a name="link-GET-account-/api/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}">Account Info</a>

Info for existing account.

```
GET /api/accounts/{account_id}
```


#### Curl Example

```bash
$ curl -n https://connect.liblynx.com/api/accounts/$ACCOUNT_ID
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "created_at": "2015-01-01T12:00:00Z",
  "id": 42,
  "name": "example",
  "publisher_reference": "example",
  "enable_saml": true,
  "enable_shibboleth": true,
  "email_domains": "*.somedomain.com\nalt.somedomain2.com",
  "updated_at": "2015-01-01T12:00:00Z"
}
```

### <a name="link-GET-account-/api/accounts">Account List</a>

List existing accounts.

```
GET /api/accounts
```


#### Curl Example

```bash
$ curl -n https://connect.liblynx.com/api/accounts
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "accounts": {
    "id": 42,
    "account_name": "example",
    "publisher_reference": "example",
    "email_domains": "*.somedomain.com\nalt.somedomain2.com",
    "enable_saml": true,
    "enable_shibboleth": true
  }
}
```

### <a name="link-PUT-account-/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}">Account Update</a>

Update an existing account.

```
PUT /accounts/{account_id}
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **account_name** | *string* | unique name of account | `"example"` |
| **email_domains** | *string* | cr separated email domains | `"*.somedomain.com\nalt.somedomain2.com"` |
| **enable_saml** | *boolean* | saml enabled | `true` |
| **enable_shibboleth** | *boolean* | shibboleth enabled | `true` |
| **publisher_reference** | *string* | publisher reference | `"example"` |


#### Curl Example

```bash
$ curl -n -X PUT https://connect.liblynx.com/accounts/$ACCOUNT_ID \
  -d '{
  "account_name": "example",
  "publisher_reference": "example",
  "email_domains": "*.somedomain.com\nalt.somedomain2.com",
  "enable_saml": true,
  "enable_shibboleth": true
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "created_at": "2015-01-01T12:00:00Z",
  "id": 42,
  "name": "example",
  "publisher_reference": "example",
  "enable_saml": true,
  "enable_shibboleth": true,
  "email_domains": "*.somedomain.com\nalt.somedomain2.com",
  "updated_at": "2015-01-01T12:00:00Z"
}
```


## <a name="resource-identification">Identification</a>

Stability: `production`



### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **created** | *date-time* | when identification was created | `"2015-01-01T12:00:00Z"` |
| **id** | *uuid* | unique identifier of identification | `"01234567-89ab-cdef-0123-456789abcdef"` |

### <a name="link-POST-identification-/api/identifications">Identification Create</a>

create a new identification resource to try and identify an account to link a new session with

```
POST /api/identifications
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **ip** | *ipv4* | ip address | `"192.0.2.1"` |
| **url** | *uri* | callback url |  |
| **user_agent** | *string* | user agent | `"example"` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **email** | *email* | user email address | `"username@example.com"` |


#### Curl Example

```bash
$ curl -n -X POST https://connect.liblynx.com/api/identifications \
  -d '{
  "email": "username@example.com",
  "ip": "192.0.2.1",
  "user_agent": "example",
  "url": "example"
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
{
  "created": "2015-01-01T12:00:00Z",
  "id": "01234567-89ab-cdef-0123-456789abcdef"
}
```

### <a name="link-GET-identification-/api/identifications/{(%23%2Fdefinitions%2Fidentification%2Fdefinitions%2Fidentity)}">Identification Info</a>

retrieve a single identification object

```
GET /api/identifications/{identification_id}
```


#### Curl Example

```bash
$ curl -n https://connect.liblynx.com/api/identifications/$IDENTIFICATION_ID
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "created": "2015-01-01T12:00:00Z",
  "id": "01234567-89ab-cdef-0123-456789abcdef"
}
```


## <a name="resource-samlidp">Samlidp</a>

Stability: `production`



### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **descriptor_url** | *string* | saml descriptor url | `"example"` |
| **id** | *integer* | unique identifier of samlidp | `42` |

### <a name="link-POST-samlidp-/api/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}/samlidps">Samlidp Create</a>

Create a new samlidp.

```
POST /api/accounts/{account_id}/samlidps
```


#### Curl Example

```bash
$ curl -n -X POST https://connect.liblynx.com/api/accounts/$ACCOUNT_ID/samlidps \
  -d '{
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
{
  "id": 42,
  "descriptor_url": "example"
}
```

### <a name="link-DELETE-samlidp-/api/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}/samlidps/{(%23%2Fdefinitions%2Fsamlidp%2Fdefinitions%2Fidentity)}">Samlidp Delete</a>

Delete an existing samlidp.

```
DELETE /api/accounts/{account_id}/samlidps/{samlidp_id}
```


#### Curl Example

```bash
$ curl -n -X DELETE https://connect.liblynx.com/api/accounts/$ACCOUNT_ID/samlidps/$SAMLIDP_ID \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": 42,
  "descriptor_url": "example"
}
```

### <a name="link-GET-samlidp-/api/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}/samlidps/{(%23%2Fdefinitions%2Fsamlidp%2Fdefinitions%2Fidentity)}">Samlidp Info</a>

Info for existing samlidp.

```
GET /api/accounts/{account_id}/samlidps/{samlidp_id}
```


#### Curl Example

```bash
$ curl -n https://connect.liblynx.com/api/accounts/$ACCOUNT_ID/samlidps/$SAMLIDP_ID
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": 42,
  "descriptor_url": "example"
}
```

### <a name="link-GET-samlidp-/api/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}/samlidps">Samlidp List</a>

List existing samlidps.

```
GET /api/accounts/{account_id}/samlidps
```


#### Curl Example

```bash
$ curl -n https://connect.liblynx.com/api/accounts/$ACCOUNT_ID/samlidps
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "id": 42,
    "descriptor_url": "example"
  }
]
```


## <a name="resource-token">OAuth2 token</a>

Stability: `production`



### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **account_token** | *string* | unique identifier of identification | `"example"` |
| **grant_type** | *string* | grant_type | `"client_credentials"` |

### <a name="link-POST-token-/oauth/v2/token">OAuth2 token Create</a>

Create a new oauth2 token

```
POST /oauth/v2/token
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **grant_type** | *string* | grant_type | `"client_credentials"` |


#### Curl Example

```bash
$ curl -n -X POST https://connect.liblynx.com/oauth/v2/token \
  -d '{
  "grant_type": "client_credentials"
}' \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
{
  "account_token": "example"
}
```


