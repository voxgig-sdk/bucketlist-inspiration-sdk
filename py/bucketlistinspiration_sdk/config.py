# BucketlistInspiration SDK configuration


# The sekreto plugin DEFINITIONS the model selected per feature, imported
# above by name from the modules the catalogue's active `plugin.def`
# entries declare. Handed to each feature (secrets builds its Sekreto
# with them): a provider kind not listed here is unknown to that SDK.
FEATURE_PLUGINS = {
}


_shared_config = None


def shared_config():
    """Return the process-wide config, built once on first use.

    The SDK reads the config on every request and never writes to it, so one
    instance is shared by every client rather than rebuilt per client.

    The returned dict is shared: treat it as read-only. Callers that need to
    mutate should use make_config, which always returns a fresh copy.
    """
    global _shared_config
    if _shared_config is None:
        _shared_config = make_config()
    return _shared_config


def make_config():
    """Build a fresh, fully materialised config dict.

    Every call rebuilds the whole structure, so prefer shared_config unless
    you need a private copy you intend to mutate.
    """
    return {
        "main": {
            "name": "BucketlistInspiration",
            "slug": "bucketlist-inspiration",
            "version": "0.0.1",
            "target": "py",
        },
        "feature": {
            "ratelimit": {
        "options": {
          "active": False,
          "burst": 5,
          "rate": 5,
        },
        "optspec": {
          "now": "`$FUNCTION`",
          "sleep": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "wrap",
      },
            "retry": {
        "options": {
          "active": False,
          "factor": 2,
          "maxDelay": 2000,
          "minDelay": 50,
          "retries": 2,
          "statuses": [
            408,
            425,
            429,
            500,
            502,
            503,
            504,
          ],
        },
        "optspec": {
          "jitter": "`$BOOLEAN`",
          "sleep": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "wrap",
      },
            "test": {
        "options": {
          "active": False,
        },
        "optspec": {
          "entity": "`$MAP`",
          "net": "`$MAP`",
        },
        "strict": False,
        "transport": "base",
      },
            "timeout": {
        "options": {
          "active": False,
          "ms": 30000,
        },
        "optspec": {
          "clearTimer": "`$FUNCTION`",
          "now": "`$FUNCTION`",
          "setTimer": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "wrap",
      },
        },
        "options": {
            "base": "https://bucketlist.nl",
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "droom_van_de_dag": {},
            },
        },
        "entity": {
      "droom_van_de_dag": {
        "fields": [
          {
            "name": "attribution",
            "title": "Attribution",
            "type": "`$OBJECT`",
            "req": True,
          },
          {
            "name": "date",
            "title": "Date",
            "type": "`$STRING`",
            "req": True,
            "format": "date",
          },
          {
            "name": "dream",
            "title": "Dream",
            "type": "`$OBJECT`",
            "req": True,
          },
          {
            "name": "language",
            "title": "Language",
            "type": "`$STRING`",
            "req": True,
          },
          {
            "name": "requestedTheme",
            "title": "Requested Theme",
            "type": [
              "`$ONE`",
              [
                "`$STRING`",
                "`$NULL`",
              ],
            ],
            "req": True,
          },
          {
            "name": "scope",
            "title": "Scope",
            "type": "`$STRING`",
            "req": True,
          },
        ],
        "name": "droom_van_de_dag",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/api/droom-van-de-dag",
                "segments": [
                  {
                    "lit": "api",
                  },
                  {
                    "lit": "droom-van-de-dag",
                  },
                ],
                "parts": [
                  "api",
                  "droom-van-de-dag",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "query": [
                    {
                      "name": "lang",
                      "orig": "lang",
                      "type": "`$STRING`",
                      "kind": "query",
                      "example": "nl",
                    },
                    {
                      "name": "scope",
                      "orig": "scope",
                      "type": "`$STRING`",
                      "kind": "query",
                      "example": "nederland",
                      "field": True,
                    },
                    {
                      "name": "theme",
                      "orig": "theme",
                      "type": "`$STRING`",
                      "kind": "query",
                    },
                  ],
                },
                "select": {},
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
