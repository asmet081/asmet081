/*
Alex Smetana
05/02/2022
CIS 345
 */

//inspried by https://angular.io/guide/form-validation

import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { FormBuilder } from '@angular/forms';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { Output, Input } from '@angular/core';

import {

  Router
} from '@angular/router';

@Component({
  selector: 'app-login-page',
  templateUrl: './login-page.component.html',
  styleUrls: ['./login-page.component.css']
})
export class LoginPageComponent implements OnInit {

  @Output() form: FormGroup;
  constructor(private readonly fb: FormBuilder,
    private router: Router,) {

    //Form - form group
    //Username and password fields. Used for a validation
    this.form = this.fb.group({
      username: ['', [Validators.required, Validators.minLength(5), Validators.maxLength(20), Validators.pattern('[a-zA-Z ]*')]],
      password: ['', [Validators.required, Validators.minLength(8), Validators.maxLength(20), Validators.pattern('[a-zA-Z ]*'), this.validatorPassword]]
    });


  }
  
  getForm(){
    return this.form;
  }

  //submitForm Method
  //Use on a button. If the form is valid, logs the form and alerts the user if the form is correct or not.
  submitForm() {
    if (this.form.valid) {
      console.log(this.form.getRawValue());
      alert('UserName and Password Is Correct');
      this.router.navigate(['/search-component']);

    } else {
      console.log('There is a problem with the form');
      alert('UserName or Password Is Invalid');
    }
  }


  //Validator Password
  //Checks if the input is valid. Returns an error if it isnt valid
  validatorPassword(fc: FormControl) {
    const value = fc.value as string;
    const isInvalid = 'password' === value.trim().toLowerCase();
    return isInvalid ? { passwordError: 'Password is not a strong password' } : null;
  }

  ngOnInit(): void {
  }






}
