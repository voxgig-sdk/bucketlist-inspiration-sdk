# frozen_string_literal: true

# Typed models for the BucketlistInspiration SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
# params (op.<name>.points[].g.params[]). Member types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Ruby types are unenforced; these YARD
# annotations document the shapes. Do not edit by hand.

# DroomVanDeDag entity data model.
#
# @!attribute [rw] attribution
#   @return [Hash]
#
# @!attribute [rw] date
#   @return [String]
#
# @!attribute [rw] dream
#   @return [Hash]
#
# @!attribute [rw] language
#   @return [String]
#
# @!attribute [rw] requestedTheme
#   @return [Object]
#
# @!attribute [rw] scope
#   @return [String]
DroomVanDeDag = Struct.new(
  :attribution,
  :date,
  :dream,
  :language,
  :requestedTheme,
  :scope,
  keyword_init: true
)

# Request payload for DroomVanDeDag#load.
#
# @!attribute [rw] lang
#   @return [String, nil]
#
# @!attribute [rw] scope
#   @return [String, nil]
#
# @!attribute [rw] theme
#   @return [String, nil]
DroomVanDeDagLoadMatch = Struct.new(
  :lang,
  :scope,
  :theme,
  keyword_init: true
)

