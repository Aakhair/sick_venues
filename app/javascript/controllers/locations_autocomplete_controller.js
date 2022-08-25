import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="locations-autocomplete"
export default class extends Controller {
  static values = { apiKey: String }

  static targets = ["locations"]
  connect() {
    console.log("hi");
    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,postcode,locality,neighborhood,address"
    })
    this.geocoder.addTo(this.element)
    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
   }

   #setInputValue(event) {
    this.locationsTarget.value = event.result["place_name"]
  }

  #clearInputValue() {
    this.locationsTarget.value = ""
  }

  disconnect() {
    this.geocoder.onRemove()
  }
  }
