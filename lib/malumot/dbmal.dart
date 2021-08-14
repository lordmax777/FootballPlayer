class Player {
  String? image;
  String? club;
  String? name;
  int? nomer;
  String? years;
  String? counrty;
  String? position;
  String? height;
  String? fit;
  String? logo;

  Player.fromJson(Map<String, dynamic> json):

    image = json["image"],
    club = json["club"],
    name = json["name"],
    nomer = json["nomer"],
    years = json["years"],
    counrty = json["counrty"],
    position = json["position"],
    height = json["height"],
    fit = json["fit"],
    logo = json['logo'];
}
  // Map<String, dynamic> toJson() => {
  //   "image": image,
  //   "club": club,
  //   "name": name,
  //   "nomer": nomer,
  //   "years": years,
  //   "counrty": counrty,
  //   "position": position,
  //   "height": height,
  //   "fit": fit,
  // };
