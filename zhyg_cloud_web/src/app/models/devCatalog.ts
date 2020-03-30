export class DevCatalog {
    constructor(
        public no?: string,
        public name?: string,
        public monitorType?: string,
        public selected: boolean = false,
    ) {
    }
}
