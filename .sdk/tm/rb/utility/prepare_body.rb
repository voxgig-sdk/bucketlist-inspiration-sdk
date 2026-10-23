# BucketlistInspiration SDK utility: prepare_body
require_relative 'media'
module BucketlistInspirationUtilities
  PrepareBody = ->(ctx) {
    return nil unless ctx.op.input == "data"
    return BucketlistInspirationUtilities.raw_body(ctx.reqdata) if BucketlistInspirationUtilities.raw_request?(ctx.point)
    ctx.utility.transform_request.call(ctx)
  }
end
