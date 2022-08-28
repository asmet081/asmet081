import { Injectable } from '@angular/core';
import { flightInfo } from './models/flightInfo.model';
import { flightRepository } from './models/flightRepository';

@Injectable({
  providedIn: 'root'
})
export class CartService {

  constructor() { }

  private items: flightInfo[] = [];


  ngOnInit(): void {
  }


  /* . . . */

  addToCart(flight: flightInfo) {
    this.items.push(flight);
  }

  getItems() {
    return this.items;
  }


  clearCart() {
    let i: number = 0;
    while (i < this.items.length) {
      this.items.pop();
    }
  }

  removeCurrentCart() {
    this.items.pop();
  }

}
