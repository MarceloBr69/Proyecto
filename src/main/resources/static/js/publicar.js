//Previsualizar imagen antes de subirlo. 
document.getElementById('file').onchange=function(e){
    let reader = new FileReader(); //Almacena y accede a los archivos
    reader.readAsDataURL(e.target.files[0]); 
    reader.onload=function(){
        let preview = document.getElementById('preview'); //Obtiene el formato del div 
        imagen = document.createElement('img'); //Crea un elemento de tipo img
        imagen.src=reader.result;
        imagen.style.width ="6em"; //Ajusta un tamano 
        preview.append(imagen);//Crea un div con la imagen subida  
    }
}