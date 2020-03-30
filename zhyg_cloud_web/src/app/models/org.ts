import {OrgType} from './orgType';

export class Org {
    constructor(public no?: string,
                public name?: string,
                public linkman?: string,
                public address?: string,
                public telephone?: string,
                public mobile?: string,
                public fax?: string,
                public email?: string,
                public parentOrg?: Org,
                public parentOrgNo?: string,
                public parentOrgName?: string,
                public note?: string,
                public orgType?: OrgType,
                public orgTypeNo?: string,
                public orgTypeName?: string,
                public region?: string,
                public city?: string,
                public x?: string,
                public y?: string,
                public clrCenterNo?: string,
                public clrCenterName?: string,
                public status?: string,
                public clrCenterFlag?: number,
                public cashTruckNum?: string,
                public orgGrade?: string,
                public superOrg?: Org,
                public cupAreaCode?: string,
                public areaNoProvince?: string,
                public areaNoCity?: string,
                public areaNoCounty?: string,
                public isSelfhelp?: string,
    ) {

    }
}
