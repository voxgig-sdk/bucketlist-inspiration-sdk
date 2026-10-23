-- BucketlistInspiration SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "BucketlistInspiration",
      slug = "bucketlist-inspiration",
      version = "0.0.1",
      target = "lua",
    },
    feature = {
      ["ratelimit"] = {
        ["options"] = {
          ["active"] = false,
          ["burst"] = 5,
          ["rate"] = 5,
        },
        ["optspec"] = {
          ["now"] = "`$FUNCTION`",
          ["sleep"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
      },
      ["retry"] = {
        ["options"] = {
          ["active"] = false,
          ["factor"] = 2,
          ["maxDelay"] = 2000,
          ["minDelay"] = 50,
          ["retries"] = 2,
          ["statuses"] = {
            408,
            425,
            429,
            500,
            502,
            503,
            504,
          },
        },
        ["optspec"] = {
          ["jitter"] = "`$BOOLEAN`",
          ["sleep"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
      },
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
        ["optspec"] = {
          ["entity"] = "`$MAP`",
          ["net"] = "`$MAP`",
        },
        ["strict"] = false,
        ["transport"] = "base",
      },
      ["timeout"] = {
        ["options"] = {
          ["active"] = false,
          ["ms"] = 30000,
        },
        ["optspec"] = {
          ["clearTimer"] = "`$FUNCTION`",
          ["now"] = "`$FUNCTION`",
          ["setTimer"] = "`$FUNCTION`",
        },
        ["strict"] = false,
        ["transport"] = "wrap",
      },
    },
    options = {
      base = "https://bucketlist.nl",
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["droom_van_de_dag"] = {},
      },
    },
    entity = {
      ["droom_van_de_dag"] = {
        ["fields"] = {
          {
            ["name"] = "attribution",
            ["title"] = "Attribution",
            ["type"] = "`$OBJECT`",
            ["req"] = true,
          },
          {
            ["name"] = "date",
            ["title"] = "Date",
            ["type"] = "`$STRING`",
            ["req"] = true,
            ["format"] = "date",
          },
          {
            ["name"] = "dream",
            ["title"] = "Dream",
            ["type"] = "`$OBJECT`",
            ["req"] = true,
          },
          {
            ["name"] = "language",
            ["title"] = "Language",
            ["type"] = "`$STRING`",
            ["req"] = true,
          },
          {
            ["name"] = "requestedTheme",
            ["title"] = "Requested Theme",
            ["type"] = {
              "`$ONE`",
              {
                "`$STRING`",
                "`$NULL`",
              },
            },
            ["req"] = true,
          },
          {
            ["name"] = "scope",
            ["title"] = "Scope",
            ["type"] = "`$STRING`",
            ["req"] = true,
          },
        },
        ["name"] = "droom_van_de_dag",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/api/droom-van-de-dag",
                ["segments"] = {
                  {
                    ["lit"] = "api",
                  },
                  {
                    ["lit"] = "droom-van-de-dag",
                  },
                },
                ["parts"] = {
                  "api",
                  "droom-van-de-dag",
                },
                ["rename"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["args"] = {
                  ["query"] = {
                    {
                      ["name"] = "lang",
                      ["orig"] = "lang",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                      ["example"] = "nl",
                    },
                    {
                      ["name"] = "scope",
                      ["orig"] = "scope",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                      ["example"] = "nederland",
                      ["field"] = true,
                    },
                    {
                      ["name"] = "theme",
                      ["orig"] = "theme",
                      ["type"] = "`$STRING`",
                      ["kind"] = "query",
                    },
                  },
                },
                ["select"] = {},
                ["response"] = {
                  ["kind"] = "json",
                  ["media"] = "application/json",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
