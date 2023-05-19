class Pedido {
  final String uid;
  final String titulo;
  final String descricao;

  Pedido (this.uid, this.titulo, this.descricao);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'titulo': titulo,
      'descricao': descricao
    };
  }

  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido(
      json['uid'],
      json['titulo'],
      json['descricao'],
    );
  }
}