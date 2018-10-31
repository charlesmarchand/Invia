function addSchool(event) {
  console.log(event)
  const target = event.currentTarget;
  const choices = document.querySelector('.formation-description')
  choices.insertAdjacentHTML("afterbegin", `<a class="school_details" data-remote="true" rel="nofollow" data-method="post" href="/details/${target.dataset.id}">${target.dataset.name}</a>`);
};



export { addSchool };

//<a data-remote="true" href="/jobs/1/studies/1?class=school_details&amp;method=post">/details/${btn_add.dataset.id}</a>${btn_add.dataset.name}
//<h4${btn_add.dataset.name}></h4>`
//<%=link_to "toto", details_path(1), method: :post, class: 'school_details', remote: true %>
