class Giphy {
  final GiphyImage images;

  Giphy({this.images});

  Giphy.fromJson(Map<String, dynamic> json)
      : images = GiphyImage.fromJson(json["images"]);

  Map<String, dynamic> toJson() => {"images": images};
}

class GiphyImage {
  final FixedHeight fixedHeight;
  final PreviewWebp previewWebp;

  GiphyImage({this.fixedHeight, this.previewWebp});

  GiphyImage.fromJson(Map<String, dynamic> json)
      : fixedHeight = FixedHeight.fromJson(json["fixed_height"]),
        previewWebp =
            PreviewWebp.fromJson(json["preview_webp"] ?? json["fixed_height"]);

  Map<String, dynamic> toJson() => {'fixed_height': fixedHeight};
}

class FixedHeight {
  final String url;
  final String width;
  final String height;
  final String size;
  final String webp;

  FixedHeight({this.url, this.width, this.height, this.size, this.webp});

  factory FixedHeight.fromJson(Map<String, dynamic> json) {
    return FixedHeight(
        url: json["url"],
        width: json["width"],
        height: json["height"],
        size: json["size"],
        webp: json["webp"]);
  }

  // FixedHeight.fromJson(Map<String, dynamic> json)
  //     : url = json["url"],
  //       width = json["width"],
  //       height = json["height"],
  //       size = json["size"],
  //       webp = json["webp"];
}

class PreviewWebp {
  final String url;
  final String width;
  final String height;
  final String size;

  PreviewWebp({this.url, this.width, this.height, this.size});

  factory PreviewWebp.fromJson(Map<String, dynamic> json) {
    return PreviewWebp(
        url: json["url"],
        width: json["width"],
        height: json["height"],
        size: json["size"]);
  }

  // PreviewWebp.fromJson(Map<String, dynamic> json)
  //     : url = json["url"],
  //       width = json["width"],
  //       height = json["height"],
  //       size = json["size"];
}
