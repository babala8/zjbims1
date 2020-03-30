import {Pipe, PipeTransform} from '@angular/core';

@Pipe({name: 'dateStringFormat'})
export class DateStringFormatPipe implements PipeTransform {
    transform(value: string, format: string): string {
        if (value.length < 8) {
            return '';
        }
        const yearEnd = format.lastIndexOf('y');
        const monthStart = format.indexOf('M');
        const monthEnd = format.lastIndexOf('M');
        const dayStart = format.indexOf('d');

        let result = value.substring(0, 4);
        result += format.substring(yearEnd + 1, monthStart);
        result += value.substring(4, 6);
        result += format.substring(monthEnd + 1, dayStart);
        result += value.substring(6, 8);

        if (value.length == 14) {
            const dayEnd = format.lastIndexOf('d');
            const hourStart = format.indexOf('H');
            const hourEnd = format.lastIndexOf('H');
            const miniteStart = format.indexOf('m');
            const miniteEnd = format.lastIndexOf('m');
            const secondStart = format.indexOf('s');
            result += format.substring(dayEnd + 1, hourStart);
            result += value.substring(8, 10);
            result += format.substring(hourEnd + 1, miniteStart);
            result += value.substring(10, 12);
            result += format.substring(miniteEnd + 1, secondStart);
            result += value.substring(12, 14);
        }

        return result;
    }
}
