export class AppVersion {
    constructor(
        public logicId?: string,
        public appId?: string,
        public versionBusNo?: string,
        public versionAppNo?: string,
        public preVersion?: string,
        public preWsapProjects?: string,
        public preWsapVersion?: string,
        public dependVersion?: string,
        public versionStatus?: string,
        public versionServerPath?: string,
        public versionClientPath?: string,
        public addUser?: string,
        public addTime?: string,
        public execBeforeUpdate?: string,
        public execAfterUpdate?: string,
        public versionDescription?: string,
        public versionFileMd5?: string
    ) {
    }
}
