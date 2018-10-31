const interest = document.getElementById("interest");
const  subject = document.getElementById("subject");
const resultat = document.getElementById("results");

const searchWord = (event) => {
  const interestValue = document.getElementById("interest").value;

  resultat.innerText = " ";

  fetch()
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      data.words.forEach((word) => {
        resultat.insertAdjacentHTML("afterbegin", `<li>${word}</li>`);
      });
    });
};


interest.addEventListener("keyup", searchWord);

subject.addEventListener("keyup", searchWord);
