class Pedido {
  final String uid;
  final String modelo;
  final String sabor_trio1;
  final String sabor_trio2;
  final String sabor_trio3;
  final String sabor_barra1;
  final String sabor_barra2;
  final String data_pedido;
  final String tipo;

  Pedido(
      this.uid,
      this.modelo,
      this.sabor_trio1,
      this.sabor_trio2,
      this.sabor_trio3,
      this.sabor_barra1,
      this.sabor_barra2,
      this.data_pedido,
      this.tipo);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'modelo': modelo,
      'sabor_trio1': sabor_trio1,
      'sabor_trio2': sabor_trio2,
      'sabor_trio3': sabor_trio3,
      'sabor_barra1': sabor_barra1,
      'sabor_barra2': sabor_barra2,
      'data_pedido': data_pedido,
      'tipo': tipo
    };
  }

  factory Pedido.fromJson(Map<String, dynamic> json) {
    return Pedido(
      json['uid'],
      json['modelo'],
      json['sabor_trio1'],
      json['sabor_trio2'],
      json['sabor_trio3'],
      json['sabor_barra1'],
      json['sabor_barra2'],
      json['data_pedido'],
      json['tipo']
    );
  }
}
