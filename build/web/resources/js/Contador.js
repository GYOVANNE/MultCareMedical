class Contador {
    constructor() {
        this._cont = 0;
    }
    _contPlusPlus() {
        this._cont++;
    }
    get contValue() {
        return this._cont - 1;
    }
    get contIncrement() {
        let conta = this._cont;
        this._contPlusPlus();
        return conta;
    }
}