register /Users/jamesb/.cargo/bin/nu_plugin_dns  {
  "sig": {
    "name": "dns query",
    "usage": "Perform a DNS query",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": {
      "name": "name",
      "desc": "DNS record name",
      "shape": {
        "OneOf": [
          "String",
          {
            "List": "Binary"
          }
        ]
      },
      "var_id": null,
      "default_value": null
    },
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "server",
        "short": "s",
        "arg": "String",
        "required": false,
        "desc": "Nameserver to query (defaults to system config or 8.8.8.8)",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "protocol",
        "short": "p",
        "arg": "String",
        "required": false,
        "desc": "Protocol to use to connect to the nameserver: UDP, TCP. (default: UDP)",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "type",
        "short": "t",
        "arg": "Any",
        "required": false,
        "desc": "Query type",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "class",
        "short": null,
        "arg": "Any",
        "required": false,
        "desc": "Query class",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "code",
        "short": "c",
        "arg": null,
        "required": false,
        "desc": "Return code fields with both string and numeric representations",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "dnssec",
        "short": "d",
        "arg": "String",
        "required": false,
        "desc": "Perform DNSSEC validation on records. Choices are: \"none\", \"strict\" (error if record has no RRSIG or does not validate), \"opportunistic\" (validate if RRSIGs present, otherwise no validation; default)",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "dns-name",
        "short": "n",
        "arg": "String",
        "required": false,
        "desc": "DNS name of the TLS certificate in use by the nameserver (for TLS and HTTPS only)",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Network"
  },
  "examples": [
    {
      "example": "dns query google.com",
      "description": "simple query for A / AAAA records",
      "result": null
    },
    {
      "example": "dns query --type CNAME google.com",
      "description": "specify query type",
      "result": null
    },
    {
      "example": "dns query --type [cname, mx] -c google.com",
      "description": "specify multiple query types",
      "result": null
    },
    {
      "example": "dns query --type [5, 15] -c google.com",
      "description": "specify query types by numeric ID, and get numeric IDs in output",
      "result": null
    },
    {
      "example": "'google.com' | dns query",
      "description": "pipe name into command",
      "result": null
    },
    {
      "example": "['google.com', 'amazon.com'] | dns query",
      "description": "pipe lists of names into command",
      "result": null
    },
    {
      "example": "[{name: 'google.com', type: 'A'}, {name: 'amazon.com', type: 'A'}] | dns query",
      "description": "pipe table of queries into command (ignores --type flag)",
      "result": null
    }
  ]
}

register /Users/jamesb/.cargo/bin/nu_plugin_emoji  {
  "sig": {
    "name": "emoji",
    "usage": "Create emojis from text",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [
      {
        "name": "emoji-name",
        "desc": "name of the emoji shorthand with colons before and after e.g. :grinning:",
        "shape": "String",
        "var_id": null,
        "default_value": null
      }
    ],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "list",
        "short": "l",
        "arg": null,
        "required": false,
        "desc": "List stuff",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Experimental"
  },
  "examples": [
    {
      "example": "emoji :smirk:",
      "description": "Show the smirk emoji",
      "result": null
    },
    {
      "example": "emoji --list",
      "description": "List all known emojis",
      "result": null
    }
  ]
}

register /Users/jamesb/.cargo/bin/nu_plugin_hcl  {
  "sig": {
    "name": "from hcl",
    "usage": "Parse text as .hcl and create a record",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [
      [
        "String",
        {
          "Record": []
        }
      ]
    ],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Formats"
  },
  "examples": [
    {
      "example": "'provider \"aws\" {\n  region = \"us-east-1\"\n}\nresource \"aws_instance\" \"web\" {\n  ami           = \"ami-a1b2c3d4\"\n  instance_type = \"t2.micro\"\n}' | from hcl",
      "description": "Convert .hcl data into record",
      "result": {
        "Record": {
          "val": {
            "cols": [
              "provider",
              "resource"
            ],
            "vals": [
              {
                "Record": {
                  "val": {
                    "cols": [
                      "aws"
                    ],
                    "vals": [
                      {
                        "Record": {
                          "val": {
                            "cols": [
                              "region"
                            ],
                            "vals": [
                              {
                                "String": {
                                  "val": "us-east-1",
                                  "internal_span": {
                                    "start": 0,
                                    "end": 0
                                  }
                                }
                              }
                            ]
                          },
                          "internal_span": {
                            "start": 0,
                            "end": 0
                          }
                        }
                      }
                    ]
                  },
                  "internal_span": {
                    "start": 0,
                    "end": 0
                  }
                }
              },
              {
                "Record": {
                  "val": {
                    "cols": [
                      "aws_instance"
                    ],
                    "vals": [
                      {
                        "Record": {
                          "val": {
                            "cols": [
                              "web"
                            ],
                            "vals": [
                              {
                                "Record": {
                                  "val": {
                                    "cols": [
                                      "ami",
                                      "instance_type"
                                    ],
                                    "vals": [
                                      {
                                        "String": {
                                          "val": "ami-a1b2c3d4",
                                          "internal_span": {
                                            "start": 0,
                                            "end": 0
                                          }
                                        }
                                      },
                                      {
                                        "String": {
                                          "val": "t2.micro",
                                          "internal_span": {
                                            "start": 0,
                                            "end": 0
                                          }
                                        }
                                      }
                                    ]
                                  },
                                  "internal_span": {
                                    "start": 0,
                                    "end": 0
                                  }
                                }
                              }
                            ]
                          },
                          "internal_span": {
                            "start": 0,
                            "end": 0
                          }
                        }
                      }
                    ]
                  },
                  "internal_span": {
                    "start": 0,
                    "end": 0
                  }
                }
              }
            ]
          },
          "internal_span": {
            "start": 0,
            "end": 0
          }
        }
      }
    }
  ]
}

