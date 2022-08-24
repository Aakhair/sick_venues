import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Array
  }
  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    const marker = this.markerValue[0]
    new mapboxgl.Marker()
    .setLngLat([ marker.lng, marker.lat])
    .addTo(this.map)
  }

  #fitMapToMarkers() {
    const marker = this.markerValue[0]
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([marker.lng, marker.lat])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 3 })
  }
}
