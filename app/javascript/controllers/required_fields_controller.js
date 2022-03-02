import { Controller } from "stimulus"

const SELECTOR = 'input[required], select[required], textarea[required]'
export default class extends Controller {
  connect() {
    [...this.element.querySelectorAll(SELECTOR)].forEach((field) => {
      const label = this.element.querySelector(`label[for="${field.id}"]`)
      if (label) {
        label.classList.add('required')
      }
    })
  }
}
