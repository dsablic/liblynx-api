
## <a name="resource-account">Account</a>

Stability: `production`



### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **created_at** | *date-time* | when account was created | `"2015-01-01T12:00:00Z"` |
| **id** | *uuid* | unique identifier of account | `"01234567-89ab-cdef-0123-456789abcdef"` |
| **name** | *string* | unique name of account | `"example"` |
| **publisher_reference** | *string* | publisher reference | `"example"` |
| **updated_at** | *date-time* | when account was updated | `"2015-01-01T12:00:00Z"` |

### <a name="link-GET-account-/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}">Account Info</a>

Info for existing account.

```
GET /accounts/{account_id}
```


#### Curl Example

```bash
$ curl -n https://connect.liblynx.com/accounts/$ACCOUNT_ID
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "created_at": "2015-01-01T12:00:00Z",
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "example",
  "publisher_reference": "example",
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
  "accounts": [

  ]
}
```

### <a name="link-PATCH-account-/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}">Account Update</a>

Update an existing account.

```
PATCH /accounts/{account_id}
```


#### Curl Example

```bash
$ curl -n -X PATCH https://connect.liblynx.com/accounts/$ACCOUNT_ID \
  -d '{
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
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "example",
  "publisher_reference": "example",
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


