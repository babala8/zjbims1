import {AppVersion} from './appVersion';

export class AppInfo {
    constructor(
        public appsId?: string,
        public appsName?: string,
        public appsType?: string,
        public appsCatalog?: string,
        public appsCatalogName?: string,
        public limitCatalog?: string,
        public limitOrg?: string,
        public devCatalogName?: string,
        public orgNoList?: string,
        public appsStatus?: string,
        public versionPath?: string,
        public logoPath?: string,
        public addUser?: string,
        public addTime?: string,
        public description?: string,
        public expand?: boolean,
        public versions?: AppVersion[]
    ) {
    }
}
