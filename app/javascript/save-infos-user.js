let save = document.querySelectorAll(".heart");

save.forEach((heart) => {
  heart.addEventListener("click", (event) => {
    event.currentTarget.classList[2].replace("heart","heartsaved");
    });
 });

