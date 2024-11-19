const heroText = document.getElementById('hero-text');
const words = ['Fast', 'Simple', 'Powerful', 'Easy'];
let wordIndex = 0;

function typeWriter() {
  if (wordIndex === words.length) {
    wordIndex = 0;
  }

  const currentWord = words[wordIndex];
  let i = 0;
  
  function type() {
    if (i < currentWord.length) {
      heroText.innerHTML += currentWord.charAt(i);
      i++;
      setTimeout(type, 100);
    } else {
      setTimeout(erase, 1000);
    }
  }

  function erase() {
    if (i > 0) {
      heroText.innerHTML = currentWord.substring(0, i - 1);
      i--;
      setTimeout(erase, 50);
    } else {
      wordIndex++;
      setTimeout(typeWriter, 500);
    }
  }

  type();
}

document.addEventListener('DOMContentLoaded', typeWriter);
}

document.addEventListener('DOMContentLoaded', type);
