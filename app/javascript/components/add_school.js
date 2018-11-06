function addSchool(event) {
  console.log('on ajoute');
  const target = event.currentTarget;
  const choices = document.querySelector(`.parcours-${target.dataset.diploma}-schools`);
  console.log(choices);
  choices.insertAdjacentHTML("afterbegin", `<a class="school_details" data-remote="true" rel="nofollow" data-method="post" href="/details/${target.dataset.id}">${target.dataset.name}</a>`);
  choices.innerText = `<a class="school_details" data-remote="true" rel="nofollow" data-method="post" href="/details/${target.dataset.id}">${target.dataset.name}</a>`;

};


function addSchools() {
  console.log("add schools ");

let add_buttons = document.querySelectorAll('.btn_add');
add_buttons.forEach((button) => {
  button.addEventListener('click', addSchool);
});
}


export { addSchools };




