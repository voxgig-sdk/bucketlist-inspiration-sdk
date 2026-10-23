# BucketlistInspiration SDK utility: make_context

from bucketlistinspiration_sdk.core.context import BucketlistInspirationContext


def make_context_util(ctxmap, basectx):
    return BucketlistInspirationContext(ctxmap, basectx)
