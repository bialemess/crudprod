// ignore_for_file: prefer_final_fields

class Produto {
  String _nome;
  int _codigo;

  int _quantidade;
  int _preco;


  Produto(this._nome, this._codigo, this._quantidade, this._preco);

  Produto.produtogeral(
      
      this._nome,
      this._codigo,
      this._quantidade,
      this._preco,
      );
  Produto.produtoupdate(
      this._nome,
      this._codigo,
      this._quantidade,
      this._preco,
      );

      
  Produto.produto(this._nome, this._codigo, this._quantidade, this._preco);

  Produto.produtoupdate2(
      this._nome,
      this._codigo,
      this._quantidade,
      this._preco,
      );

  get nome => _nome;
  get codigo => _codigo;
  get quantidade => _quantidade;
  get preco => _preco;

  set nome(value) => _nome = nome;
  set codigo(value) => _codigo = codigo;
  set quantidade(value) => _quantidade = quantidade;
  set preco(value) => _preco = preco;

 
}
