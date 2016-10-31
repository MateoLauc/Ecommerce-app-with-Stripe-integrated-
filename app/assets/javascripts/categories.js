$(document).ready(function(){

$( "form" ).on( "submit","#pretraga", function(e){
    e.preventDefault();
    
    $.ajax({
      url: this.action,
      dataType: 'JSON'
    });

});

});