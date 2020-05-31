/* global top */

jQuery(window).load(function () {
    setTimeout(function () {
        document.getElementById("content").style.display = "block";
    }, 1500);
    setTimeout(function () {
        document.getElementById("loading").style.display = "none";
    }, 1500);
});

$(document).ready(function () {
    $('.alert').fadeIn();
    setTimeout(function () {
        $('.alert').fadeOut();
    }, 7000);

});

$('input#txt_consulta').quicksearch('table#tabela tbody tr');
var $th = $('.tableFixHead').find('thead th');
$('.tableFixHead').on('scroll', function () {
    $th.css('transform', 'translateY(' + this.scrollTop + 'px)');
});

var COMPARTILHAR = "Deseja compartilhar o Documento Clinico?";
var EXCLUIR = "Deseja excluir o Documento Clinico?";
var SHARE = "share";
var SHARED = "shared";
var REMOVE = "delete";
var REMOVE_H = "deletehistoric";
var OPLINK = 1;
var OPNOLINK = 0;

function caixaConfirmacao(id, mensagem, metodo) {
    let alerta = document.querySelector("#alerta");
    alerta.innerHTML = render(id, mensagem, metodo);
}

function caixaConfirmacaoOutro() {
    let alerta = document.querySelector("#alerta");
    alerta.innerHTML = renderOther();
}

function render(id, mensagem, metodo) {
    const idarquivo = id;
    let template = `
<div class="modal fade" id="_visualizar" tabindex="-1" role="dialog" aria-labelledby="_visualizar" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Janela de confirmação</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
                </div>
                <div class="modal-body">
                 ${mensagem}
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                <input  onclick="window.location.href = '${metodo}?id=${idarquivo}'" type="submit" id="submit" class="btn btn-info" value="Confirmar">
                </div>
            </div>
        </div>
    </div>`;
    return template;
}

function renderOther() {
    let template = `
    <div class="modal fade" id="_criar" tabindex="-1" role="dialog" aria-labelledby="_criarTitle" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Janela de confirmação</h5>
                    <button onclick="" type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Deseja criar o documento?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                    <input type="submit" id="submit" class="btn btn-info" value="Gerar">
                </div>
            </div>
        </div>
    </div>`;
    return template;
}

