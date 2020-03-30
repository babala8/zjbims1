import { PreloadingStrategy,  Route } from '@angular/router';
import { Observable } from 'rxjs/Rx';

/**
 * 预加载策略
 */

// 定制应用初始化5s后开始异步加载其余模块 需要在 app.modules.ts中的 prodivers 中添加这个类，以实现依赖注入。
// export class CustomPreloadingStrategy implements PreloadingStrategy {
//     preload(route: Route, fn: () => Observable<boolean>): Observable<boolean> {
//         return Observable.of(true).delay(5000).flatMap((_: boolean) => fn());
//     }
// }

// 当路由中配置data: {preload: true}时预加载

export class CustomPreloadingStrategy implements PreloadingStrategy {
    preload(route: Route, load: Function): Observable<any> {
        return route.data && route.data && route.data['preload'] ? load() : Observable.of(null);
    }
}
