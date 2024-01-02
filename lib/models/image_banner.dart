class ImageBannerModel{
  var id;
  var image,url;

  ImageBannerModel({required this.image,required this.id,required this.url});

  factory ImageBannerModel.fromJson(var json) {
    return ImageBannerModel(
        id: json['id'],
        image: json['image'],
        url: json['url']
        );
  }
}