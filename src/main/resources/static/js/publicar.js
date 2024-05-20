//Previsualizar imagen antes de subirlo. 
document.getElementById('imagen').onchange = function (e) {
    let reader = new FileReader(); // Almacena y accede a los archivos
    reader.readAsDataURL(e.target.files[0]);
    reader.onload = function () {
        let preview = document.getElementById('preview'); // Obtiene el formato del div
        let imagen = document.createElement('img'); // Crea un elemento de tipo img
        imagen.src = reader.result;
        imagen.style.width = "6em"; // Ajusta un tamaño
        preview.appendChild(imagen); // Crea un div con la imagen subida

        // Event listener para eliminar la imagen al hacer clic en ella
        imagen.addEventListener('click', function () {
            preview.innerHTML = '';
            document.getElementById('imagen').value = '';
        })
         // Event listener para cambiar el estilo al pasar el mouse sobre la imagen
        imagen.addEventListener('mouseover', function () {
            imagen.style.cursor = 'pointer'; // Cambiar el cursor a pointer
            imagen.style.filter = 'brightness(40%)'; // Cambiar el brillo de la imagen
        });

        // Event listener para restaurar el estilo al quitar el mouse de la imagen
        imagen.addEventListener('mouseout', function () {
            imagen.style.filter = 'brightness(100%)'; // Restaurar el brillo de la imagen
        });
    }
}

document.getElementById("nameLogo").addEventListener("click", function() {
  // Cambiar la URL por la de la página a la que quieres redirigir
  window.location.href = "/home";
});