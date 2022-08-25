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
    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }))
  }

  #addMarkersToMap() {
    const marker = this.markerValue[0]
    const popup = new mapboxgl.Popup().setHTML(marker.info_window)
    const customMarker = document.createElement("div")

    customMarker.className = "marker"
    customMarker.style.backgroundImage = `url('${marker.image_url}')`
    customMarker.style.backgroundSize = "contain"
    customMarker.style.width = "40px"
    customMarker.style.height = "40px"

    new mapboxgl.Marker(customMarker)
    .setLngLat([ marker.lng, marker.lat])
    .setPopup(popup)
    .addTo(this.map)
  }

  #fitMapToMarkers() {
    const marker = this.markerValue[0]
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([marker.lng, marker.lat])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 3 })
  }
}
