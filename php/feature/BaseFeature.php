<?php
declare(strict_types=1);

// BucketlistInspiration SDK base feature

class BucketlistInspirationBaseFeature
{
    public string $version;
    public string $name;
    public bool $active;

    // Positions this feature when added via the client `extend` option:
    // "__before__" / "__after__" / "__replace__" name an already-added
    // feature (mirrors the ts feature `_options`). Declared so setting it
    // on an extension instance avoids the dynamic-property deprecation.
    public ?array $_options = null;

    public function __construct()
    {
        $this->version = '0.0.1';
        $this->name = 'base';
        $this->active = true;
    }

    public function get_version(): string { return $this->version; }
    public function get_name(): string { return $this->name; }
    public function get_active(): bool { return $this->active; }

    public function init(BucketlistInspirationContext $ctx, array $options): void {}
    public function PostConstruct(BucketlistInspirationContext $ctx): void {}
    public function PostConstructEntity(BucketlistInspirationContext $ctx): void {}
    public function SetData(BucketlistInspirationContext $ctx): void {}
    public function GetData(BucketlistInspirationContext $ctx): void {}
    public function GetMatch(BucketlistInspirationContext $ctx): void {}
    public function SetMatch(BucketlistInspirationContext $ctx): void {}
    public function PrePoint(BucketlistInspirationContext $ctx): void {}
    public function PreSpec(BucketlistInspirationContext $ctx): void {}
    public function PreRequest(BucketlistInspirationContext $ctx): void {}
    public function PreResponse(BucketlistInspirationContext $ctx): void {}
    public function PreResult(BucketlistInspirationContext $ctx): void {}
    public function PreDone(BucketlistInspirationContext $ctx): void {}
    public function PreUnexpected(BucketlistInspirationContext $ctx): void {}
}
