
## <a name="resource-account">Account</a>

Stability: `production`



### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **active** | *boolean* | active | `true` |
| **created_at** | *date-time* | when account was created | `"2015-01-01T12:00:00Z"` |
| **email_domains** | *string* | cr separated email domains | `"*.somedomain.com\nalt.somedomain2.com"` |
| **enable_archimed** | *boolean* | enable archimed | `true` |
| **enable_federated_saml** | *boolean* | enable federated saml | `true` |
| **enable_individual** | *boolean* | enable individual | `true` |
| **enable_ip** | *boolean* | enable ip | `true` |
| **enable_lib_portal_stats** | *boolean* | enable lib portal stats | `true` |
| **enable_library_card** | *boolean* | enable library card | `true` |
| **enable_open_athens** | *boolean* | enable open athens | `true` |
| **enable_pass_code** | *boolean* | enable pass code | `true` |
| **enable_referrer** | *boolean* | enable referrer | `true` |
| **enable_saml** | *boolean* | enable saml | `true` |
| **enable_self_registration** | *boolean* | enable self registration | `true` |
| **enable_shibboleth** | *boolean* | enable shibboleth | `true` |
| **id** | *integer* | unique identifier of account | `42` |
| **individual** | *boolean* | individual | `true` |
| **individual_limit** | *integer* | individual limit | `42` |
| **name** | *string* | unique name of account | `"example"` |
| **publisher_reference** | *string* | publisher reference | `"example"` |
| **shibboleth_entity_id** | *uri* | shibboleth entity id |  |
| **type** | *string* | type | `"example"` |
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
| **active** | *boolean* | active | `true` |
| **email_domains** | *string* | cr separated email domains | `"*.somedomain.com\nalt.somedomain2.com"` |
| **enable_archimed** | *boolean* | enable archimed | `true` |
| **enable_federated_saml** | *boolean* | enable federated saml | `true` |
| **enable_individual** | *boolean* | enable individual | `true` |
| **enable_ip** | *boolean* | enable ip | `true` |
| **enable_lib_portal_stats** | *boolean* | enable lib portal stats | `true` |
| **enable_library_card** | *boolean* | enable library card | `true` |
| **enable_open_athens** | *boolean* | enable open athens | `true` |
| **enable_pass_code** | *boolean* | enable pass code | `true` |
| **enable_referrer** | *boolean* | enable referrer | `true` |
| **enable_saml** | *boolean* | enable saml | `true` |
| **enable_self_registration** | *boolean* | enable self registration | `true` |
| **enable_shibboleth** | *boolean* | enable shibboleth | `true` |
| **individual** | *boolean* | individual | `true` |
| **individual_limit** | *integer* | individual limit | `42` |
| **publisher_reference** | *string* | publisher reference | `"example"` |
| **shibboleth_entity_id** | *uri* | shibboleth entity id |  |
| **type** | *string* | type | `"example"` |


#### Curl Example

```bash
$ curl -n -X POST https://connect.liblynx.com/api/accounts \
  -d '{
  "account_name": "example",
  "publisher_reference": "example",
  "email_domains": "*.somedomain.com\nalt.somedomain2.com",
  "enable_saml": true,
  "enable_federated_saml": true,
  "enable_shibboleth": true,
  "shibboleth_entity_id": "example",
  "enable_ip": true,
  "enable_pass_code": true,
  "enable_referrer": true,
  "enable_library_card": true,
  "enable_individual": true,
  "enable_open_athens": true,
  "enable_archimed": true,
  "active": true,
  "enable_self_registration": true,
  "enable_lib_portal_stats": true,
  "individual_limit": 42,
  "individual": true,
  "type": "example"
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
  "enable_federated_saml": true,
  "enable_shibboleth": true,
  "email_domains": "*.somedomain.com\nalt.somedomain2.com",
  "updated_at": "2015-01-01T12:00:00Z",
  "shibboleth_entity_id": "example",
  "enable_ip": true,
  "enable_pass_code": true,
  "enable_referrer": true,
  "enable_library_card": true,
  "enable_individual": true,
  "enable_open_athens": true,
  "enable_archimed": true,
  "active": true,
  "enable_self_registration": true,
  "enable_lib_portal_stats": true,
  "individual_limit": 42,
  "individual": true,
  "type": "example"
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
  "enable_federated_saml": true,
  "enable_shibboleth": true,
  "email_domains": "*.somedomain.com\nalt.somedomain2.com",
  "updated_at": "2015-01-01T12:00:00Z",
  "shibboleth_entity_id": "example",
  "enable_ip": true,
  "enable_pass_code": true,
  "enable_referrer": true,
  "enable_library_card": true,
  "enable_individual": true,
  "enable_open_athens": true,
  "enable_archimed": true,
  "active": true,
  "enable_self_registration": true,
  "enable_lib_portal_stats": true,
  "individual_limit": 42,
  "individual": true,
  "type": "example"
}
```

