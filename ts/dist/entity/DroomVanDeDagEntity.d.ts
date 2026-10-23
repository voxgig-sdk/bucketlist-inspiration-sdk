import { BucketlistInspirationEntityBase } from '../BucketlistInspirationEntityBase';
import type { BucketlistInspirationSDK } from '../BucketlistInspirationSDK';
import type { Control } from '../types';
import type { DroomVanDeDag, DroomVanDeDagLoadMatch } from '../BucketlistInspirationTypes';
declare class DroomVanDeDagEntity extends BucketlistInspirationEntityBase<DroomVanDeDag> {
    constructor(client: BucketlistInspirationSDK, entopts: any);
    make(this: DroomVanDeDagEntity): DroomVanDeDagEntity;
    load(this: any, reqmatch?: DroomVanDeDagLoadMatch, ctrl?: Control): Promise<DroomVanDeDagEntity>;
}
export { DroomVanDeDagEntity };
