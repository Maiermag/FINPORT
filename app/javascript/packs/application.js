// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import {openNav, closeNav} from '../components/sideMenu';
import { initChart } from '../plugins/init_chart';
import { initTvChart } from '../plugins/init_tvchart';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  innitSideMenu();
  // initChart();
  var testData = JSON.parse(document.querySelector('#test-chart').dataset.chartDay);
  // var dayData = JSON.parse(document.querySelector('#tv-chart').dataset.day);
  console.log("testData")
  console.log(testData)
  initTvChart(testData);
});
const innitSideMenu = () => {
   if (document.querySelector("#mySidenav")) {
    document.querySelector("#open_button").addEventListener("click", openNav);

    document.querySelector("#close_button").addEventListener("click", closeNav);
   }
  
};
  