### <a name="link-GET-account-/api/accounts">Account List</a>

List existing accounts.

```
GET /api/accounts
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **page** | *integer* | page number | `42` |
| **perpage** | *integer* | page size | `42` |


#### Curl Example

```bash
$ curl -n https://connect.liblynx.com/api/accounts
 -G \
  -d perpage=42 \
  -d page=42
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "accounts": [
    {
      "id": 42,
      "account_name": "example",
      "individual": true,
      "active": true,
      "publisher_reference": "example",
      "type": "example",
      "modified_date": "2015-01-01T12:00:00Z",
      "creation_date": "2015-01-01T12:00:00Z"
    }
  ]
}
```

### <a name="link-PUT-account-/api/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}">Account Update</a>

Update an existing account.

```
PUT /api/accounts/{account_id}
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **account_name** | *string* | unique name of account | `"example"` |
| **active** | *boolean* | active | `true` |
| **email_domains** | *string* | cr separated email domains | `"*.somedomain.com\nalt.somedomain2.com"` |
| **enable_archimed** | *boolean* | enable archimed | `true` |
| **enable_federated_saml** | *boolean* | enable federated saml | `true` |
| **enable_individual** | *boolean* | enable individual | `true` |
| **enable_ip** | *boolean* | enable ip | `true` |
| **enable_lib_portal_stats** | *boolean* | enable lib portal stats | `true` |
| **enable_library_card** | *boolean* | enable library card | `true` |
| **enable_open_athens** | *boolean* | enable open athens | `true` |
| **enable_pass_code** | *boolean* | enable pass code | `true` |
| **enable_referrer** | *boolean* | enable referrer | `true` |
| **enable_saml** | *boolean* | enable saml | `true` |
| **enable_self_registration** | *boolean* | enable self registration | `true` |
| **enable_shibboleth** | *boolean* | enable shibboleth | `true` |
| **individual** | *boolean* | individual | `true` |
| **individual_limit** | *integer* | individual limit | `42` |
| **publisher_reference** | *string* | publisher reference | `"example"` |
| **shibboleth_entity_id** | *uri* | shibboleth entity id |  |
| **type** | *string* | type | `"example"` |


#### Curl Example

```bash
$ curl -n -X PUT https://connect.liblynx.com/api/accounts/$ACCOUNT_ID \
  -d '{
  "account_name": "example",
  "publisher_reference": "example",
  "email_domains": "*.somedomain.com\nalt.somedomain2.com",
  "enable_saml": true,
  "enable_federated_saml": true,
  "enable_shibboleth": true,
  "shibboleth_entity_id": "example",
  "enable_ip": true,
  "enable_pass_code": true,
  "enable_referrer": true,
  "enable_library_card": true,
  "enable_individual": true,
  "enable_open_athens": true,
  "enable_archimed": true,
  "active": true,
  "enable_self_registration": true,
  "enable_lib_portal_stats": true,
  "individual_limit": 42,
  "individual": true,
  "type": "example"
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
  "enable_federated_saml": true,
  "enable_shibboleth": true,
  "email_domains": "*.somedomain.com\nalt.somedomain2.com",
  "updated_at": "2015-01-01T12:00:00Z",
  "shibboleth_entity_id": "example",
  "enable_ip": true,
  "enable_pass_code": true,
  "enable_referrer": true,
  "enable_library_card": true,
  "enable_individual": true,
  "enable_open_athens": true,
  "enable_archimed": true,
  "active": true,
  "enable_self_registration": true,
  "enable_lib_portal_stats": true,
  "individual_limit": 42,
  "individual": true,
  "type": "example"
}
```


