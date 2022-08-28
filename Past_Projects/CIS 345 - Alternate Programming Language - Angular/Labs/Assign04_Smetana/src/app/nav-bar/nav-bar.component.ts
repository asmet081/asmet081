import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { LoginPageComponent } from '../login-page/login-page.component';
import { CartService } from '../cart.service';
import { SearchComponentComponent } from '../search-component/search-component.component';
import { Router } from '@angular/router';
import { flightInfo } from '../models/flightInfo.model';

@Component({
  selector: 'app-nav-bar',
  templateUrl: './nav-bar.component.html',
  styleUrls: ['./nav-bar.component.css']
})
export class NavBarComponent implements OnInit {

  constructor(private cartService: CartService,
  ) { }

  ngOnInit(): void {
  }

  @Input() items = this.cartService.getItems();

  /*
    Used in the nav bar to display the numbers in the cart
  */
  cartNumber() {
    let i: number = 0;
    while (i < this.items.length) {
      i++;
    }
    return i;
  }

}
