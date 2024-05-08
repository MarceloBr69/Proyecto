/**
 * 
 */

 function validarRut(rut) {
    var regex = /^((\d{1,2}\.?)(\d{3}\.?){2}-?[\dkK])$/;
    return regex.test(rut);
}

function validarCorreo(correo) {
    var regexCorreo = /^[^\s@]+@[^\s@]+\.[^\s@\s?]+$/;
    return regexCorreo.test(correo);
}
