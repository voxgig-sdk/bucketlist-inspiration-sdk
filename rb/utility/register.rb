# BucketlistInspiration SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'graphql'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

BucketlistInspirationUtility.registrar = ->(u) {
  u.clean = BucketlistInspirationUtilities::Clean
  u.clean_add = BucketlistInspirationUtilities::CleanAdd
  u.clean_explain = BucketlistInspirationUtilities::CleanExplain
  u.done = BucketlistInspirationUtilities::Done
  u.make_error = BucketlistInspirationUtilities::MakeError
  u.feature_add = BucketlistInspirationUtilities::FeatureAdd
  u.feature_hook = BucketlistInspirationUtilities::FeatureHook
  u.feature_init = BucketlistInspirationUtilities::FeatureInit
  u.fetcher = BucketlistInspirationUtilities::Fetcher
  u.make_fetch_def = BucketlistInspirationUtilities::MakeFetchDef
  u.make_context = BucketlistInspirationUtilities::MakeContext
  u.make_options = BucketlistInspirationUtilities::MakeOptions
  u.make_request = BucketlistInspirationUtilities::MakeRequest
  u.make_response = BucketlistInspirationUtilities::MakeResponse
  u.make_result = BucketlistInspirationUtilities::MakeResult
  u.make_point = BucketlistInspirationUtilities::MakePoint
  u.make_spec = BucketlistInspirationUtilities::MakeSpec
  u.make_url = BucketlistInspirationUtilities::MakeUrl
  u.param = BucketlistInspirationUtilities::Param
  u.prepare_auth = BucketlistInspirationUtilities::PrepareAuth
  u.prepare_body = BucketlistInspirationUtilities::PrepareBody
  u.prepare_headers = BucketlistInspirationUtilities::PrepareHeaders
  u.prepare_method = BucketlistInspirationUtilities::PrepareMethod
  u.prepare_params = BucketlistInspirationUtilities::PrepareParams
  u.prepare_path = BucketlistInspirationUtilities::PreparePath
  u.prepare_query = BucketlistInspirationUtilities::PrepareQuery
  u.graphql_body = BucketlistInspirationUtilities::GraphqlBody
  u.graphql_errors = BucketlistInspirationUtilities::GraphqlErrors
  u.result_basic = BucketlistInspirationUtilities::ResultBasic
  u.result_body = BucketlistInspirationUtilities::ResultBody
  u.result_headers = BucketlistInspirationUtilities::ResultHeaders
  u.transform_request = BucketlistInspirationUtilities::TransformRequest
  u.transform_response = BucketlistInspirationUtilities::TransformResponse
}
