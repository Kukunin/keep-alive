import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "submit" ]

  connect() {
    this.submitTarget.style.display = 'none'
  }

  submit() {
    this.submitTarget.click()
  }
}
