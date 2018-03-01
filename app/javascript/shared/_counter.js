const productDescription = document.getElementById('product_description');
const offerDescription = document.getElementById('offer_description');
const countProduct = document.getElementById('count-product');
const countOffer = document.getElementById('count-offer');

function count(event, count, counter, textarea) {
  let c = count - textarea.value.split('').length;
  counter.innerText = `${c} characters remaining`;
  if (c > count) {
    c = count;
  }
  if (c < 0 ) {
    counter.style.color = 'red';
  } else {
    counter.style.color = 'black';
  }
}

if (productDescription) {
  productDescription.addEventListener('keyup', function(e) {
    count(e, 1000, countProduct, productDescription);
  });
}

if (offerDescription) {
  offerDescription.addEventListener('keyup', function(e) {
    count(e, 500, countOffer, offerDescription);
  });
}
