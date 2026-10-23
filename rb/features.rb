# BucketlistInspiration SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module BucketlistInspirationFeatures
  def self.make_feature(name)
    case name
    when "base"
      BucketlistInspirationBaseFeature.new
    when "ratelimit"
      BucketlistInspirationRatelimitFeature.new
    when "retry"
      BucketlistInspirationRetryFeature.new
    when "test"
      BucketlistInspirationTestFeature.new
    when "timeout"
      BucketlistInspirationTimeoutFeature.new
    else
      BucketlistInspirationBaseFeature.new
    end
  end
end
