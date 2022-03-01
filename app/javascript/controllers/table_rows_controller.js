import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "th", "link" ]

  connect() {
    if (this.hasThTarget) {
      this.thTarget.remove()
    }
    [...this.linkTargets].forEach((link) => {
      const tr = link.closest('tr')
      const td = link.closest('td')
      tr.classList.add('hover:cursor-pointer')
      tr.addEventListener('click', () => link.click())
      td.parentElement.removeChild(td)
    })
  }
}
