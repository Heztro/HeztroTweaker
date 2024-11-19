const heroText = document.getElementById('hero-text');
const words = ['Simple', 'Free', 'Fast', 'Powerful', 'Easy'];

let wordIndex = 0;
let characterIndex = 0;
let currentWord = '';
let isDeleting = false;

function type() {
  if (wordIndex === words.length) {
    wordIndex = 0;
  }

  currentWord = words[wordIndex];

  if (isDeleting) {
    heroText.textContent = currentWord.slice(0, characterIndex);
    characterIndex--;

    if (characterIndex < 0) {
      isDeleting = false;
      wordIndex++;
      setTimeout(type, 1000);
    } else {
      setTimeout(type, 100);
    }
  } else {
    heroText.textContent = currentWord.slice(0, characterIndex);
    characterIndex++;

    if (characterIndex > currentWord.length) {
      isDeleting = true;
      setTimeout(type, 2000);
    } else {
      setTimeout(type, 200);
    }
  }
}

document.addEventListener('DOMContentLoaded', type);
