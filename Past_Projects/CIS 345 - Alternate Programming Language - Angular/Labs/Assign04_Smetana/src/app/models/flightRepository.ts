//Alex Smetana
//03/10/2022
//Assign03

import { NgForm } from "@angular/forms";
import { flightInfo } from "./flightInfo.model";
import { datasourceModule } from "./datasourceModule";
import { Component, EventEmitter, Input, OnInit, Output } from "@angular/core";
@Component({
    template: ''
})



export class flightRepository {

    //dataSource and SimpleDataSource defined by directions. Assigned in the constructor for functionality.
    private dataSource: datasourceModule;
    private flightInfo: flightInfo[];
    private filter: flightInfo[];

    constructor() {
        this.dataSource = new datasourceModule();
        this.flightInfo = this.dataSource.getData();
        this.filter = this.flightInfo;
    }

    //Gets the current Product
    getFlight() {
        return this.flightInfo;
    }



}
