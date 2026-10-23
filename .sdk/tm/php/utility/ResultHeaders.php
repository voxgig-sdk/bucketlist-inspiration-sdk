<?php
declare(strict_types=1);

// BucketlistInspiration SDK utility: result_headers

class BucketlistInspirationResultHeaders
{
    public static function call(BucketlistInspirationContext $ctx): ?BucketlistInspirationResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}
