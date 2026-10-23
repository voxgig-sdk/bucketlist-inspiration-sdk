# BucketlistInspiration SDK feature factory

from bucketlistinspiration_sdk.feature.base_feature import BucketlistInspirationBaseFeature
from bucketlistinspiration_sdk.feature.ratelimit_feature import BucketlistInspirationRatelimitFeature
from bucketlistinspiration_sdk.feature.retry_feature import BucketlistInspirationRetryFeature
from bucketlistinspiration_sdk.feature.test_feature import BucketlistInspirationTestFeature
from bucketlistinspiration_sdk.feature.timeout_feature import BucketlistInspirationTimeoutFeature


_FEATURES = {
    "base": lambda: BucketlistInspirationBaseFeature(),
    "ratelimit": lambda: BucketlistInspirationRatelimitFeature(),
    "retry": lambda: BucketlistInspirationRetryFeature(),
    "test": lambda: BucketlistInspirationTestFeature(),
    "timeout": lambda: BucketlistInspirationTimeoutFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES
