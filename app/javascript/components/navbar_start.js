const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar_start');
  console.log(navbar);
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight/2) {
        navbar.classList.add('navbar_start-white');
      } else {
        navbar.classList.remove('navbar_start-white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };