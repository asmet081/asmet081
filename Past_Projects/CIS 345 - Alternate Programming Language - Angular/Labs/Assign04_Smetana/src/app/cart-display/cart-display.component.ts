import { Component, OnInit, Output } from '@angular/core';
import { CartService } from '../cart.service';
import { SearchComponentComponent } from '../search-component/search-component.component';
import { Router } from '@angular/router';
import { flightInfo } from '../models/flightInfo.model';

@Component({
  selector: 'app-cart-display',
  templateUrl: './cart-display.component.html',
  styleUrls: ['./cart-display.component.css']
})
export class CartDisplayComponent implements OnInit {

  total: number = 0;
  @Output() items = this.cartService.getItems();

  constructor(
    private cartService: CartService,
    private router: Router
  ) { }

  ngOnInit(): void {
  }

  //Clears the entire cart, not one item.
  clearCart() {
    this.cartService.clearCart();
    window.alert('Your flights has been removed');
    this.router.navigate(['/search-component']);
  }

  //Removes one item from the cart
  removeCurrentCart() {
    this.cartService.removeCurrentCart();
    window.alert('Your flight has been removed');
  }


  //Creates the total based on the items in the cart
  @Output() addTotal() {
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

  //Method to naviagate to the invoice page.
  navigateInvoice() {
    this.router.navigate(['/invoice']);
  }


}
