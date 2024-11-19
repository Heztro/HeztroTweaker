const words = ["Simple", "Free", "Fast", "Efficient", "Powerful"];
const changingWord = document.getElementById("changing-word");
let currentIndex = 0;

function changeWord() {
  changingWord.classList.remove("highlight");
  setTimeout(() => {
    changingWord.textContent = words[currentIndex];
    changingWord.classList.add("highlight");
    currentIndex = (currentIndex + 1) % words.length;
  }, 200);
}

setInterval(changeWord, 2000);