register /Users/jamesb/.cargo/bin/nu_plugin_hcl  {
  "sig": {
    "name": "from tf",
    "usage": "Parse text as .tf and create a record",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [
      [
        "String",
        {
          "Record": []
        }
      ]
    ],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Formats"
  },
  "examples": [
    {
      "example": "'provider \"aws\" {\n  region = \"us-east-1\"\n}\nresource \"aws_instance\" \"web\" {\n  ami           = \"ami-a1b2c3d4\"\n  instance_type = \"t2.micro\"\n}' | from hcl",
      "description": "Convert .hcl data into record",
      "result": {
        "Record": {
          "val": {
            "cols": [
              "provider",
              "resource"
            ],
            "vals": [
              {
                "Record": {
                  "val": {
                    "cols": [
                      "aws"
                    ],
                    "vals": [
                      {
                        "Record": {
                          "val": {
                            "cols": [
                              "region"
                            ],
                            "vals": [
                              {
                                "String": {
                                  "val": "us-east-1",
                                  "internal_span": {
                                    "start": 0,
                                    "end": 0
                                  }
                                }
                              }
                            ]
                          },
                          "internal_span": {
                            "start": 0,
                            "end": 0
                          }
                        }
                      }
                    ]
                  },
                  "internal_span": {
                    "start": 0,
                    "end": 0
                  }
                }
              },
              {
                "Record": {
                  "val": {
                    "cols": [
                      "aws_instance"
                    ],
                    "vals": [
                      {
                        "Record": {
                          "val": {
                            "cols": [
                              "web"
                            ],
                            "vals": [
                              {
                                "Record": {
                                  "val": {
                                    "cols": [
                                      "ami",
                                      "instance_type"
                                    ],
                                    "vals": [
                                      {
                                        "String": {
                                          "val": "ami-a1b2c3d4",
                                          "internal_span": {
                                            "start": 0,
                                            "end": 0
                                          }
                                        }
                                      },
                                      {
                                        "String": {
                                          "val": "t2.micro",
                                          "internal_span": {
                                            "start": 0,
                                            "end": 0
                                          }
                                        }
                                      }
                                    ]
                                  },
                                  "internal_span": {
                                    "start": 0,
                                    "end": 0
                                  }
                                }
                              }
                            ]
                          },
                          "internal_span": {
                            "start": 0,
                            "end": 0
                          }
                        }
                      }
                    ]
                  },
                  "internal_span": {
                    "start": 0,
                    "end": 0
                  }
                }
              }
            ]
          },
          "internal_span": {
            "start": 0,
            "end": 0
          }
        }
      }
    }
  ]
}

register /Users/jamesb/.cargo/bin/nu_plugin_regex  {
  "sig": {
    "name": "regex",
    "usage": "Parse input with a regular expression",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [
      {
        "name": "pattern",
        "desc": "the regular expression to use",
        "shape": "String",
        "var_id": null,
        "default_value": null
      }
    ],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [
      [
        "String",
        {
          "Table": []
        }
      ]
    ],
    "allow_variants_without_examples": true,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Experimental"
  },
  "examples": [
    {
      "example": "\"hello world\" | regex '(?P<first>\\w+) (?P<second>\\w+)'",
      "description": "Parse a string with a regular expression",
      "result": null
    }
  ]
}

register /Users/jamesb/.cargo/bin/nu_plugin_units  {
  "sig": {
    "name": "units",
    "usage": "Convert between units",
    "extra_usage": "",
    "search_terms": [],
    "required_positional": [],
    "optional_positional": [],
    "rest_positional": null,
    "named": [
      {
        "long": "help",
        "short": "h",
        "arg": null,
        "required": false,
        "desc": "Display the help message for this command",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "category",
        "short": "c",
        "arg": "String",
        "required": true,
        "desc": "specify the category",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "unit",
        "short": "u",
        "arg": "String",
        "required": true,
        "desc": "specify the unit type",
        "var_id": null,
        "default_value": null
      },
      {
        "long": "value",
        "short": "v",
        "arg": "Float",
        "required": true,
        "desc": "specify the value",
        "var_id": null,
        "default_value": null
      }
    ],
    "input_output_types": [],
    "allow_variants_without_examples": false,
    "is_filter": false,
    "creates_scope": false,
    "allows_unknown_args": false,
    "category": "Generators"
  },
  "examples": []
}

