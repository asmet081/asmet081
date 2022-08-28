import { Component, OnInit, Output, Input } from '@angular/core';
import { Router } from '@angular/router';
import { CartService } from 'src/app/cart.service';
import { flightInfo } from 'src/app/models/flightInfo.model';
import { CartDisplayComponent } from '../cart-display.component';

@Component({
  selector: 'app-invoice',
  templateUrl: './invoice.component.html',
  styleUrls: ['./invoice.component.css']
})

export class InvoiceComponent implements OnInit {
  /*
    Alex Smetana
    05/12/2022
    CIS 245
  */

  //Total number. Used in methods for calculating the total.
  private total: number = 0;

  //Flight info
  private current: flightInfo[] = [];

  //Pipe operator for today.
  today: number = Date.now();

  //Generates a random number
  private randNumber = Math.random() * 1000;

  //Cart service from parent
  @Input() items = this.cartService.getItems();


  constructor(
    private cartService: CartService,
    private router: Router) { }

  ngOnInit(): void {
  }

  //Creates the total. Adds up all of the Prices together in the items list.
  @Input() addTotal() {
    let i: number = 0;

    while (i < this.items.length) {
      this.total = this.total + this.items[i].Price;
      i++;
    }
    return this.total
  }

  //Creats the tax based on the toal
  taxTotal() {
    return this.total - (this.total * .95)
  }

  //Creates the total. Tax plus Total.
  grandTotal() {
    return this.total + (this.total - (this.total * .95))
  }

  //Method to print the invoice page
  printThisPage() {
    window.print();
  }

  //Creates a random number for the customer number
  //Taken from https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random
  FgetRandomInt(min: number, max: number) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min) + min); //The maximum is exclusive and the minimum is inclusive
  }

}
