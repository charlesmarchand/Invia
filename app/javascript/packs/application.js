import "bootstrap";
import { autocomplete } from '../components/autocomplete';
import { addSchool } from '../components/add_school';


// $(document).ready(function(){
//   $('button[href^="#"]').on('click', function(evt){
//     evt.preventDefault();
//     var target = $(this).attr('href');
//         le sélecteur $(html, body) permet de corriger un bug sur chrome
//        et safari (webkit)
//     $('html, body')
//        // on arrête toutes les animations en cours
//     .stop()
//     .animate({scrollTop: $(target).offset().top}, 600 );
//     });
// });
let add_buttons = document.querySelectorAll('.btn_add');
add_buttons.forEach((button) => {
  button.addEventListener('click', addSchool);
});


autocomplete();

