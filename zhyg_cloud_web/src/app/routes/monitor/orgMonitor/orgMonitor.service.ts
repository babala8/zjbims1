import {Injectable} from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {environment} from '@env/environment';
import {Location} from '@angular/common';

@Injectable()
export class OrgMonitorService {

    constructor(private http: HttpClient,
                private location: Location) {
    }


    back() {
        this.location.back();
    }

}
