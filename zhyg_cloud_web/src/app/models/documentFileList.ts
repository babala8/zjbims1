export class DocumentFileList {
    constructor(
        public documentType?: string,
        public fileName?: string,
        public diskPath?: string,
        public diskName?: string,
        public createTime?: string,
        public lastUpdateTime?: string,
        public fileSize?: string,
        public diskFreeSpace?: string,
        public filePro?: string,
        public fileType?: string,
    ) {

    }
}
