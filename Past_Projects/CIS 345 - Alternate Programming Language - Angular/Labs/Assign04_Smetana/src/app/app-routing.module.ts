import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CartDisplayComponent } from './cart-display/cart-display.component';
import { HomepageComponent } from './homepage/homepage.component';
import { InvoiceComponent } from './cart-display/invoice/invoice.component';
import { LoginPageComponent } from './login-page/login-page.component';
import { SearchComponentComponent } from './search-component/search-component.component';

const routes: Routes = [
  { path: 'homepage', component: HomepageComponent },
  { path: 'login-page', component: LoginPageComponent },
  { path: 'search-component', component: SearchComponentComponent },
  { path: 'cart-display', component: CartDisplayComponent },
  { path: 'invoice', component: InvoiceComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
