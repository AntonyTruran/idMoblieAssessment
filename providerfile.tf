provider "google" {
  credentials = "${file("./private/idmoblieassessment-f432de18ffbf.json")}"
  project     = "idmoblieassessment"
  region      = "europe-west2"
}