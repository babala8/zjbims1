import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class UnelockTaskService {

    private unelockTasksUrl = `${environment.SERVER_URL}` + '/elock/unelockTask';

    constructor(private http: HttpClient,
                private location: Location) {
    }

    getUnelockTasks(params): Observable<any> {
        return this.http.get<any>(this.unelockTasksUrl + '/qryUnelockTasks', {
            params: params
        });
    }


    addUnelockTask(params): Observable<any> {
        return this.http.post<any>(this.unelockTasksUrl + '/addUnelockTask', params);
    }

    getBankManagerPersionList(): Observable<any> {
        return this.http.get<any>(this.unelockTasksUrl + '/qryDeskmanagers');
    }
}
