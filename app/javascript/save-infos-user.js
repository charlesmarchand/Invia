let save = document.querySelectorAll(".heart");

save.forEach((heart) => {
  heart.addEventListener("click", (event) => {
    const item = `<i class="fas fa-heart"></i>`;
    event.currentTarget.insertAdjacentHTML("beforebegin", item);
    event.currentTarget.remove();
    });
 });

