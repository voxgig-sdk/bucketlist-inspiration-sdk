<?php
declare(strict_types=1);

// BucketlistInspiration SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class BucketlistInspirationMakeContext
{
    public static function call(array $ctxmap, ?BucketlistInspirationContext $basectx): BucketlistInspirationContext
    {
        return new BucketlistInspirationContext($ctxmap, $basectx);
    }
}
