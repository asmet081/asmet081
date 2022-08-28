import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { SearchComponentComponent } from './search-component/search-component.component';
import { LoginPageComponent } from './login-page/login-page.component';
import { ReactiveFormsModule } from '@angular/forms';
import { NavBarComponent } from './nav-bar/nav-bar.component';
import { FormsModule } from '@angular/forms';
import { DatePipe } from '@angular/common';
import { LoginPageInfoDirective } from './login-page-info.directive';
import { SearchFilterPipe } from './search-component/search-pipe-filter';
import { CartDisplayComponent } from './cart-display/cart-display.component';
import { HomepageComponent } from './homepage/homepage.component';
import { FooterComponent } from './footer/footer.component';
import { InvoiceComponent } from './cart-display/invoice/invoice.component';

@NgModule({
  declarations: [
    AppComponent,
    SearchComponentComponent,
    LoginPageComponent,
    NavBarComponent,
    LoginPageInfoDirective,
    SearchFilterPipe,
    CartDisplayComponent,
    HomepageComponent,
    FooterComponent,
    InvoiceComponent
  ],
  imports: [
    FormsModule,
    BrowserModule,
    AppRoutingModule,
    ReactiveFormsModule
  ],
  providers: [DatePipe],
  bootstrap: [AppComponent]
})
export class AppModule { }

