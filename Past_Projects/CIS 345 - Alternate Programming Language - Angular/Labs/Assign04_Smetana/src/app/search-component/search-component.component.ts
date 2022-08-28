import { Component, OnInit } from '@angular/core';
import { flightInfo } from '../models/flightInfo.model';
import { flightRepository } from '../models/flightRepository';
import { datasourceModule } from '../models/datasourceModule';
import { CartService } from '../cart.service';
import { ActivatedRoute } from '@angular/router';
import { LoginPageComponent } from '../login-page/login-page.component';

@Component({
  selector: 'app-search-component',
  templateUrl: './search-component.component.html',
  styleUrls: ['./search-component.component.css']
})


export class SearchComponentComponent implements OnInit {

  //Cart insprired by: https://angular.io/start/start-data
  searchText: string = '';
  flightRepository: flightRepository;
  cart: datasourceModule;


  constructor(
    private route: ActivatedRoute,
    private cartService: CartService) {
    this.flightRepository = new flightRepository();
    this.cart = new datasourceModule();

  }

  ngOnInit(): void {
  }

  /*
  Allows a user to add a flight to a cart
  Alerts the user afterwards
  */
  addToCart(flight: flightInfo) {
    this.cartService.addToCart(flight);
    window.alert('Your flight has been added to the cart!');

  }


}