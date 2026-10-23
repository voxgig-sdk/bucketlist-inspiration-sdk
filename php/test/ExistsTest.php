<?php
declare(strict_types=1);

// BucketlistInspiration SDK exists test

require_once __DIR__ . '/../bucketlistinspiration_sdk.php';

use PHPUnit\Framework\TestCase;

class ExistsTest extends TestCase
{
    public function test_create_test_sdk(): void
    {
        $testsdk = BucketlistInspirationSDK::test(null, null);
        $this->assertNotNull($testsdk);
    }
}
