function addSchool(event) {
  const target = event.currentTarget;
  const choices = document.querySelector('.formation-description')
  choices.insertAdjacentHTML("afterbegin", `<a class="school_details" data-remote="true" rel="nofollow" data-method="post" href="/details/${target.dataset.id}">${target.dataset.name}</a>`);
};

let add_buttons = document.querySelectorAll('.btn_add');
add_buttons.forEach((button) => {
  button.addEventListener('click', addSchool);
});

export { addSchool };




