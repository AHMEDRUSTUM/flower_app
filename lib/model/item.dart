class Item {
  String imgPath;
  double price;
  String ozelikler;
  String name;
  String lcoation;
  Item(
      {required this.imgPath,
      required this.price,
      required this.ozelikler,
      this.lcoation = "Main Branch",
      required this.name});
}

final List<Item> items = [
  Item(
      name: "Rose",
      price: 12.99,
      lcoation: "Carsi Branch",
      imgPath: "assetes/img/1.webp",
      ozelikler:
          "Springtime in Portland Japanese Garden showcases the green we missed in winter, from the early days of April when we see moegi-iro (Japanese word for new leaf green color) to the lush hues that accompany the approach of summer. Unlike Western gardens where flowers can dominate the field of vision, Japanese gardens very intentionally choose where blooms will be located and how they will intermingle with an otherwise predominantly green tableau. You can refer back to this page that will be updated multiple times per week as we share how blooms are appearing throughout our garden spaces."),
  Item(
      name: "Tulip",
      price: 4.99,
      imgPath: "assetes/img/2.webp",
      ozelikler:
          "Today marks the final day of our spring blooms watch! Flowers are blossoming into full bloom across our grounds, creating a dazzling visual array of green with bright pops of color. Make sure you visit soon to see the Garden in its spring glory."),
  Item(
      name: "Daisy",
      price: 5.99,
      imgPath: "assetes/img/3.webp",
      ozelikler:
          "The Flower Bowl prides itself on always delivering the freshest of flowers and unique designs. Stocking our shop with flowers from the San Francisco flower mart 2 to 3 times weekly. Our staff of talented designers have all been in the field for many years. "),
  Item(
      name: "Lily",
      price: 21.99,
      imgPath: "assetes/img/4.webp",
      ozelikler:
          "We specialize in garden style and offer everything from classic to moderns designs. We take joy in finding greens with textures and special flowers to create each arrangement made to order with a personal touch. With that said, keep in mind the content of your arrangement will depend upon season and market availability."),
  Item(
      name: "Iris",
      price: 9.99,
      imgPath: "assetes/img/5.webp",
      ozelikler:
          "Our delivery areas are : Walnut Creek, Concord, Pleasant Hill, Lafayette, Orinda, Moraga, Martinez, Clayton, Pacheco, Alamo, Danville, Blackhawk, Diablo, San Ramon, Piedmont, Rockridge, Oakland Hills, Berkeley"),
  Item(
      name: "Crocus",
      price: 8.99,
      imgPath: "assetes/img/6.webp",
      ozelikler:
          "Every order is important to us because we know how important it is to you. We earnestly endeavour to please every customer with beautiful flowers and accommodating service. Knowing that flowers are a perishable natural product and that floral arrangements and floral gifts are handmade, we make every effort to fortify our floral products and ensure the quality, accuracy"),
  Item(
      name: "poppy",
      price: 14.99,
      lcoation: "Carsi Brach",
      imgPath: "assetes/img/7.webp",
      ozelikler:
          "We always do our best to accommodate our customers’ delivery needs.  However, we are not always able to guarantee delivery at a specific time of day, especially during busy holiday periods.  To request a specific delivery time, please type it into the Special Delivery Instructions field during checkout. Before major holidays, we strongly recommend that you place your orders several days in advance"),
  Item(
      name: "Freesia",
      price: 32.99,
      imgPath: "assetes/img/8.webp",
      ozelikler:
          "Funeral arrangements typically require additional lead-time. If your sympathy or funeral order requires delivery at a specific time of day, please try to let us know several days in advance so we can best accommodate your needs. Sunday deliveries may not always be available."),
];
