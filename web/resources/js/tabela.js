// mapenando os elementos do DOM
class Controlador {
    constructor(idDaTag) {
        this._tabela = document.querySelector(idDaTag);
        this._contador = new Contador();
        this.valor;
    }
    deletarLinha(index) {
        event.preventDefault();
        console.log(typeof index);
        let id = `#linha_${index}`;
        let child = document.querySelector(id);;
        this._tabela.removeChild(child);

    }
    _formataCampoName(componente,tamanho) {
        
        let strReturn = `${componente}[${this._contador.contIncrement + tamanho}].conteudo`;
        return strReturn;
    }
    _retornaTdDeletar() {
        let deletar = document.createElement("button");

        let tr = document.createElement("tr");
        let td = document.createElement("td");

        deletar.name = `deletar`;
        deletar.className = `btn btn-danger glyphicon glyphicon-remove row-remove`;
        td.appendChild(deletar);
        return td;
    }
    _retornaTr(componente,tamanho) {
        let input = document.createElement("input");

        let tr = document.createElement("tr");
        tr.id = `linha`;
        let td = document.createElement("td");

        input.name = this._formataCampoName(componente,tamanho);
        input.className = `form-control`;
        input.style.borderRadius = "20px";

        td.appendChild(input);
        tr.appendChild(td);
        tr.appendChild(this._retornaTdDeletar());

        $(tr).appendTo($('#linha'));
        $(tr).find("td button.row-remove").on("click", function () {
            $(this).closest("tr").remove();
        });

        return tr;
    }

    update(componente,tamanho) {
        this._tabela.appendChild(this._retornaTr(componente,tamanho));
    }
}

let tabela = new Controlador("#body1");
let exameslaboratoriais = "exameslaboratoriais";

let tabela2 = new Controlador("#body2");
let alergias = "alergias";

let tabela3 = new Controlador("#body3");
let medicamentos = "medicamentos";

let tabela4 = new Controlador("#body4");
let diagnostico = "diagnostico";

let tabela5 = new Controlador("#body5");
let historicomedico = "historicomedico";

let tabela6 = new Controlador("#body6");
let historicofamiliar = "historicofamiliar";

let tabela7 = new Controlador("#body7");
let historicosaude = "historicosaude";

let tabela8 = new Controlador("#body8");
let exames = "exames";

let tabela9 = new Controlador("#body9");
let tratamento = "tratamento";
