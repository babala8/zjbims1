export class AppVersionMerge {
    constructor(
        public appsId?: string,
        public appsName?: string,
        public versions?: string[],
        public versionBusNo?: string,
        public selectedVersion: string = '选择版本',
        public selected = false,
        public updateMode?: string,
        public updateTime?: Date,
    ) {
    }
}
