import "bootstrap";
import "../shared/_counter";
import "../shared/_arrowUp";

var algoliasearch = require('algoliasearch');
var algoliasearch = require('algoliasearch/reactnative');
var algoliasearch = require('algoliasearch/lite');

var product = algoliasearch("GQCVPW2V11", "4d1306e35a7d7d9098574a3cea8a0eb4");
var index = product.initIndex('Product');

const rowproducts = document.getElementById("row-products");
const searchbar = document.getElementById("search-bar");

searchbar.addEventListener("keyup", (event) => {
  index.search(event.target.value, { hitsPerPage: 10, page: 0, filters: '' })
  .then(function searchDone(content) {
    rowproducts.innerHTML = '';
    content["hits"].forEach((element) => {
      let photo = "";
      if (element.img_url != null) {
        photo = `<div class="product-image" style="background-image:linear-gradient(-225deg, rgba(0,0,0,0.4), rgba(0,0,0,0)), url('${element.img_url}')">
                          <p class="category">${element.category.toUpperCase()}</p>
                        </div>`;
      } else {
        photo = `<div class="product-image" style="background-image:linear-gradient(-225deg, rgba(0,0,0,0.4), rgba(0,0,0,0)), url('https://picsum.photos/800/500?image=20&gravity=center')">
                          <p class="category">${element.category.toUpperCase()}</p>
                       </div>`;
      }
      const bloc = `<div class="col-xs-12 col-sm-6 col-md-4">
                      <div class="white-box">
                        ${photo}
                        <h3 class="product-title">${element.name}</h3>
                        <div class="product-content">
                          <p><strong>Seller:</strong> ${element.user_name}</p>
                          <p><strong>Price:</strong> $${element.price}</p>
                        </div>
                        <a href="${element.url}" class= "main-btn product-btn">See More</a>
                      </div>
                    </div>`
      rowproducts.insertAdjacentHTML("beforeend", bloc);
    })
  })
  .catch(function searchFailure(err) {
    console.error(err);
  });
})
