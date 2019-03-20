import places from 'places.js';

let initAutocomplete = () => {
  let addressInput = document.querySelector('.address-auto');
  if (addressInput) {
    places({ container: addressInput });
  }
};

// const initAutocompleteBis = () => {
//   const addressInputBis = document.querySelector('.address-auto');
//   if (addressInputBis) {
//     places({ container: addressInputBis });
//   }
// };

export { initAutocomplete };
// export { initAutocompleteBis };
