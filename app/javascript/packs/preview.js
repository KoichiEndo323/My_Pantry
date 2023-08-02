if (document.URL.match(/new|edit/)){
  document.addEventListener('DOMContentLoaded', () => {

    const createImageHTML = (blob) => {
      const imageElement = document.getElementById('new-image');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('class', 'new-img')
      blobImage.setAttribute('src', blob);
      imageElement.innerHTML = "";
      imageElement.appendChild(blobImage);
    };


    if (document.getElementById('food_image') !== null) {
      document.getElementById('food_image').addEventListener('change', (e) =>{
        const imageElement = document.getElementById('new-image');
        if (imageElement){
          imageElement.innerHTML = "";
        }
        const file = e.target.files[0];
        const blob = window.URL.createObjectURL(file);
        createImageHTML(blob);
      });
    }

    if (document.getElementById('article_image') !== null) {
      document.getElementById('article_image').addEventListener('change', (e) =>{
        const imageElement = document.getElementById('new-image');
        if (imageElement){
          imageElement.innerHTML = "";
        }
        const file = e.target.files[0];
        const blob = window.URL.createObjectURL(file);
        createImageHTML(blob);
      });
    }

    if (document.getElementById('menu_image') !== null) {
      document.getElementById('menu_image').addEventListener('change', (e) =>{
        const imageElement = document.getElementById('new-image');
        if (imageElement){
          imageElement.innerHTML = "";
        }
        const file = e.target.files[0];
        const blob = window.URL.createObjectURL(file);
        createImageHTML(blob);
      });
    }
  });
}
