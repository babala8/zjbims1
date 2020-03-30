export class BenchmarkAppParam {
    constructor(
        public appsId?: string,
        public version?: string,
        public paramKey?: string,
        public paramValue?: string,
        public remark?: string,
        public operateType?: string,
        public paramType?: string,
        public valueScope?: string,
        public inputType?: string,
        public options?: { name: string, value: string, selected?: boolean }[],
        public showFlag?: string,
        public devType?: string,
    ) {
    }
}
