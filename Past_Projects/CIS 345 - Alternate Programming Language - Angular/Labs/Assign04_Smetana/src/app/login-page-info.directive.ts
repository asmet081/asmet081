import { Directive } from '@angular/core';
import { AbstractControl, FormControl, NG_VALIDATORS, ValidationErrors, Validator, ValidatorFn } from '@angular/forms';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

@Directive({
  selector: '[appLoginPageInfo]'
})
export class LoginPageInfoDirective {

  constructor() { }

  forbiddenUsernames = ['Larry', 'Bob'];

  validate(control: AbstractControl): ValidationErrors | null {
    if (this.forbiddenUsernames.indexOf(control.value) !== -1) {
      return {'nameIsForbidden': true};
    }
    return null;
  }

}