## <a name="resource-federatedsamlidp">Federatedsamlidp</a>

Stability: `production`



### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **entity_id** | *string* | entity_id | `"example"` |
| **id** | *integer* | unique identifier of federatedsamlidp | `42` |
| **organization_id** | *string* | organization_id | `"example"` |

### <a name="link-POST-federatedsamlidp-/api/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}/federatedsamlidps">Federatedsamlidp Create</a>

Create a new federatedsamlidp.

```
POST /api/accounts/{account_id}/federatedsamlidps
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **entity_id** | *string* | entity_id | `"example"` |



#### Curl Example

```bash
$ curl -n -X POST https://connect.liblynx.com/api/accounts/$ACCOUNT_ID/federatedsamlidps \
  -d '{
  "entity_id": "example"
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
  "organization_id": "example",
  "entity_id": "example"
}
```

### <a name="link-DELETE-federatedsamlidp-/api/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}/federatedsamlidps/{(%23%2Fdefinitions%2Ffederatedsamlidp%2Fdefinitions%2Fidentity)}">Federatedsamlidp Delete</a>

Delete an existing federatedsamlidp.

```
DELETE /api/accounts/{account_id}/federatedsamlidps/{federatedsamlidp_id}
```


#### Curl Example

```bash
$ curl -n -X DELETE https://connect.liblynx.com/api/accounts/$ACCOUNT_ID/federatedsamlidps/$FEDERATEDSAMLIDP_ID \
  -H "Content-Type: application/json"
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
null
```

### <a name="link-GET-federatedsamlidp-/api/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}/federatedsamlidps/{(%23%2Fdefinitions%2Ffederatedsamlidp%2Fdefinitions%2Fidentity)}">Federatedsamlidp Info</a>

Info for existing federatedsamlidp.

```
GET /api/accounts/{account_id}/federatedsamlidps/{federatedsamlidp_id}
```


#### Curl Example

```bash
$ curl -n https://connect.liblynx.com/api/accounts/$ACCOUNT_ID/federatedsamlidps/$FEDERATEDSAMLIDP_ID
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": 42,
  "organization_id": "example",
  "entity_id": "example"
}
```

### <a name="link-GET-federatedsamlidp-/api/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}/federatedsamlidps">Federatedsamlidp List</a>

List existing federatedsamlidps.

```
GET /api/accounts/{account_id}/federatedsamlidps
```


#### Curl Example

```bash
$ curl -n https://connect.liblynx.com/api/accounts/$ACCOUNT_ID/federatedsamlidps
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "federatedsamlidps": [
    {
      "id": 42,
      "organization_id": "example",
      "entity_id": "example"
    }
  ]
}
```


## <a name="resource-identification">Identification</a>

Stability: `production`



### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **authorizations** | *array* | authorizations |  |
| **created** | *date-time* | when identification was created | `"2015-01-01T12:00:00Z"` |
| **force_sso_login** | *boolean* | force sso login | `true` |
| **id** | *uuid* | unique identifier of identification | `"01234567-89ab-cdef-0123-456789abcdef"` |
| **ip** | *ipv4* | ip address | `"192.0.2.1"` |
| **publisher:id** | *integer* |  | `42` |
| **publisher:publisher_name** | *string* |  | `"example"` |
| **status** | *string* | status | `"example"` |
| **target_account:account_name** | *string* |  | `"example"` |
| **target_account:id** | *integer* |  | `42` |
| **target_account:individual** | *boolean* |  | `true` |
| **target_account:publisher_reference** | *string* |  | `"example"` |
| **target_account:type** | *string* |  | `"example"` |
| **terms** | *string* | terms | `"example"` |
| **unit_requests** | *array* | unit requests |  |
| **url** | *uri* | callback url |  |
| **user_agent** | *string* | user agent | `"example"` |
| **user_institution:account_name** | *string* |  | `"example"` |
| **user_institution:country_code** | *string* |  | `"example"` |
| **user_institution:id** | *integer* |  | `42` |
| **user_institution:type** | *string* |  | `"example"` |

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
| **force_sso_login** | *boolean* | force sso login | `true` |


#### Curl Example

```bash
$ curl -n -X POST https://connect.liblynx.com/api/identifications \
  -d '{
  "email": "username@example.com",
  "ip": "192.0.2.1",
  "user_agent": "example",
  "url": "example",
  "force_sso_login": true
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
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "url": "example",
  "ip": "192.0.2.1",
  "status": "example",
  "terms": "example",
  "authorizations": null,
  "unit_requests": null,
  "publisher": {
    "id": 42,
    "publisher_name": "example"
  },
  "user_agent": "example",
  "user_institution": {
    "id": 42,
    "account_name": "example",
    "country_code": "example",
    "type": "example"
  },
  "target_account": {
    "id": 42,
    "account_name": "example",
    "individual": true,
    "type": "example",
    "publisher_reference": "example"
  },
  "force_sso_login": true
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
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "url": "example",
  "ip": "192.0.2.1",
  "status": "example",
  "terms": "example",
  "authorizations": null,
  "unit_requests": null,
  "publisher": {
    "id": 42,
    "publisher_name": "example"
  },
  "user_agent": "example",
  "user_institution": {
    "id": 42,
    "account_name": "example",
    "country_code": "example",
    "type": "example"
  },
  "target_account": {
    "id": 42,
    "account_name": "example",
    "individual": true,
    "type": "example",
    "publisher_reference": "example"
  },
  "force_sso_login": true
}
```


## <a name="resource-idp">idp</a>

Stability: `production`



### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **entity_id** | *string* | shibboleth entity id | `"example"` |
| **logo_small_size** | *string* | logo size (WxH) | `"example"` |
| **logo_small_url** | *string* | logo url | `"example"` |
| **name** | *string* | name of the institution | `"example"` |

### <a name="link-GET-idp-/api/idps">idp List</a>

List shibboleth idps.

```
GET /api/idps
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **page** | *integer* | page number | `42` |
| **perpage** | *integer* | page size | `42` |
| **q** | *string* | query string | `"example"` |


