-- DroomVanDeDag entity test

local json = require("dkjson")
local vs = require("utility.struct.struct")
local sdk = require("bucketlist-inspiration_sdk")
local helpers = require("core.helpers")
local runner = require("test.runner")

local _test_dir = debug.getinfo(1, "S").source:match("^@(.+/)")  or "./"

-- main.kit.test.live.strict is true (the default is true): a live
-- request that fails, or a live test missing an input it needs,
-- fails the test.
-- An account with no record for a test to read skips it either way.
local LIVE_STRICT = true


describe("DroomVanDeDagEntity", function()
  it("should create instance", function()
    local testsdk = sdk.test(nil, nil)
    local ent = testsdk:DroomVanDeDag(nil)
    assert.is_not_nil(ent)
  end)

  it("should refuse an invalid request", function()
    local config = require("config_shared")()
    if type(config.feature) ~= "table" or config.feature.validate == nil then
      pending("feature not present in this SDK: validate")
      return
    end
    local client = sdk.test(nil, { feature = { validate = { active = true } } })
    local _, err = client:DroomVanDeDag(nil):load({ ["lang"] = 1 }, nil)
    assert.are.equal("validate_failed", type(err) == "table" and err.code or nil)
  end)

  it("should run basic flow", function()
    local setup = droom_van_de_dag_basic_setup(nil)
    -- Per-op sdk-test-control.json skip.
    local _live = setup.live or false
    for _, _op in ipairs({"load"}) do
      local _should_skip, _reason = runner.is_control_skipped("entityOp", "droom_van_de_dag." .. _op, _live and "live" or "unit")
      if _should_skip then
        pending(_reason or "skipped via sdk-test-control.json")
        return
      end
    end
    local client = setup.client

    -- Bootstrap entity data from existing test data.
    local droom_van_de_dag_ref01_data_raw = vs.items(helpers.to_map(
      vs.getpath(setup.data, "existing.droom_van_de_dag")))
    local droom_van_de_dag_ref01_data = nil
    if #droom_van_de_dag_ref01_data_raw > 0 then
      droom_van_de_dag_ref01_data = helpers.to_map(droom_van_de_dag_ref01_data_raw[1][2])
    end

    -- LOAD
    local droom_van_de_dag_ref01_ent = client:DroomVanDeDag(nil)
    local droom_van_de_dag_ref01_match_dt0 = {}
    local droom_van_de_dag_ref01_data_dt0_loaded, err = droom_van_de_dag_ref01_ent:load(droom_van_de_dag_ref01_match_dt0, nil)
    assert.is_nil(err)
    assert.is_not_nil(droom_van_de_dag_ref01_data_dt0_loaded)

  end)
end)

function droom_van_de_dag_basic_setup(extra)
  runner.load_env_local()

  local entity_data_file = _test_dir .. "../../.sdk/test/entity/droom_van_de_dag/DroomVanDeDagTestData.json"
  local f = io.open(entity_data_file, "r")
  if f == nil then
    error("failed to read droom_van_de_dag test data: " .. entity_data_file)
  end
  local entity_data_source = f:read("*a")
  f:close()

  local entity_data = json.decode(entity_data_source)

  local options = {}
  options["entity"] = entity_data["existing"]

  local client = sdk.test(options, extra)

  -- Generate idmap via transform.
  local idmap = vs.transform(
    { "droom_van_de_dag01", "droom_van_de_dag02", "droom_van_de_dag03" },
    {
      ["`$PACK`"] = { "", {
        ["`$KEY`"] = "`$COPY`",
        ["`$VAL`"] = { "`$FORMAT`", "upper", "`$COPY`" },
      }},
    }
  )

  -- Whether *_ENTID supplied the idmap, read before env_override consumes
  -- it: without it, the ids a live flow binds are the fixture's synthetic ones.
  local entid_env_raw = os.getenv("BUCKETLIST_INSPIRATION_TEST_DROOM_VAN_DE_DAG_ENTID")
  local idmap_overridden = entid_env_raw ~= nil and entid_env_raw:match("^%s*{") ~= nil

  local env = runner.env_override({
    ["BUCKETLIST_INSPIRATION_TEST_DROOM_VAN_DE_DAG_ENTID"] = idmap,
    ["BUCKETLIST_INSPIRATION_TEST_LIVE"] = "FALSE",
    ["BUCKETLIST_INSPIRATION_TEST_EXPLAIN"] = "FALSE",
  })

  local idmap_resolved = helpers.to_map(
    env["BUCKETLIST_INSPIRATION_TEST_DROOM_VAN_DE_DAG_ENTID"])
  if idmap_resolved == nil then
    idmap_resolved = helpers.to_map(idmap)
  end

  if env["BUCKETLIST_INSPIRATION_TEST_LIVE"] == "TRUE" then
    local merged_opts = vs.merge({
      -- FIRST, so the generated fields below win: sdk-test-control.json's
      -- test.client.options adds to the live client, it does not redirect it.
      runner.live_client_options(),
      {
      },
      extra or {},
    })
    client = sdk.new(helpers.to_map(merged_opts))
  end

  local live = env["BUCKETLIST_INSPIRATION_TEST_LIVE"] == "TRUE"
  return {
    client = client,
    data = entity_data,
    idmap = idmap_resolved,
    env = env,
    explain = env["BUCKETLIST_INSPIRATION_TEST_EXPLAIN"] == "TRUE",
    live = live,
    synthetic_only = live and not idmap_overridden,
    now = os.time() * 1000,
  }
end
