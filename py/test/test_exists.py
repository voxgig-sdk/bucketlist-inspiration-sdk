# BucketlistInspiration SDK exists test

import pytest
from bucketlistinspiration_sdk import BucketlistInspirationSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = BucketlistInspirationSDK.test(None, None)
        assert testsdk is not None
