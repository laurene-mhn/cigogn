const closeModal = () => {
  const button = document.querySelector(".close");
  button.addEventListener("click", () => {
    const modal = document.querySelector(".modal");
    modal.classList.remove("show");
  }) 
}

const closeModalTwo = () => {
  const buttonTwo = document.querySelector(".btn-research");
  buttonTwo.addEventListener("click", () => {
    const modal = document.querySelector(".modal");
    modal.classList.remove("show");
  }) 
}

export {closeModal};
export {closeModalTwo};
