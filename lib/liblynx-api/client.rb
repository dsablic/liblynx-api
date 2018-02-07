# encoding: utf-8
# frozen_string_literal: true

#
# WARNING: Do not edit by hand, this file was generated by Heroics:
#
#   https://github.com/interagent/heroics
#

require 'heroics'
require 'uri'
require 'moneta'

module LibLynxAPI
  # Get a Client configured to use HTTP Basic or header-based authentication.
  #
  # @param api_key [String] The API key to use when connecting.
  # @param options [Hash<Symbol,String>] Optionally, custom settings
  #   to use with the client.  Allowed options are `default_headers`,
  #   `cache`, `user` and `url`.
  # @return [Client] A client configured to use the API with HTTP Basic
  #   or header-based authentication.
  def self.connect(api_key, options=nil)
    options = custom_options(options)
    uri = URI.parse(options[:url])

    if options[:user]
      uri.user = URI.encode_www_form_component options[:user]
    end

    if api_key
      uri.user ||= 'user'
      uri.password = api_key
    end

    client = Heroics.client_from_schema(SCHEMA, uri.to_s, options)
    Client.new(client)
  end

  # Get a Client configured to use OAuth authentication.
  #
  # @param oauth_token [String] The OAuth token to use with the API.
  # @param options [Hash<Symbol,String>] Optionally, custom settings
  #   to use with the client.  Allowed options are `default_headers`,
  #   `cache` and `url`.
  # @return [Client] A client configured to use the API with OAuth
  #   authentication.
  def self.connect_oauth(oauth_token, options=nil)
    options = custom_options(options)
    url = options[:url]
    client = Heroics.oauth_client_from_schema(oauth_token, SCHEMA, url, options)
    Client.new(client)
  end

  # Get a Client configured to use Token authentication.
  #
  # @param token [String] The token to use with the API.
  # @param options [Hash<Symbol,String>] Optionally, custom settings
  #   to use with the client.  Allowed options are `default_headers`,
  #   `cache` and `url`.
  # @return [Client] A client configured to use the API with OAuth
  #   authentication.
  def self.connect_token(token, options=nil)
    options = custom_options(options)
    url = options[:url]
    client = Heroics.token_client_from_schema(token, SCHEMA, url, options)
    Client.new(client)
  end

  # Get customized options.
  def self.custom_options(options)
    return default_options if options.nil?

    final_options = default_options
    if options[:default_headers]
      final_options[:default_headers].merge!(options[:default_headers])
    end
    final_options[:cache] = options[:cache] || Moneta.new(:File, dir: "#{Dir.home}/.heroics/liblynx-api")
    final_options[:url] = options[:url] if options[:url]
    final_options[:user] = options[:user] if options[:user]
    final_options
  end

  # Get the default options.
  def self.default_options
    default_headers = {"Accept"=>"application/json", "User-Agent"=>"liblynx-api/1.0.0"}
    {
      default_headers: default_headers,
      url:             "https://connect.liblynx.com"
    }
  end

  private_class_method :default_options, :custom_options

  # LibLynx API schema
  class Client
    def initialize(client)
      @client = client
    end

    # 
    #
    # @return [Account]
    def account
      @account_resource ||= Account.new(@client)
    end

    # 
    #
    # @return [Identification]
    def identification
      @identification_resource ||= Identification.new(@client)
    end

    # 
    #
    # @return [Samlidp]
    def samlidp
      @samlidp_resource ||= Samlidp.new(@client)
    end

    # 
    #
    # @return [Token]
    def token
      @token_resource ||= Token.new(@client)
    end
  end

  private

  # 
  class Account
    def initialize(client)
      @client = client
    end

    # Create a new account.
    #
    # @param body: the object to pass as the request payload
    def create(body = {})
      @client.account.create(body)
    end

    # Delete an existing account.
    #
    # @param account_identity: 
    def delete(account_identity)
      @client.account.delete(account_identity)
    end

    # Info for existing account.
    #
    # @param account_identity: 
    def info(account_identity)
      @client.account.info(account_identity)
    end

    # List existing accounts.
    def list()
      @client.account.list()
    end

    # Update an existing account.
    #
    # @param account_identity: 
    # @param body: the object to pass as the request payload
    def update(account_identity, body = {})
      @client.account.update(account_identity, body)
    end
  end

  # 
  class Identification
    def initialize(client)
      @client = client
    end

    # create a new identification resource to try and identify an account to link a new session with
    #
    # @param body: the object to pass as the request payload
    def create(body = {})
      @client.identification.create(body)
    end

    # retrieve a single identification object
    #
    # @param identification_identity: 
    def info(identification_identity)
      @client.identification.info(identification_identity)
    end
  end

  # 
  class Samlidp
    def initialize(client)
      @client = client
    end

    # Create a new samlidp.
    #
    # @param account_identity: 
    # @param body: the object to pass as the request payload
    def create(account_identity, body = {})
      @client.samlidp.create(account_identity, body)
    end

    # Delete an existing samlidp.
    #
    # @param account_identity: 
    # @param samlidp_identity: 
    def delete(account_identity, samlidp_identity)
      @client.samlidp.delete(account_identity, samlidp_identity)
    end

    # Info for existing samlidp.
    #
    # @param account_identity: 
    # @param samlidp_identity: 
    def info(account_identity, samlidp_identity)
      @client.samlidp.info(account_identity, samlidp_identity)
    end

    # List existing samlidps.
    #
    # @param account_identity: 
    def list(account_identity)
      @client.samlidp.list(account_identity)
    end
  end

  # 
  class Token
    def initialize(client)
      @client = client
    end

    # Create a new oauth2 token
    #
    # @param body: the object to pass as the request payload
    def create(body = {})
      @client.token.create(body)
    end
  end

  SCHEMA = Heroics::Schema.new(MultiJson.load(<<-'HEROICS_SCHEMA'))
{
  "$schema": "http://interagent.github.io/interagent-hyper-schema",
  "type": [
    "object"
  ],
  "definitions": {
    "account": {
      "$schema": "http://json-schema.org/draft-04/hyper-schema",
      "title": "Account",
      "description": "",
      "stability": "production",
      "strictProperties": true,
      "type": [
        "object"
      ],
      "definitions": {
        "id": {
          "description": "unique identifier of account",
          "readOnly": true,
          "type": [
            "integer"
          ]
        },
        "account_name": {
          "description": "unique name of account",
          "type": [
            "string"
          ]
        },
        "email_domains": {
          "description": "cr separated email domains",
          "example": "*.somedomain.com\nalt.somedomain2.com",
          "type": [
            "string"
          ]
        },
        "enable_saml": {
          "description": "enable saml",
          "type": [
            "boolean"
          ]
        },
        "enable_shibboleth": {
          "description": "enable shibboleth",
          "type": [
            "boolean"
          ]
        },
        "enable_ip": {
          "description": "enable ip",
          "type": [
            "boolean"
          ]
        },
        "enable_referrer": {
          "description": "enable referrer",
          "type": [
            "boolean"
          ]
        },
        "enable_library_card": {
          "description": "enable library card",
          "type": [
            "boolean"
          ]
        },
        "enable_individual": {
          "description": "enable individual",
          "type": [
            "boolean"
          ]
        },
        "enable_open_athens": {
          "description": "enable open athens",
          "type": [
            "boolean"
          ]
        },
        "enable_archimed": {
          "description": "enable archimed",
          "type": [
            "boolean"
          ]
        },
        "active": {
          "description": "active",
          "type": [
            "boolean"
          ]
        },
        "enable_pass_code": {
          "description": "enable pass code",
          "type": [
            "boolean"
          ]
        },
        "enable_self_registration": {
          "description": "enable self registration",
          "type": [
            "boolean"
          ]
        },
        "enable_lib_portal_stats": {
          "description": "enable lib portal stats",
          "type": [
            "boolean"
          ]
        },
        "individual_limit": {
          "description": "individual limit",
          "type": [
            "integer"
          ]
        },
        "individual": {
          "description": "individual",
          "type": [
            "boolean"
          ]
        },
        "type": {
          "description": "type",
          "type": [
            "string"
          ]
        },
        "identity": {
          "$ref": "#/definitions/account/definitions/id"
        },
        "creation_date": {
          "description": "when account was created",
          "readOnly": true,
          "format": "date-time",
          "type": [
            "string"
          ]
        },
        "modified_date": {
          "description": "when account was updated",
          "readOnly": true,
          "format": "date-time",
          "type": [
            "string"
          ]
        },
        "publisher_reference": {
          "description": "publisher reference",
          "type": [
            "string"
          ]
        },
        "shibboleth_entity_id": {
          "description": "shibboleth entity id",
          "format": "uri",
          "type": [
            "string"
          ]
        }
      },
      "links": [
        {
          "description": "Create a new account.",
          "href": "/api/accounts",
          "method": "POST",
          "rel": "create",
          "schema": {
            "properties": {
              "account_name": {
                "$ref": "#/definitions/account/definitions/account_name"
              },
              "publisher_reference": {
                "$ref": "#/definitions/account/definitions/publisher_reference"
              },
              "email_domains": {
                "$ref": "#/definitions/account/definitions/email_domains"
              },
              "enable_saml": {
                "$ref": "#/definitions/account/definitions/enable_saml"
              },
              "enable_shibboleth": {
                "$ref": "#/definitions/account/definitions/enable_shibboleth"
              },
              "shibboleth_entity_id": {
                "$ref": "#/definitions/account/definitions/shibboleth_entity_id"
              },
              "enable_ip": {
                "$ref": "#/definitions/account/definitions/enable_ip"
              },
              "enable_pass_code": {
                "$ref": "#/definitions/account/definitions/enable_pass_code"
              },
              "enable_referrer": {
                "$ref": "#/definitions/account/definitions/enable_referrer"
              },
              "enable_library_card": {
                "$ref": "#/definitions/account/definitions/enable_library_card"
              },
              "enable_individual": {
                "$ref": "#/definitions/account/definitions/enable_individual"
              },
              "enable_open_athens": {
                "$ref": "#/definitions/account/definitions/enable_open_athens"
              },
              "enable_archimed": {
                "$ref": "#/definitions/account/definitions/enable_archimed"
              },
              "active": {
                "$ref": "#/definitions/account/definitions/active"
              },
              "enable_self_registration": {
                "$ref": "#/definitions/account/definitions/enable_self_registration"
              },
              "enable_lib_portal_stats": {
                "$ref": "#/definitions/account/definitions/enable_lib_portal_stats"
              },
              "individual_limit": {
                "$ref": "#/definitions/account/definitions/individual_limit"
              },
              "individual": {
                "$ref": "#/definitions/account/definitions/individual"
              },
              "type": {
                "$ref": "#/definitions/account/definitions/type"
              }
            },
            "required": [
              "account_name"
            ],
            "type": [
              "object"
            ]
          },
          "title": "Create"
        },
        {
          "description": "Delete an existing account.",
          "href": "/api/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}",
          "method": "DELETE",
          "rel": "destroy",
          "title": "Delete",
          "targetSchema": {
          }
        },
        {
          "description": "Info for existing account.",
          "href": "/api/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}",
          "method": "GET",
          "rel": "self",
          "title": "Info"
        },
        {
          "description": "List existing accounts.",
          "href": "/api/accounts",
          "method": "GET",
          "rel": "instances",
          "targetSchema": {
            "properties": {
              "accounts": {
                "items": {
                  "properties": {
                    "id": {
                      "$ref": "#/definitions/account/definitions/id"
                    },
                    "account_name": {
                      "$ref": "#/definitions/account/definitions/account_name"
                    },
                    "individual": {
                      "$ref": "#/definitions/account/definitions/individual"
                    },
                    "active": {
                      "$ref": "#/definitions/account/definitions/active"
                    },
                    "publisher_reference": {
                      "$ref": "#/definitions/account/definitions/publisher_reference"
                    },
                    "type": {
                      "$ref": "#/definitions/account/definitions/type"
                    },
                    "modified_date": {
                      "$ref": "#/definitions/account/definitions/modified_date"
                    },
                    "creation_date": {
                      "$ref": "#/definitions/account/definitions/creation_date"
                    }
                  }
                },
                "type": [
                  "array"
                ]
              }
            }
          },
          "title": "List"
        },
        {
          "description": "Update an existing account.",
          "href": "/api/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}",
          "method": "PUT",
          "rel": "update",
          "schema": {
            "properties": {
              "account_name": {
                "$ref": "#/definitions/account/definitions/account_name"
              },
              "publisher_reference": {
                "$ref": "#/definitions/account/definitions/publisher_reference"
              },
              "email_domains": {
                "$ref": "#/definitions/account/definitions/email_domains"
              },
              "enable_saml": {
                "$ref": "#/definitions/account/definitions/enable_saml"
              },
              "enable_shibboleth": {
                "$ref": "#/definitions/account/definitions/enable_shibboleth"
              },
              "shibboleth_entity_id": {
                "$ref": "#/definitions/account/definitions/shibboleth_entity_id"
              },
              "enable_ip": {
                "$ref": "#/definitions/account/definitions/enable_ip"
              },
              "enable_pass_code": {
                "$ref": "#/definitions/account/definitions/enable_pass_code"
              },
              "enable_referrer": {
                "$ref": "#/definitions/account/definitions/enable_referrer"
              },
              "enable_library_card": {
                "$ref": "#/definitions/account/definitions/enable_library_card"
              },
              "enable_individual": {
                "$ref": "#/definitions/account/definitions/enable_individual"
              },
              "enable_open_athens": {
                "$ref": "#/definitions/account/definitions/enable_open_athens"
              },
              "enable_archimed": {
                "$ref": "#/definitions/account/definitions/enable_archimed"
              },
              "active": {
                "$ref": "#/definitions/account/definitions/active"
              },
              "enable_self_registration": {
                "$ref": "#/definitions/account/definitions/enable_self_registration"
              },
              "enable_lib_portal_stats": {
                "$ref": "#/definitions/account/definitions/enable_lib_portal_stats"
              },
              "individual_limit": {
                "$ref": "#/definitions/account/definitions/individual_limit"
              },
              "individual": {
                "$ref": "#/definitions/account/definitions/individual"
              },
              "type": {
                "$ref": "#/definitions/account/definitions/type"
              }
            },
            "type": [
              "object"
            ]
          },
          "title": "Update"
        }
      ],
      "properties": {
        "created_at": {
          "$ref": "#/definitions/account/definitions/creation_date"
        },
        "id": {
          "$ref": "#/definitions/account/definitions/id"
        },
        "name": {
          "$ref": "#/definitions/account/definitions/account_name"
        },
        "publisher_reference": {
          "$ref": "#/definitions/account/definitions/publisher_reference"
        },
        "enable_saml": {
          "$ref": "#/definitions/account/definitions/enable_saml"
        },
        "enable_shibboleth": {
          "$ref": "#/definitions/account/definitions/enable_shibboleth"
        },
        "email_domains": {
          "$ref": "#/definitions/account/definitions/email_domains"
        },
        "updated_at": {
          "$ref": "#/definitions/account/definitions/modified_date"
        },
        "shibboleth_entity_id": {
          "$ref": "#/definitions/account/definitions/shibboleth_entity_id"
        },
        "enable_ip": {
          "$ref": "#/definitions/account/definitions/enable_ip"
        },
        "enable_pass_code": {
          "$ref": "#/definitions/account/definitions/enable_pass_code"
        },
        "enable_referrer": {
          "$ref": "#/definitions/account/definitions/enable_referrer"
        },
        "enable_library_card": {
          "$ref": "#/definitions/account/definitions/enable_library_card"
        },
        "enable_individual": {
          "$ref": "#/definitions/account/definitions/enable_individual"
        },
        "enable_open_athens": {
          "$ref": "#/definitions/account/definitions/enable_open_athens"
        },
        "enable_archimed": {
          "$ref": "#/definitions/account/definitions/enable_archimed"
        },
        "active": {
          "$ref": "#/definitions/account/definitions/active"
        },
        "enable_self_registration": {
          "$ref": "#/definitions/account/definitions/enable_self_registration"
        },
        "enable_lib_portal_stats": {
          "$ref": "#/definitions/account/definitions/enable_lib_portal_stats"
        },
        "individual_limit": {
          "$ref": "#/definitions/account/definitions/individual_limit"
        },
        "individual": {
          "$ref": "#/definitions/account/definitions/individual"
        },
        "type": {
          "$ref": "#/definitions/account/definitions/type"
        }
      }
    },
    "identification": {
      "$schema": "http://json-schema.org/draft-04/hyper-schema",
      "title": "Identification",
      "description": "",
      "stability": "production",
      "strictProperties": true,
      "type": [
        "object"
      ],
      "definitions": {
        "id": {
          "description": "unique identifier of identification",
          "readOnly": true,
          "format": "uuid",
          "type": [
            "string"
          ]
        },
        "identity": {
          "$ref": "#/definitions/identification/definitions/id"
        },
        "created": {
          "description": "when identification was created",
          "format": "date-time",
          "type": [
            "string"
          ]
        },
        "email": {
          "description": "user email address",
          "format": "email",
          "type": [
            "string"
          ]
        },
        "url": {
          "description": "callback url",
          "format": "uri",
          "type": [
            "string"
          ]
        },
        "ip": {
          "description": "ip address",
          "format": "ipv4",
          "type": [
            "string"
          ]
        },
        "user_agent": {
          "description": "user agent",
          "type": [
            "string"
          ]
        },
        "status": {
          "description": "status",
          "type": [
            "string"
          ]
        },
        "terms": {
          "description": "terms",
          "type": [
            "string"
          ]
        },
        "authorizations": {
          "description": "authorizations",
          "type": [
            "array"
          ]
        },
        "unit_requests": {
          "description": "unit requests",
          "type": [
            "array"
          ]
        },
        "publisher": {
          "description": "publisher",
          "properties": {
            "id": {
              "type": [
                "integer"
              ]
            },
            "publisher_name": {
              "type": [
                "string"
              ]
            }
          },
          "type": [
            "object"
          ]
        },
        "user_institution": {
          "description": "user institution",
          "properties": {
            "id": {
              "type": [
                "integer"
              ]
            },
            "account_name": {
              "type": [
                "string"
              ]
            },
            "country_code": {
              "type": [
                "string"
              ]
            },
            "type": {
              "type": [
                "string"
              ]
            }
          },
          "type": [
            "object"
          ]
        },
        "target_account": {
          "description": "target account",
          "properties": {
            "id": {
              "type": [
                "integer"
              ]
            },
            "account_name": {
              "type": [
                "string"
              ]
            },
            "individual": {
              "type": [
                "boolean"
              ]
            },
            "type": {
              "type": [
                "string"
              ]
            },
            "publisher_reference": {
              "type": [
                "string"
              ]
            }
          },
          "type": [
            "object"
          ]
        }
      },
      "links": [
        {
          "description": "create a new identification resource to try and identify an account to link a new session with",
          "href": "/api/identifications",
          "method": "POST",
          "rel": "create",
          "schema": {
            "properties": {
              "email": {
                "$ref": "#/definitions/identification/definitions/email"
              },
              "ip": {
                "$ref": "#/definitions/identification/definitions/ip"
              },
              "user_agent": {
                "$ref": "#/definitions/identification/definitions/user_agent"
              },
              "url": {
                "$ref": "#/definitions/identification/definitions/url"
              }
            },
            "required": [
              "ip",
              "user_agent",
              "url"
            ],
            "type": [
              "object"
            ]
          },
          "title": "Create"
        },
        {
          "description": "retrieve a single identification object",
          "href": "/api/identifications/{(%23%2Fdefinitions%2Fidentification%2Fdefinitions%2Fidentity)}",
          "method": "GET",
          "rel": "self",
          "title": "Info"
        }
      ],
      "properties": {
        "created": {
          "$ref": "#/definitions/identification/definitions/created"
        },
        "id": {
          "$ref": "#/definitions/identification/definitions/id"
        },
        "url": {
          "$ref": "#/definitions/identification/definitions/url"
        },
        "ip": {
          "$ref": "#/definitions/identification/definitions/ip"
        },
        "status": {
          "$ref": "#/definitions/identification/definitions/status"
        },
        "terms": {
          "$ref": "#/definitions/identification/definitions/terms"
        },
        "authorizations": {
          "$ref": "#/definitions/identification/definitions/authorizations"
        },
        "unit_requests": {
          "$ref": "#/definitions/identification/definitions/unit_requests"
        },
        "publisher": {
          "$ref": "#/definitions/identification/definitions/publisher"
        },
        "user_agent": {
          "$ref": "#/definitions/identification/definitions/user_agent"
        },
        "user_institution": {
          "$ref": "#/definitions/identification/definitions/user_institution"
        },
        "target_account": {
          "$ref": "#/definitions/identification/definitions/target_account"
        }
      }
    },
    "samlidp": {
      "$schema": "http://json-schema.org/draft-04/hyper-schema",
      "title": "Samlidp",
      "description": "",
      "stability": "production",
      "strictProperties": true,
      "type": [
        "object"
      ],
      "definitions": {
        "id": {
          "description": "unique identifier of samlidp",
          "readOnly": true,
          "type": [
            "integer"
          ]
        },
        "descriptor_url": {
          "description": "saml descriptor url",
          "readOnly": true,
          "type": [
            "string"
          ]
        },
        "xml_descriptor": {
          "description": "xml descriptor",
          "readOnly": true,
          "type": [
            "string"
          ]
        },
        "type": {
          "description": "type",
          "readOnly": true,
          "type": [
            "string"
          ]
        },
        "entity_id": {
          "description": "entity_id",
          "readOnly": true,
          "type": [
            "string"
          ]
        },
        "identity": {
          "$ref": "#/definitions/samlidp/definitions/id"
        }
      },
      "links": [
        {
          "description": "Create a new samlidp.",
          "href": "/api/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}/samlidps",
          "method": "POST",
          "rel": "create",
          "schema": {
            "properties": {
              "descriptor_url": {
                "$ref": "#/definitions/samlidp/definitions/descriptor_url"
              }
            },
            "required": [
              "descriptor_url"
            ],
            "type": [
              "object"
            ]
          },
          "title": "Create"
        },
        {
          "description": "Delete an existing samlidp.",
          "href": "/api/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}/samlidps/{(%23%2Fdefinitions%2Fsamlidp%2Fdefinitions%2Fidentity)}",
          "method": "DELETE",
          "rel": "destroy",
          "title": "Delete",
          "targetSchema": {
          }
        },
        {
          "description": "Info for existing samlidp.",
          "href": "/api/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}/samlidps/{(%23%2Fdefinitions%2Fsamlidp%2Fdefinitions%2Fidentity)}",
          "method": "GET",
          "rel": "self",
          "title": "Info"
        },
        {
          "description": "List existing samlidps.",
          "href": "/api/accounts/{(%23%2Fdefinitions%2Faccount%2Fdefinitions%2Fidentity)}/samlidps",
          "method": "GET",
          "rel": "instances",
          "title": "List",
          "targetSchema": {
            "properties": {
              "samlidps": {
                "items": {
                  "properties": {
                    "id": {
                      "$ref": "#/definitions/samlidp/definitions/id"
                    },
                    "descriptor_url": {
                      "$ref": "#/definitions/samlidp/definitions/descriptor_url"
                    },
                    "xml_descriptor": {
                      "$ref": "#/definitions/samlidp/definitions/xml_descriptor"
                    },
                    "type": {
                      "$ref": "#/definitions/samlidp/definitions/type"
                    },
                    "entity_id": {
                      "$ref": "#/definitions/samlidp/definitions/entity_id"
                    }
                  }
                },
                "type": [
                  "array"
                ]
              }
            }
          }
        }
      ],
      "properties": {
        "id": {
          "$ref": "#/definitions/samlidp/definitions/id"
        },
        "descriptor_url": {
          "$ref": "#/definitions/samlidp/definitions/descriptor_url"
        },
        "xml_descriptor": {
          "$ref": "#/definitions/samlidp/definitions/xml_descriptor"
        },
        "type": {
          "$ref": "#/definitions/samlidp/definitions/type"
        },
        "entity_id": {
          "$ref": "#/definitions/samlidp/definitions/entity_id"
        }
      }
    },
    "token": {
      "$schema": "http://json-schema.org/draft-04/hyper-schema",
      "title": "OAuth2 token",
      "description": "",
      "stability": "production",
      "strictProperties": true,
      "type": [
        "object"
      ],
      "definitions": {
        "account_token": {
          "description": "unique identifier of identification",
          "readOnly": true,
          "type": [
            "string"
          ]
        },
        "identity": {
          "$ref": "#/definitions/token/definitions/account_token"
        },
        "grant_type": {
          "description": "grant_type",
          "example": "client_credentials",
          "type": [
            "string"
          ]
        }
      },
      "links": [
        {
          "description": "Create a new oauth2 token",
          "encType": "application/x-www-form-urlencoded",
          "href": "/oauth/v2/token",
          "method": "POST",
          "rel": "create",
          "schema": {
            "properties": {
              "grant_type": {
                "$ref": "#/definitions/token/definitions/grant_type"
              }
            },
            "required": [
              "grant_type"
            ],
            "type": [
              "object"
            ]
          },
          "targetSchema": {
            "properties": {
              "account_token": {
                "$ref": "#/definitions/token/definitions/account_token"
              }
            },
            "type": [
              "object"
            ]
          },
          "title": "Create"
        }
      ],
      "properties": {
        "account_token": {
          "$ref": "#/definitions/token/definitions/account_token"
        }
      }
    }
  },
  "properties": {
    "account": {
      "$ref": "#/definitions/account"
    },
    "identification": {
      "$ref": "#/definitions/identification"
    },
    "samlidp": {
      "$ref": "#/definitions/samlidp"
    },
    "token": {
      "$ref": "#/definitions/token"
    }
  },
  "description": "LibLynx API schema",
  "id": "http://connect.liblynx.com/schema#",
  "links": [
    {
      "href": "https://connect.liblynx.com",
      "rel": "self"
    }
  ],
  "title": "LibLynx API"
}
HEROICS_SCHEMA
end
