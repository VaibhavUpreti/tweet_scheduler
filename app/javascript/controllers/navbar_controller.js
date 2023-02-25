import { Controller } from '@hotwired/stimulus'

import { toggle} from 'el-transition'


export default class extends Controller {
  static targets = ['openHeaderAl', 'openProfileMenu', 'openProfileMobile'];

  connect() {
    this.openHeaderAlTarget.addEventListener('click' , this.toggleDropdownAlMenu)
    this.openProfileMenuTarget.addEventListener('click' , this.toggleDropdownMore)
    this.openProfileMobileTarget.addEventListener('click' , this.toggleDropdownMobile)

  }
  toggleDropdownAlMenu() {
    toggle(document.getElementById('dropdown-items-al'));
  }

  toggleDropdownMore() {
    toggle(document.getElementById('menu-toggle-device'));
  }
  toggleDropdownMobile() {
    toggle(document.getElementById('menu-toggle-mobile-profile'));
  }
}