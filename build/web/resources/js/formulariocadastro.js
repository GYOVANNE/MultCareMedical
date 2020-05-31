/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//var titulo = document.getElementById("pai");
//var conteudo = document.getElementById("filho");
//var btnElementadd = document.getElementById('add');
//var btnElementsave = document.getElementById('save');
//var corpo = document.getElementById('corpo');
//var arr = [];
//
//btnElementsave.onclick = function () {
//    if (titulo.value !== "") {
//        let component = document.createElement('div');
//        component.setAttribute('title', `${titulo.value}`);
//        component.innerText = titulo.value;
//        arr.push(component);
//    }
//};
//
//
//btnElementadd.onclick = function () {
//    if (titulo.value !== "" && conteudo.value !== "") {
//        for (let i = 0; i < arr.length; i++) {
//            if (arr[i].title === titulo.value) {
//                let component = document.createElement('span');
//                component.innerHTML = conteudo.value;
//                arr[i].appendChild(component);
//            }
//        }
//    }
//};

$('#btnTitulo').click(function () {
    var txtTitulo = $('#inpudTitulo').val();
    if (txtTitulo !== '') {
        $('#inpudTitulo').val('').focus();
        $('.lista').append('<div>' + txtTitulo + '</div>');
    } else {
    }
});

$(document).on('click', '.item', function () {
    $(this).remove();
});

$('#btnConteudo').click(function () {
    var txtConteudo = $('#inpudConteudo').val();
    if (txtConteudo !== '') {
        $('#inpudConteudo').val('').focus();
        $('.lista').append('<div>' + txtConteudo + '</div>');
    } else {
    }
});


$(document).on('click', '.item', function () {
//    $(this).remove();
});

