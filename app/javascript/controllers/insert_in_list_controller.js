import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["items", "form"]
  connect() {
    // console.log("I am connected to the insert in lsit controller!")
    // console.log("my form", this.formTarget)
    // console.log("my items", this.itemsTarget)
    // console.log("my controller", this.element)
    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
  }

  send(event) {
    event.preventDefault()
    // console.log(event)
    const url = this.formTarget.action
    const options = {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": this.csrfToken },
      body: new FormData(this.formTarget)
    }
    fetch(url, options)
    .then(response => response.json())
    .then((data) => {
      // console.log(data)
      // console.log('review', data.inserted_item)
      // console.log('form', data.form)
      this.itemsTarget.insertAdjacentHTML('afterbegin', data.inserted_item)

    })
  }
}