#### Curl Example

```bash
$ curl -n https://connect.liblynx.com/api/idps
 -G \
  -d q=example \
  -d perpage=42 \
  -d page=42
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "idps": [
    {
      "name": "example",
      "entity_id": "example",
      "logo_small_url": "example",
      "logo_small_size": "example"
    }
  ]
}
```


## <a name="resource-samlidp">Samlidp</a>

Stability: `production`



### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **descriptor_url** | *string* | saml descriptor url | `"example"` |
| **entity_id** | *string* | entity_id | `"example"` |
| **id** | *integer* | unique identifier of samlidp | `42` |
| **type** | *string* | type | `"example"` |
| **xml_descriptor** | *string* | xml descriptor | `"example"` |

### <a name="link-POST-samlidp-/api/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}/samlidps">Samlidp Create</a>

Create a new samlidp.

```
POST /api/accounts/{account_id}/samlidps
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **descriptor_url** | *string* | saml descriptor url | `"example"` |



#### Curl Example

```bash
$ curl -n -X POST https://connect.liblynx.com/api/accounts/$ACCOUNT_ID/samlidps \
  -d '{
  "descriptor_url": "example"
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
  "descriptor_url": "example",
  "xml_descriptor": "example",
  "type": "example",
  "entity_id": "example"
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
null
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
  "descriptor_url": "example",
  "xml_descriptor": "example",
  "type": "example",
  "entity_id": "example"
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
{
  "samlidps": [
    {
      "id": 42,
      "descriptor_url": "example",
      "xml_descriptor": "example",
      "type": "example",
      "entity_id": "example"
    }
  ]
}
```


## <a name="resource-token">OAuth2 token</a>

Stability: `production`



### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **account_token** | *string* | unique identifier of identification | `"example"` |

### <a name="link-POST-token-/oauth/v2/token">OAuth2 token Create</a>

Create a new oauth2 token

```
POST /oauth/v2/token
```

#### Required Parameters

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


