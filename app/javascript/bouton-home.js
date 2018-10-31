$(document).ready(function(){
  $('button[href^="#"]').on('click', function(evt){ // uniquement quand je clique sur le bouton avec un id #
    evt.preventDefault();
    var target = $(this).attr('href');
       /* le sélecteur $(html, body) permet de corriger un bug sur chrome
       et safari (webkit) */
    $('html, body')
       // on arrête toutes les animations en cours
    .stop()
    .animate({scrollTop: $(target).offset().top}, 600 );
    });
});
