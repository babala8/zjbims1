export class BenchmarkApps {
    constructor(
        public appsId?: string,
        public appsName?: string,
        public versionBusNo?: string,
        public versionNo?: string,
        public modelName?: string,
        public selected: boolean = false,
        public updateMode?: string,
        public updateTime?: Date,
        public synMode?: string,
        public description?: string,
        public versionInfo?: string,
    ) {
    }
}
