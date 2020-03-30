import {Component, OnInit, ElementRef, TemplateRef, ViewChild, Input, Output, EventEmitter} from '@angular/core';

@Component({
    selector:  'zj-transfer',
    template:  `<div class="select">
        <div class="select-item">
            <select multiple="multiple" id="{{id}}">
                <option *ngFor="let option1 of resourdata" value="{{option1.value}}">{{option1.label}}</option>
            </select>
        </div>
        <div class="btn-item" >
            <p style="margin-top: 50px;"><button nz-button (click)="right()">>></button></p>
            <p><button nz-button (click)="left()"><<</button></p>
        </div>
        <div class="select-item"> 
            <select multiple="multiple" id="{{id + 1}}">
                <option *ngFor="let option2 of targetdata" value= "{{option2.value}}">{{option2.label}}</option>
            </select>
        </div>
    </div>`,
    styles  :  [
            `
            ::-webkit-scrollbar {
                width: 0px
            }

            .select {
                width: 350px;
                height: 150px;
               
            }
            .select div {
                float: left;
            }
            option{
                -moz-appearance:none; /* Firefox */
                -webkit-appearance:none; /* Safari 和 Chrome */
                appearance:none;
            }

            .select .select-item {
            }

            .select .select-item select {
                width: 150px;
                height: 150px;
                padding: 4px;
                font-size: 14px;
            }

            .btn-item p {
                margin-top: 5px;
            }

            .btn-item p button {
                width: 50px;
                height: 30px;
                cursor: pointer;
                font-size: 14px;
                border: 1px solid #EEEEEE;
                font-size: 20px;
            }
        `
    ]
})
export class TransferComponent implements OnInit {

    @Input() id: string;
    @Input() resourdata: {label: string, value: string, img: string}[];
    @Input() targetdata: {label: string, value: string, img?: string}[];
    @Output() dataChange = new EventEmitter<any>();

    flag1: string;
    flag2: string;

    afterdata: {resource: {label: string, value: string}[], target: {label: string, value: string}[]};

    constructor() {

    }

    ngOnInit() {
        this.afterdata = {resource: [], target: []};
        this.flag1 = '#' + this.id;
        this.flag2 = '#' + this.id + '1';
    }
    right() {
        this.afterdata.resource = [];
        this.afterdata.target = [];
        if ($(this.flag1 + ' option').is(':selected')) {
                $(this.flag1 + ' option:selected').appendTo(this.flag2);
                // console.log($('#select2 option').val());
                for (let i = 0; i < $(this.flag2 + ' option').length; i++ ) {
                        this.afterdata.target.push({label: $(this.flag2 + ' option').get(i).textContent, value: $(this.flag2 + ' option').get(i).getAttribute('value')})
                       console.log($(this.flag2 + ' option').get(i).textContent);
                        console.log('ffffffffffffffffffffffffffffffffffffffffffff')
                       console.log($(this.flag2 + ' option').get(i).getAttribute('value'));
                }

               for (let i = 0; i < $(this.flag1 + ' option').length; i++ ) {
                   this.afterdata.resource.push({label: $(this.flag1 + ' option').get(i).textContent, value: $(this.flag1 + ' option').get(i).getAttribute('value')})
                  // console.log($('#select2 option').get(i).innerText);
                  // console.log($('#select2 option').get(i).getAttribute('value'));
               }
            this.dataChange.emit(this.afterdata);
        }
    }

    left() {
        this.afterdata.resource = [];
        this.afterdata.target = [];
        if ($(this.flag2 + ' option').is(':selected')) {
            $(this.flag2 + ' option:selected').appendTo(this.flag1);
            // console.log($('#select2 option').val());
            for (let i = 0; i < $(this.flag2 + ' option').length; i++ ) {
                this.afterdata.target.push({label: $(this.flag2 + ' option').get(i).textContent, value: $(this.flag2 + ' option').get(i).getAttribute('value')})
                // console.log($('#select2 option').get(i).textContent);
                // console.log($('#select2 option').get(i).getAttribute('value'));
            }

            for (let i = 0; i < $(this.flag1 + ' option').length; i++ ) {
                this.afterdata.resource.push({label: $(this.flag1 + ' option').get(i).textContent, value: $(this.flag1 + ' option').get(i).getAttribute('value')})
                // console.log($('#select2 option').get(i).textContent);
                // console.log($('#select2 option').get(i).getAttribute('value'));
            }
            this.dataChange.emit(this.afterdata);
        }
    }
}
