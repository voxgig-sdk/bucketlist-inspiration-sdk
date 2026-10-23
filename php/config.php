<?php
declare(strict_types=1);

// BucketlistInspiration SDK configuration

class BucketlistInspirationConfig
{
    /** @var array<string,mixed>|null */
    private static ?array $shared_config = null;

    /**
     * Return the process-wide config, built once on first use. The SDK reads
     * the config on every request and never writes to it, so one instance is
     * shared by every client rather than rebuilt per client.
     *
     * PHP arrays are copy-on-write, so callers that do mutate the result get
     * their own copy and cannot disturb the shared one.
     */
    public static function shared_config(): array
    {
        if (self::$shared_config === null) {
            self::$shared_config = self::make_config();
        }
        return self::$shared_config;
    }

    /**
     * Build a fresh, fully materialised config array. Every call rebuilds the
     * whole structure, so prefer shared_config unless you need a private copy.
     */
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "BucketlistInspiration",
                "slug" => "bucketlist-inspiration",
                "version" => "0.0.1",
                "target" => "php",
            ],
            "feature" => [
                "ratelimit" => [
          'options' => [
            'active' => false,
            'burst' => 5,
            'rate' => 5,
          ],
          'optspec' => [
            'now' => '`$FUNCTION`',
            'sleep' => '`$FUNCTION`',
          ],
          'strict' => false,
          'transport' => 'wrap',
        ],
                "retry" => [
          'options' => [
            'active' => false,
            'factor' => 2,
            'maxDelay' => 2000,
            'minDelay' => 50,
            'retries' => 2,
            'statuses' => [
              408,
              425,
              429,
              500,
              502,
              503,
              504,
            ],
          ],
          'optspec' => [
            'jitter' => '`$BOOLEAN`',
            'sleep' => '`$FUNCTION`',
          ],
          'strict' => false,
          'transport' => 'wrap',
        ],
                "test" => [
          'options' => [
            'active' => false,
          ],
          'optspec' => [
            'entity' => '`$MAP`',
            'net' => '`$MAP`',
          ],
          'strict' => false,
          'transport' => 'base',
        ],
                "timeout" => [
          'options' => [
            'active' => false,
            'ms' => 30000,
          ],
          'optspec' => [
            'clearTimer' => '`$FUNCTION`',
            'now' => '`$FUNCTION`',
            'setTimer' => '`$FUNCTION`',
          ],
          'strict' => false,
          'transport' => 'wrap',
        ],
            ],
            "options" => [
                "base" => "https://bucketlist.nl",
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "droom_van_de_dag" => [],
                ],
            ],
            "entity" => [
        'droom_van_de_dag' => [
          'fields' => [
            [
              'name' => 'attribution',
              'title' => 'Attribution',
              'type' => '`$OBJECT`',
              'req' => true,
            ],
            [
              'name' => 'date',
              'title' => 'Date',
              'type' => '`$STRING`',
              'req' => true,
              'format' => 'date',
            ],
            [
              'name' => 'dream',
              'title' => 'Dream',
              'type' => '`$OBJECT`',
              'req' => true,
            ],
            [
              'name' => 'language',
              'title' => 'Language',
              'type' => '`$STRING`',
              'req' => true,
            ],
            [
              'name' => 'requestedTheme',
              'title' => 'Requested Theme',
              'type' => [
                '`$ONE`',
                [
                  '`$STRING`',
                  '`$NULL`',
                ],
              ],
              'req' => true,
            ],
            [
              'name' => 'scope',
              'title' => 'Scope',
              'type' => '`$STRING`',
              'req' => true,
            ],
          ],
          'name' => 'droom_van_de_dag',
          'op' => [
            'load' => [
              'input' => 'data',
              'name' => 'load',
              'points' => [
                [
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/api/droom-van-de-dag',
                  'segments' => [
                    [
                      'lit' => 'api',
                    ],
                    [
                      'lit' => 'droom-van-de-dag',
                    ],
                  ],
                  'parts' => [
                    'api',
                    'droom-van-de-dag',
                  ],
                  'rename' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'args' => [
                    'query' => [
                      [
                        'name' => 'lang',
                        'orig' => 'lang',
                        'type' => '`$STRING`',
                        'kind' => 'query',
                        'example' => 'nl',
                      ],
                      [
                        'name' => 'scope',
                        'orig' => 'scope',
                        'type' => '`$STRING`',
                        'kind' => 'query',
                        'example' => 'nederland',
                        'field' => true,
                      ],
                      [
                        'name' => 'theme',
                        'orig' => 'theme',
                        'type' => '`$STRING`',
                        'kind' => 'query',
                      ],
                    ],
                  ],
                  'select' => [],
                  'response' => [
                    'kind' => 'json',
                    'media' => 'application/json',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return BucketlistInspirationFeatures::make_feature($name);
    }
}
