import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';
import {SessionService} from '@core/session.service';

@Injectable()
export class SysMenuService {

    constructor(private http: HttpClient,
                private session: SessionService) {
    }

    // 查询自定义参数信息列表
    getMenus(): Observable<any> {
        return this.http.get(`${environment.SERVER_URL}` + '/system/menu');
    }

    /**
     * 获取全量按钮列表
     */
    getButtons() {
        return this.http.get(`${environment.SERVER_URL}` + '/system/button/qryAllButtons');
    }

    saveMenus(menus) {
        return this.http.put('/system/menu', menus);
    }

    qrySelfDefinedParamInfo(params): Observable<any> {
        return this.http.get(`${environment.SERVER_URL}` + '/system/menu');
    }

    /**
     * 是否有按钮权限
     * @param menuName
     * @param btnName
     */
    checkBtn(menuName: string, btnName: string): boolean {
        const buttons = this.session.getUserSession().buttons;
        return buttons && buttons.includes(menuName + btnName);
    }

    /**
     * 是否需要审批
     * @param menuName
     * @param btnName
     */
    checkAudit(menuName: string, btnName: string): boolean {
        const auditFlags = this.session.getUserSession().auditFlags;
        let checkAudit = false;
        /*  //对应的菜单，按钮，审批标志符都符合时，返回true，需要审批*/
        auditFlags.forEach(btn => {
            if (btn.button.menu.name == menuName && btn.button.name == btnName && btn.button.auditFlag == 'Y') {
                checkAudit = true;
            }
        });
        return false;
    }
}
