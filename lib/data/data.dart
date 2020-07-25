class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  sliderModel.setDesc("your are trading on one of the best ecommerce");
  sliderModel.setTitle("Welcome");
  sliderModel.setImageAssetPath("assets/logo.jpg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("We Provide you the best shopping experience");
  sliderModel.setTitle("Shopping");
  sliderModel.setImageAssetPath("assets/1.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("we provide a large variety of options for shopping");
  sliderModel.setTitle("Order");
  sliderModel.setImageAssetPath("assets/2.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc(
      "we work on the best user experience which provides you the easy interface to get your things easy.");
  sliderModel.setTitle("User Experience");
  sliderModel.setImageAssetPath("assets/3.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
