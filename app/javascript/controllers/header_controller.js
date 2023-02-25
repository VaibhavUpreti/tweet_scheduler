import { Controller } from '@hotwired/stimulus'

import { toggle} from 'el-transition'


export default class extends Controller {
  static targets = ['openUserMenu','userAuthLink', 'openMoreMenu', 'openMenuMobile'];

  connect() {
    this.openUserMenuTarget.addEventListener('click' , this.toggleDropdownMenu)
    this.openMoreMenuTarget.addEventListener('click' , this.toggleDropdownMore)
    this.openMenuMobileTarget.addEventListener('click' , this.toggleMobileMenu)

    this.userAuthLinkTargets.forEach((link) => {
      link.addEventListener('click', (e) => {
        document.getElementById('modal-trigger').click();
      });
    });
  }

  toggleDropdownMenu() {
    toggle(document.getElementById('menu-dropdown-items'));
  }

  toggleDropdownMore() {
    toggle(document.getElementById('menu-more-items'));
  }
  toggleMobileMenu() {
    toggle(document.getElementById('menu-toggle-mobile'));
  }
}