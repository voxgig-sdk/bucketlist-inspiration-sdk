"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const node_test_1 = require("node:test");
const __1 = require("..");
const definition_runner_1 = require("./definition-runner");
const utility_1 = require("./utility");
// Generated from the API definition, not from the model this SDK was built
// from: the route, the declared query parameters, the credential the security
// scheme names, and the definition's own response example.
const PLAN = [
    {
        "entity": "droom_van_de_dag",
        "accessor": "DroomVanDeDag",
        "op": "load",
        "method": "GET",
        "path": "/api/droom-van-de-dag",
        "args": [],
        "select": {
            "lang": "nl",
            "scope": "nederland",
            "theme": "v1"
        },
        "headers": [],
        "cookies": [],
        "responseMedia": [
            "application/json"
        ],
        "query": [
            "scope",
            "lang",
            "theme"
        ],
        "queryArgs": [
            {
                "name": "lang",
                "wire": "lang"
            },
            {
                "name": "scope",
                "wire": "scope"
            },
            {
                "name": "theme",
                "wire": "theme"
            }
        ],
        "auth": null,
        "status": 200,
        "sample": {
            "date": "2026-01-01",
            "scope": "nederland",
            "language": "nl",
            "requestedTheme": "x",
            "dream": {
                "title": "x",
                "slug": "x",
                "theme": "x",
                "destination": "x",
                "image": {
                    "url": "x",
                    "alt": "x"
                },
                "canonicalUrl": "x",
                "referralUrl": "x"
            },
            "attribution": {
                "name": "x",
                "url": "x",
                "documentationUrl": "x"
            }
        },
        "idField": "id"
    }
];
(0, node_test_1.describe)('definition', () => {
    for (const point of PLAN) {
        (0, node_test_1.test)(point.entity + '.' + point.op + ' ' + point.method + ' ' + point.path, async (t) => {
            const control = (0, utility_1.isControlSkipped)('entityOp', point.entity + '.' + point.op, 'definition');
            if (control.skip) {
                t.skip(control.reason || 'skipped via sdk-test-control.json');
                return;
            }
            await (0, definition_runner_1.runDefinitionPoint)(__1.SDK, point);
        });
    }
});
//# sourceMappingURL=definition.test.js.map