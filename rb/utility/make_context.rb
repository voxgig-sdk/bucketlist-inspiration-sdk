# BucketlistInspiration SDK utility: make_context
require_relative '../core/context'
module BucketlistInspirationUtilities
  MakeContext = ->(ctxmap, basectx) {
    BucketlistInspirationContext.new(ctxmap, basectx)
  }
end
