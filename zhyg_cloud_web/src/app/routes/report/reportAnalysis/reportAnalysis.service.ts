import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {environment} from '@env/environment';

@Injectable()
export class ReportAnalysisService {

    private faultQueryUrl = `${environment.SERVER_URL}` + '/shepherd/fault';

}
