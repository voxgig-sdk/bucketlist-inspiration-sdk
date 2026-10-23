# BucketlistInspiration SDK exists test

require "minitest/autorun"
require_relative "../BucketlistInspiration_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = BucketlistInspirationSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end
