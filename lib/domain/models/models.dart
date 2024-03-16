// onBoarding  models

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class SliderViewObject {
  SliderObject sliderObject;

  int numberOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numberOfSlides, this.currentIndex);
}

// login models
class Customer {
  String id;
  String name;
  int numberOfNotifications;

  Customer(this.id, this.name, this.numberOfNotifications);
}

class Contacts {
  int phone;
  String email;
  String link;

  Contacts(this.phone, this.email, this.link);
}

class Authentecation {
  Customer? customer;
  Contacts? contacts;

  Authentecation(this.customer, this.contacts);
}
