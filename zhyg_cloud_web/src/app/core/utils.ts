import {OrgTree} from '../models/orgTree';

export class TreeUtil {

    /**
     * 构建机构树
     * @param srcArr 机构列表
     * @param srcKey 机构列表中的机构编号字段名
     * @param srcText 机构列表中的机构名字段名
     * @param parentKey 机构列表中的父机构编号字段名
     */
    static build(srcArr: Array<any>, srcKey: string, srcText: string, parentKey: string): Array<any> {
        // 使用Map保证顺序与输入数组顺序相同
        const totalMap = new Map<string, OrgTree>(), retArr = [];

        // 数组转Map
        for (const item of srcArr ) {
            const newItem = new OrgTree(item[srcKey], item[srcText], item[parentKey]);
            totalMap.set(item[srcKey], newItem);
        }

        totalMap.forEach(value => {
            if (value.parentNo && totalMap.get(value.parentNo)) {
                // 非用户所属机构，关联到上一级机构
                const parentNode = totalMap.get(value.parentNo);
                parentNode.children = parentNode.children || [];
                parentNode.children.push(value);
            } else {
                // 用户所属机构，存入结果数组
                retArr.push(value);
            }
        });
        return retArr;
    }
}
