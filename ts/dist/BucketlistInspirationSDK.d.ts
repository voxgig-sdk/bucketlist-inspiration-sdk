import { DroomVanDeDagEntity } from './entity/DroomVanDeDagEntity';
export type * from './BucketlistInspirationTypes';
import { inspect } from 'node:util';
import type { Context, Feature } from './types';
import { config } from './Config';
import { BucketlistInspirationEntityBase } from './BucketlistInspirationEntityBase';
import { Utility } from './utility/Utility';
import { BaseFeature } from './feature/base/BaseFeature';
declare const stdutil: Utility;
type DirectResult = {
    ok: false;
    err: any;
    status?: undefined;
    headers?: undefined;
    data?: undefined;
} | {
    ok: boolean;
    status: number;
    headers: any;
    data: any;
    err?: any;
};
declare class BucketlistInspirationSDK {
    _mode: string;
    _options: any;
    _utility: Utility;
    _features: Feature[];
    _rootctx: Context;
    constructor(options?: any);
    options(): any;
    utility(): any;
    prepare(fetchargs?: any): Promise<any>;
    direct(fetchargs?: any): Promise<DirectResult>;
    _rawRequest(fetchargs?: any): Promise<DirectResult>;
    graphql(query: string, variables?: any, ctrl?: any): Promise<any>;
    DroomVanDeDag(entopts?: Record<string, any>): DroomVanDeDagEntity;
    static test(testoptsarg?: any, sdkoptsarg?: any): BucketlistInspirationSDK;
    tester(testopts?: any, sdkopts?: any): BucketlistInspirationSDK;
    toJSON(): {
        name: string;
    };
    toString(): string;
    [inspect.custom](): string;
}
declare const SDK: typeof BucketlistInspirationSDK;
export { stdutil, config, BaseFeature, BucketlistInspirationEntityBase, BucketlistInspirationSDK, SDK, };
export type { DirectResult };
