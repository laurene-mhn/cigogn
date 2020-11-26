import { event } from "jquery";

const flip = () => {
  const infos = document.querySelector(".infos-btn")
  const card = document.querySelector(".flip-card-inner")
  const back = document.querySelector(".back-btn")
  infos.addEventListener("click", (event) => {
    card.classList.add("flip-action")
  })
  back.addEventListener("click", (event) => {
    card.classList.remove("flip-action")
  })
}

export {flip};
