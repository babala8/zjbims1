export class OrgTree {
    constructor(public id: string,
                public name: string,
                public parentNo: string,
                public children?: OrgTree[]) {
    }
}
