let save = document.querySelector(".heart");


save.addEventListener("click", (event) => {
  let save1 = document.querySelector(".heart");
  save1.remove()
  save1.insertAdjacentHTML('beforeend', `<div class="heartsaved" > <i class="fas fa-heart"></i> </div>`);
  ;

 });
