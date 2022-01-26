import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Product {
  String productName;
  String productDescription;
  var price;
  String img;
  var productID;
  // Product({
  //   @required this.productName,
  //   @required this.productDescription,
  //   @required this.price,
  //   @required this.img,
  // });
  Product(
      {this.productID,
      @required this.productName,
      @required this.productDescription,
      @required this.price,
      @required this.img}) {
    var uuid = Uuid();
    productID = uuid.v1();
  }
}

// final Product product1 = new Product(
//   productName: "Total Quartz 800 | Engine Oil 3 Liter",
//   productDescription:
//       "QUARTZ 8000 is fully synthetic engine oil which provides full protection for the engine with excellent fuel economy. QUARTZ is suitable for various gasoline and diesel engines equipped with direct injection, multi-valve, and turbo-charger technologies. Formulated with FE homologated technology to deliver ultimately.",
//   price: 3500.00,
//   img:
//       'https://drive.google.com/uc?export=view&id=1unsyEiSRkzdi_TQzv4AztFE8nK7RZBdD',
// );
// final Product product2 = new Product(
//   productName: "Easy Cosmic Kangaroo Superior Quality Car Wax",
//   productDescription:
//       "Keep your car looking new with Kangaroo's car wax. Kangaroo's Cosmic Easy is suitable for easy and quick wipe-down work for all colored cars. It is formulated with carnauba wax to prevent discoloration and endure several contaminations. It gives wet-look shine and long lasting effect.",
//   price: 851.00,
//   img:
//       'https://drive.google.com/uc?export=view&id=158MkQa8p9ArBLn6xZIiwclUYNiVFJadg',
// );
// final Product product3 = new Product(
//   productName: "Getsun Deluxe Car Shampoo 500ML",
//   productDescription:
//       "Protects the paint, which protects your investment and makes the paint look good, which makes the car look good. People can agree or disagree with whether or not these two primary benefits I’ve listed are in fact the top primary benefits provided by applying a coat of car wax or a paint sealant to your car’s finish, but I think it’s pretty safe to say that the majority of car owners will wax their car for one of these two reasons and usually both. Besides those to major benefits, here are some spin-off benefits from the above. Protecting the paint preserves the paint. Applying a coat of wax or a paint sealant as a part of a regular maintenance program preserves the integrity of the paint, it keeps the paint in good condition. Regularly applying a coat of wax or paint sealant cost a lot less than having the car re-painted. No such thing as a no-wax finish. For decades Car Sales People have told potential customers that new cars come with clear coats and thus don’t need to be waxed. This is just down right ignorant and dishonest. New cars do come with clear coat finishes but the clear coat is still a type of paint that must be cared for or it will deteriorate past the point of no return. Once your car’s paint goes past the point of no return the only option will be a new and costly paint job. Preserves the re-sale value. Regular waxing preserves the paint which in turn preserves the re-sale or trade-in value of the vehicle. When people make car buying decisions, the appearance quality of the car is a huge factor that influences their decision. A clean, shiny car creates the perception that the car is in overall excellent condition. A car that looks neglected on the outside will be perceived to be neglected in all areas. Maintaining a coating of wax or paint sealant makes washing faster and easier. A uniform coating or layer of car wax or a paint sealant will help prevent most air-borne dirt and other contaminants from bonding to the paint thus they will wash off easier, this will make washing your car faster.",
//   price: 650.00,
//   img:
//       'https://drive.google.com/uc?export=view&id=1b-XJ__stEqkEmFd0jHtN3_8Lt_LtZunR',
// );
