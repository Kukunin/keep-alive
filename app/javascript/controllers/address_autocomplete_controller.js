import { Controller } from "stimulus"

let regions = []

export default class extends Controller {
  static targets = ["search", "latitude", "longitude", "region", "district", "city", "address"];

  initialize() {
    regions = JSON.parse(this.regionTarget.dataset['regions']);
  }

  connect() {
    this.initAutocomplete();
  }

  initAutocomplete() {
    $(this.searchTarget).autocomplete({
      source: function (request, response) {
        $.ajax({
          url: 'https://nominatim.openstreetmap.org/search?format=json&addressdetails=1&accept-language=uk&countrycodes=UA',
          data: { q: request.term },
          success: locations => {
            response(locations.map(location => ({ label: location.display_name, location: location })));
          },
          error: () => response([])
        });
      },
      select: (e, ui) => {
        const { location, location: { address } } = ui.item;

        this.latitudeTarget.value  = location.lat || null;
        this.longitudeTarget.value = location.lon || null;
        this.regionTarget.value    = this.selectRegion(address) || null;
        this.districtTarget.value  = address.district || null;
        this.cityTarget.value      = address.city || null;
        this.addressTarget.value   = this.prepareAddress(address) || null;
      },
      change: (e, ui) => {
        if (!ui.item) {
          this.latitudeTarget.value  = null;
          this.longitudeTarget.value = null;
          this.regionTarget.value    = null;
          this.districtTarget.value  = null;
          this.cityTarget.value      = null;
          this.addressTarget.value   = null;
          this.searchTarget.value    = null;
        }
      }
    });
  }

  selectRegion(address) {
    const regionWords = address.state.split(' ');
    return regions.find(region => region.split(' ').find(regionWord => regionWords.includes(regionWord)));
  }

  prepareAddress(address) {
    return [address.road, address.house_number].filter(e => e).join(', ');
  }
}
