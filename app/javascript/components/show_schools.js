function showSchools(event) {
  const fullName = event.currentTarget.innerText
  const diplomaName = fullName.substring(12, fullName.length-1).toLowerCase();
  document.getElementById('school_list_' + diplomaName).classList.toggle('invisible');

}

let school_buttons = document.querySelectorAll('.show_schools');
school_buttons.forEach((button) => {
  button.addEventListener('click', showSchools);
});


export { showSchools };
