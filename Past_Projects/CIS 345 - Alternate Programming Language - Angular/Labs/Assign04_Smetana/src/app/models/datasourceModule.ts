//Alex Smetana
//03/10/2022
//Assign03

import { flightInfo } from "./flightInfo.model";

export class datasourceModule {
    private _data: flightInfo[];

    /*
    Constructor for datasource. Is populated by products assigned in directions.
    Static data sources. Random just for demonstration purposes.
    */
    constructor() {
        this._data = new Array<flightInfo>(
            new flightInfo("1000", "Madison to Milwaukee", "4/20", 4, "Madison", 5, "Milwaukee", 200, 9, 1),
            new flightInfo("1001", "Los Angeles to Boston", "4/17", 2, "Los Angeles", 9, "Boston", 60, 50, 1),
            new flightInfo("1002", "London to New York", "4/23", 1, "London", 5, "New York", 90, 7, 1),
            new flightInfo("1003", "Atlanta to Seatle", "4/30", 5, "Atlanta", 10, "Seatle", 23, 43, 1),
            new flightInfo("1004", "Austin to Dallas", "5/2", 12,"Austin", 5, "Dallas", 65, 12, 1),

            new flightInfo("1005", "Bejing to New York", "4/29", 4, "Bejing", 9, "New York", 360, 7, 1),
            new flightInfo("1006", "Orlando to Las Vegas", "5/7", 1, "Orlando", 9, "Las Vegas", 340, 32, 1),
            new flightInfo("1007", "Mexico City to Boston", "5/16", 4, "Mexico City", 10, "Boston", 50, 54, 1),
            new flightInfo("1008", "Denver to Miami", "5/31", 3, "Denver", 10, "Miami", 60, 2, 1),
            new flightInfo("1009", "Fairbanks to Seatle", "6/8", 5,"Fairbanks", 7, "Seatle", 80, 4, 1),

            new flightInfo("1005", "Denver to Mexico City", "4/2", 1, "Denver", 9, "Mexico City", 70, 5, 1),
            new flightInfo("1006", "Las Vegas to Toronto", "5/17", 4, "Las Vegas", 6, "Toronto", 145, 2, 1),
            new flightInfo("1007", "New York to Boston", "5/12", 7, "New York", 9, "Boston", 90, 43, 1),
            new flightInfo("1008", "Stevens Point to Mexico City", "5/4", 7, "Stevens Point", 95, "Mexico City", 60, 34, 1),
            new flightInfo("1009", "Stevens Point to Madison", "6/18", 6,"Stevens Point", 7, "Madison", 170, 1, 1),

            new flightInfo("1010", "Madison to Dallas", "4/26", 1, "Madison", 6, "Dallas", 900, 2, 1),
            new flightInfo("1011", "Boston to Miami", "5/10", 2, "Boston", 3, "Miami", 35, 7, 1),
            new flightInfo("1012", "Fairbanks to Milwaukee", "5/11", 4, "Fairbanks", 5, "Milwaukee", 55, 23, 1),
            new flightInfo("1013", "Toronto to Stevens Point", "5/4", 2, "Toronto", 8, "Stevens Point", 90, 21, 1),
            new flightInfo("1014", "Washington DC to Orlando", "6/19", 5,"Washington DC", 7, "Orlando", 800, 73, 1));

    }

        //Getter to get Data.
        getData(): flightInfo[] {
            return this._data;
        }
}