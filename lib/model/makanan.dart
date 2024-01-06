class Makanan {
  String? id;
  String name;
  String deskripsi;
  String linkimage;
  String harga;

  Makanan({
    this.id,
    required this.name,
    required this.deskripsi,
    required this.linkimage,
    required this.harga
});

factory Makanan.fromJson(Map<String, dynamic> json) => Makanan(
  id : json['id'],
  name: json['name'], 
  deskripsi: json['deskripsi'], 
  linkimage: json['linkimage'],
  harga: json['harga']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "deskripsi": deskripsi,
    "linkimage": linkimage,
    "harga": harga,
  };
}