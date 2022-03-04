import { Controller } from "stimulus"

let regions = [];
let street = '';

export default class extends Controller {
  static targets = ["search", "latitude", "longitude", "region", "district", "city", "address", "apartment"];

  initialize() {
    regions = Array.from(this.regionTarget.querySelectorAll('option')).map(option => option.value);
  }

  connect() {
    this.watchApartmentChange();
    this.hideApartmentField();
    this.initAutocomplete();
    this.setSearchValidation();
  }

  setSearchValidation() {
    this.searchTarget.addEventListener('invalid', function () { this.setCustomValidity(this.dataset['errorMessage']) });
    this.searchTarget.addEventListener('input', function () { this.setCustomValidity('') });
  }

  invalidateSearch() {
    this.searchTarget.dispatchEvent(new Event('invalid'));
    this.searchTarget.reportValidity();
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

        this.regionTarget.selectedIndex = this.getRegionIndex(address);
        this.latitudeTarget.value       = location.lat || null;
        this.longitudeTarget.value      = location.lon || null;
        this.districtTarget.value       = address.district || null;
        this.cityTarget.value           = address.city || null;
        this.addressTarget.value        = street = this.prepareAddress(address) || null;

        address.house_number ? this.showApartmentField() : this.hideApartmentField();
      },
      change: (e, ui) => {
        if (!ui.item) {
          this.regionTarget.selectedIndex = 0;
          this.latitudeTarget.value       = null;
          this.longitudeTarget.value      = null;
          this.districtTarget.value       = null;
          this.cityTarget.value           = null;
          this.addressTarget.value        = null;
          this.apartmentTarget.value      = null;

          this.invalidateSearch();
          this.hideApartmentField();
        }
      }
    });
  }

  getRegionIndex(address) {
    if (address.city === 'Київ') return regions.indexOf('Київська');

    if (!address.state) return 0;

    const regionWords = address.state.split(' ');

    return regions.findIndex(region => {
      return region.split(' ').find(regionWord => regionWords.includes(regionWord));
    });
  }

  prepareAddress(address) {
    return [address.road, address.house_number].filter(e => e).join(', ');
  }

  showApartmentField() {
    this.apartmentTarget.parentElement.className = '';
  }

  hideApartmentField() {
    this.apartmentTarget.parentElement.className = 'hidden';
  }

  watchApartmentChange() {
    this.apartmentTarget.addEventListener('change', this.completeAddress);
  }

  completeAddress = (e) => {
    this.addressTarget.value = street && `${street}, кв. ${e.target.value}`;
  }
}
