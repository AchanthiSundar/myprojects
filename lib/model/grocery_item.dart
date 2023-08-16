class GroceryItem {
  final int? id;
  final String offer;
  final String name;
  final String description;
  final String price;
  final String imagePath;

  GroceryItem({
    this.id,
    required this.offer,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}

var myAppsItems = [
  GroceryItem(
      id: 1,
      offer: "40%",
      name: "Milky Mist Fruit Yoghurt Peach",
      description: "100 ml",
      price: "36",
      imagePath: "images/grocery_images/milky_mist.png"),
  GroceryItem(
      id: 2,
      offer: "10%",
      name: "Aavin Green Magic Fresh Milk (Pouch)",
      description: "500 ml",
      price: "22",
      imagePath: "images/grocery_images/aavin_green_magic.jpeg"),
  GroceryItem(
      id: 3,
      offer: "16%",
      name: "Onion (Vengayam)",
      description: "1kg",
      price: "36",
      imagePath: "images/grocery_images/onion.jpeg"),
  GroceryItem(
      id: 4,
      offer: "10%",
      name: "Aavin Premium Fresh Milk (Pouch)",
      description: "500 ml",
      price: "30",
      imagePath: "images/grocery_images/aavin_premium.jpeg"),
  GroceryItem(
      id: 5,
      offer: "16%",
      name: "Coriander Leaves (Koththamalli) - With roots",
      description: "1 Bunch 80g - 100gm",
      price: "15",
      imagePath: "images/grocery_images/coriander.jpeg"),
  GroceryItem(
      id: 6,
      offer: "17%",
      name: "Green Chilli (Pachchai Milagai)",
      description: "100g",
      price: "14",
      imagePath: "images/grocery_images/green_chilly.jpeg"),
  GroceryItem(
      id: 7,
      offer: "10%",
      name: "Hatsun Curd Pouch",
      description: "500g",
      price: "42",
      imagePath: "images/grocery_images/hatsun_curd.jpeg"),
  GroceryItem(
      id: 8,
      offer: "14%",
      name: "Tender Coconut /Elaneer",
      description: "300 - 400 ml",
      price: "54",
      imagePath: "images/grocery_images/tender_coconut.jpeg"),
  GroceryItem(
      id: 9,
      offer: "14%",
      name: "Coconut (Thengaai)",
      description: "450 - 600g",
      price: "29",
      imagePath: "images/grocery_images/coconut.jpeg"),
  GroceryItem(
      id: 10,
      offer: "14%",
      name: "Tomato Country / Naatu Thakkali",
      description: "500g",
      price: "65",
      imagePath: "images/grocery_images/tomato.jpeg"),
  GroceryItem(
      id: 11,
      offer: "15%",
      name: "Potato Agra",
      description: "1 Kg",
      price: "38",
      imagePath: "images/grocery_images/potato.jpeg"),
  GroceryItem(
      id: 12,
      offer: "10%",
      name: "Aavin Premium Cow Milk",
      description: "500 ml",
      price: "22",
      imagePath: "images/grocery_images/aavin_cow_milk.jpeg"),
  GroceryItem(
      id: 13,
      offer: "10%",
      name: "Arokya Full Cream Fresh Milk (Pouch)",
      description: "500 ml",
      price: "37",
      imagePath: "images/grocery_images/arokya.jpeg"),
  GroceryItem(
      id: 14,
      offer: "4%",
      name: "idli & Dosa Batter",
      description: "1 Kg",
      price: "59",
      imagePath: "images/grocery_images/idly_dosa.jpeg"),
  GroceryItem(
      id: 15,
      offer: "18%",
      name: "Mint Leaves - Cleaned, Without roots",
      description: "100gm",
      price: "13",
      imagePath: "images/grocery_images/mint.jpeg"),
];

var exclusiveOffers = [myAppsItems];

var bestSelling = [myAppsItems[2], myAppsItems[3]];

var groceries = [myAppsItems[4], myAppsItems[5]];

// var beverages = [
//   GroceryItem(
//       id: 7,
//       name: "Dite Coke",
//       description: "355ml, Price",
//       price: 1.99,
//       imagePath: "images/beverages_images/diet_coke.png"),
//   GroceryItem(
//       id: 8,
//       name: "Sprite Can",
//       description: "325ml, Price",
//       price: 1.50,
//       imagePath: "beverages_images/sprite.png"),
//   GroceryItem(
//       id: 8,
//       name: "Apple Juice",
//       description: "2L, Price",
//       price: 15.99,
//       imagePath: "images/beverages_images/apple_and_grape_juice.png"),
//   GroceryItem(
//       id: 9,
//       name: "Orange Juice",
//       description: "2L, Price",
//       price: 1.50,
//       imagePath: "images/beverages_images/orange_juice.png"),
//   GroceryItem(
//       id: 10,
//       name: "Coca Cola Can",
//       description: "325ml, Price",
//       price: 4.99,
//       imagePath: "images/beverages_images/coca_cola.png"),
//   GroceryItem(
//       id: 11,
//       name: "Pepsi Can",
//       description: "330ml, Price",
//       price: 4.99,
//       imagePath: "images/beverages_images/pepsi.png"),
// ];
