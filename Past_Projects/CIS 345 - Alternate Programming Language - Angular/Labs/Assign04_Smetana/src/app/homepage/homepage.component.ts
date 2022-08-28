import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-homepage',
  templateUrl: './homepage.component.html',
  styleUrls: ['./homepage.component.css']
})
export class HomepageComponent implements OnInit {

  constructor(private router: Router) { }

  ngOnInit(): void {
  }


//Navigates a user to the login page
  navigateLoginPage(){
    this.router.navigate(['/login-page']);
  }

//Navigates a user to the flight page
navigateFlightPage(){
  this.router.navigate(['/search-component']);
}
}
