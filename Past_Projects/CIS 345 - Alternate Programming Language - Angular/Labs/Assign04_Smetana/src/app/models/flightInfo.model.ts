export class flightInfo {

    private _name: string;
    private _code: string;
    private _day: string;
    private _timeLeave: number;
    private _cityLeave: string;
    private _timeArrive: number;
    private _cityArrive: string;
    private _price: number;
    private _seats: number;
    private _quantity: number;

    public constructor(code: string, name: string, day: string, timeLeave: number, cityLeave: string, timeArrive: number, cityArrive: string, price: number, seats: number, quantity: number) {
        this._code = code;
        this._name = name;
        this._day = day;
        this._timeLeave = timeLeave;
        this._cityLeave = cityLeave;
        this._timeArrive = timeArrive;
        this._cityArrive = cityArrive;
        this._price = price;
        this._seats = seats;
        this._quantity = quantity;
    }

    //Getters & setters

    //Code
    public get code() {
        return this._code;
    }
    public set Code(value: string) {
        this._code = value;
    }

    //Name
    public get name() {
        return this._name;
    }
    public set name(value: string) {
        this._name = value;
    }

    //Day
    public get day() {
        return this._day;
    }
    public set day(value: string) {
        this._day = value;
    }

    //TimeLeave
    public get timeLeave() {
        return this._timeLeave;
    }
    public set timeLeave(value: number) {
        this._timeLeave = value;
    }

    //CityLeave
    public get cityLeave() {
        return this._cityLeave;
    }
    public set cityLeave(value: string) {
        this._cityLeave = value;
    }

    //TimeArrive
    public get timeArrive() {
        return this._timeArrive;
    }
    public set Name(value: number) {
        this._timeArrive = value;
    }

    //CityLeave
    public get cityArrive() {
        return this._cityArrive;
    }
    public set cityArrive(value: string) {
        this._cityArrive = value;
    }

    //Price
    public get Price() {
        return this._price;
    }
    public set Price(value: number) {
        this._price = value;
    }

    //Seats
    public get seats() {
        return this._seats;
    }
    public set seats(value: number) {
        this._seats = value;
    }

    //Code
    public get quantity() {
        return this._quantity;
    }
    public set quantity(value: number) {
        this._quantity = value;
    }

    public toString(): string {
        return `Product info: \nCode: ${this._name}, Name: ${this._code}, Category: ${this._day}, Price: $${this._timeLeave}, Price: $${this._cityLeave}, Price: $${this._timeArrive}, Price: $${this._cityArrive}, Price: $${this._seats}`;
    }
}
