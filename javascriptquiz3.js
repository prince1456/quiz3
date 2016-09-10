// Visit this page http://vancouver.craigslist.ca and write a piece of jQuery code that changes all the links on the home page to have a color red if the link's anchor text includes the pattern eal

$(document).ready(function(){
if ($('a:contains("eal")')) {
  $($('a:contains("eal")')).css('color', 'red');
}
});
// ALSO
  $($('a:contains("eal")')).css('color', 'red');



// Visit a Wikipedia page like this one: https://en.wikipedia.org/wiki/Rule_of_three_(computer_programming) then write a peice of jQuery code that will fadeOut any link you click on without following the link. (5%)

$(document).ready(function() {

  $("a").on("click", function(event) {
    var link = event.target
      console.log(link);
      $(link).attr("href", "#").fadeOut();
  })


})
