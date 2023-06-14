import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["items", "form"]
  connect() {
    // console.log("I am connected to the insert in lsit controller!")
    // console.log("my form", this.formTarget)
    // console.log("my items", this.itemsTarget)
    // console.log("my controller", this.element)
  }

  send(event) {
    event.preventDefault()
    console.log(event)
    fetch(url, options)
  }
}
