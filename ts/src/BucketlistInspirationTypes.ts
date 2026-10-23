// Typed models for the BucketlistInspiration SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
// params (op.<name>.points[].g.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface DroomVanDeDag {
  attribution: Record<string, any>
  date: string
  dream: Record<string, any>
  language: string
  requestedTheme: string | null
  scope: string
}

export interface DroomVanDeDagLoadMatch {
  lang?: string
  scope?: string
  theme?: string
}

