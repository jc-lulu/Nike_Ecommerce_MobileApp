class ShoeData {
  final List<ShoeItem> shoes;

  ShoeData(this.shoes);
}

class ShoeItem {
  final String name;
  final String price;
  final String category;
  final String imageUrl;

  ShoeItem(
      {required this.name,
      required this.price,
      required this.category,
      required this.imageUrl});

  factory ShoeItem.fromJson(Map<String, dynamic> json) {
    return ShoeItem(
      name: json['name'],
      price: json['price'],
      category: json['category'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'category': category,
      'imageUrl': imageUrl,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShoeItem &&
        other.name == name &&
        other.price == price &&
        other.category == category &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode =>
      name.hashCode ^ price.hashCode ^ category.hashCode ^ imageUrl.hashCode;
}

final ShoeData shoeData = ShoeData([
  ShoeItem(
      name: "Tatum 2 PF",
      price: "₱12,202",
      category: "Basketball Shoes",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/30648388-71e0-4cd0-b2b3-72e5c458ec58/tatum-2-pf-basketball-shoes-8fp79D.png"),
  ShoeItem(
      name: "Tatum 2 'Sidewalk Chalk' PF",
      price: "₱12,202",
      category: "Basketball Shoes",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/ce8db870-78e9-4de3-be5b-744828105013/tatum-2-sidewalk-chalk-pf-basketball-shoes-SjC3nc.png"),
  ShoeItem(
    name: "Air Jordan 1 Low",
    price: "₱11,033",
    category: "Men's Shoes",
    imageUrl:
        "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/86991b52-33a2-4e41-aace-c05510832f84/air-jordan-1-low-shoes-6Q1tFM.png",
  ),
  ShoeItem(
      name: "Air Jordan 1 Low SE",
      price: "₱12,202",
      category: "Men's Shoes",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/8c73dd3a-cfa4-49ca-b66c-065c233802dc/air-jordan-1-low-se-shoes-FTrFvs.png"),
  ShoeItem(
    name: "Air Jordan 1 Retro High",
    price: "₱15,698",
    category: "Men's Shoes",
    imageUrl:
        "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/c51b161d-0d5a-4879-b192-980e29e0605d/air-jordan-1-retro-high-shoes-9qsmsF.png",
  ),
  ShoeItem(
      name: "Air Jordan 13 Retro 'Dune Red'",
      price: "₱15,698",
      category: "Men's Shoes",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/0c38ab1d-2e36-4eaa-95d6-ae7a34e351d5/air-jordan-13-retro-dune-red-shoes-xcK6vg.png"),
  ShoeItem(
      name: "Air Jordan 9 G",
      price: "₱18,033",
      category: "Golf Shoes",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/13fbb773-4379-4adf-b527-145384637af6/air-jordan-9-g-golf-shoes-nNqtwL.png"),
  ShoeItem(
      name: "Luka 3 PF 'Photo Finish'",
      price: "₱12,810",
      category: "Basketball Shoes",
      imageUrl:
          "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/9469c4fa-c348-42a5-bfb2-4b5206603216/luka-3-pf-photo-finish-basketball-shoes-Mh3NWw.png"),
  ShoeItem(
      name: "Air Jordan 9 'Retro Powder Blue'",
      price: "₱17,489",
      category: "Men's Shoes",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/f30fe9b7-8e3b-4728-b212-5f52c0641e11/air-jordan-9-retro-powder-blue-shoes-scTjJd.png"),
  ShoeItem(
      name: "Jumpman MVP",
      price: "₱14,916",
      category: "Men's Shoes",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/ebdc8f36-bb8d-44f0-ade5-9b676a54d197/jumpman-mvp-shoes-JV1HCs.png"),
  ShoeItem(
      name: "Luka 2 PF",
      price: "₱13,395",
      category: "Basketball Shoes",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/7a332de6-e409-4ab0-a4b1-882d3bc3808a/luka-2-pf-basketball-shoes-N6gmH9.png"),
  ShoeItem(
      name: "Jordan Jumpman",
      price: "₱3,800",
      category: "Men's Slides",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/1aac5d31-132e-428a-b018-8107537e5e99/jordan-jumpman-slides-2C5ffD.png"),
  ShoeItem(
      name: "Jordan Roam",
      price: "₱4,970",
      category: "Slides",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/35362810-0bd2-4e49-8be9-972f0ff06b5b/jordan-roam-slides-XsQbqX.png"),
  ShoeItem(
      name: "Jordan 4 High Retro",
      price: "₱5,805",
      category: "Men's Slides",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/0f61cd4c-8649-43b0-a9ff-d9947bd792be/jordan-hydro-4-retro-slides-QcS72T.png"),
  ShoeItem(
      name: "Jordan Post",
      price: "₱2,873",
      category: "Men's Slides",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/a9d0c205-ba18-4bcc-93df-667bdb8f4d63/jordan-post-slides-l46X9x.png"),
  ShoeItem(
      name: "Jordan Super Play Dongdan",
      price: "₱5,805",
      category: "Men's Slides",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/8d9cfb5c-d3dd-4426-ae3e-5fdcf42e0d51/jordan-super-play-dongdan-slides-Vvms1c.png"),
  ShoeItem(
      name: "Jordan Stay Loyal 3",
      price: "₱11,60",
      category: "Basketball Shoes",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/b9c94fa8-13ff-4c2e-b510-e5321d5ca4f4/jordan-stay-loyal-3-shoes-GNHN2X.png"),
  ShoeItem(
      name: "Air Jordan 1 Mid",
      price: "₱9,906",
      category: "Men's Shoes",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/64689f96-72e6-46c7-817a-55087e2a1fe4/air-jordan-1-mid-shoes-SQf7DM.png"),
  ShoeItem(
      name: "Zion 3 PF",
      price: "₱8,149",
      category: "Basketball Shoes",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/e4b6f79a-ca9b-4aa3-9c70-04f5e0f58ac5/zion-3-pf-basketball-shoes-vTjpz4.png"),
  ShoeItem(
      name: "Air Jordan Legacy 312 Low",
      price: "₱13,426",
      category: "Men's Shoes",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/20624013-bc13-42d8-8819-6fee3e87f9a7/air-jordan-legacy-312-low-shoes-6Vd4Xl.png"),
  ShoeItem(
      name: "Air Jordan XXXVIII Low PF",
      price: "₱16,121",
      category: "Basketball Shoes",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/cbfcf081-33b5-4212-bb0e-cfab6e6d5786/air-jordan-xxxviii-low-pf-basketball-shoes-2lBnKn.png"),
  ShoeItem(
      name: "Tatum 1 'Denim' F",
      price: "₱12,017",
      category: "Basketball Shoes",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/6d59671e-2b39-4e33-b71b-7f8a8e8d9478/tatum-1-denim-pf-basketball-shoes-z5qKCZ.png"),
  ShoeItem(
      name: "Jordan One Take 5 PF",
      price: "₱9,673",
      category: "Basketball Shoes",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/157781a3-6f9c-4220-8607-03f7544e201a/jordan-one-take-5-pf-basketball-shoes-QQ243j.png"),
  ShoeItem(
      name: "Air Jordan 1 Mid",
      price: "₱12,249",
      category: "Men's Shoes",
      imageUrl:
          "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/0dde9946-f6fd-4a13-a149-1c2f11ca0b11/air-jordan-1-mid-shoes-SQf7DM.png")
]);
