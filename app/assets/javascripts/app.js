var Item = Item || {};

Item.show = function(e){
  var id = this.id;
  window.location.href = "/items/" + id
  return false;
}

Item.siteSource = function(e){
  e.stopPropagation();
  var site = this.src;
  console.log(site);
  window.open(site);
  return false;
}

Item.redirect = function(e){
  window.open('https://chrome.google.com/webstore/detail/bcatcher/geihceklicaflemdjjdhiepfpihklhno');
}

$(document).ready(function(){
  $('.my-item').on("click", Item.show);
  $('.url').on("click", Item.siteSource);
  $('#downloadbtn').on("click", Item.redirect);
})