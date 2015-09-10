$(document).ready(function(){
  $('.create-link').on('click', function(event){
    event.preventDefault();
    console.log("Wooohooo");

    var request = $.ajax({
      url:
      type:
      dataType:
    });
    request.done(function(response)
      console.log("yay");
      console.log(response);
      // display modal
  })
});