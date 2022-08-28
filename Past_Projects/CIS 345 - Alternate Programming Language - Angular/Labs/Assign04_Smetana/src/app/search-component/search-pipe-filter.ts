/*
Alex Smetana
04/29/2022
CIS 345
*/

//Code inspired by
//https://jhapriti09.medium.com/custom-search-filter-pipe-for-table-search-in-angular-10-4b8a0f42513d

import { Pipe, PipeTransform } from "@angular/core";


//Pipe searchFilter to search through a table
@Pipe({
  name: "searchFilter"
})

export class SearchFilterPipe implements PipeTransform {

  /*
  Transform method
  Filters the pipe to lowercase and checks if it is null.
  */
  transform(value: any, args?: any): any {
    if (!value) return null;
    if (!args) return value;

    args = args.toLowerCase();
    debugger;
    return value.filter(function (flight: any) {
      return JSON.stringify(flight)
        .toLowerCase()
        .includes(args);
    });
  }
}


