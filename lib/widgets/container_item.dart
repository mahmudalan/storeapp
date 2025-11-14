import 'package:flutter/material.dart';
import '../models/product.dart';
import '../pages/detail_page.dart';
import '../theme/font.dart';

class ContainerItem extends StatelessWidget {
  final String itemImage;
  final String itemName;
  final String itemPrice;
  final String itemRate;
  final Product product;

  const ContainerItem({
    super.key,
    required this.itemImage,
    required this.itemName,
    required this.itemPrice,
    required this.itemRate,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(product: product), // Kirim produk
          ),
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.width /2 + 30,
        width: MediaQuery.of(context).size.width /2 - 25,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width / 2 - 70,
              width: MediaQuery.of(context).size.width / 2 - 70,
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(15),
                child: Image.network(itemImage, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Text(
                itemName,
                style: UIFontStyle.paragraphBlack,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$${itemPrice}", style: UIFontStyle.headingMediumBlue),
                Row(
                  spacing: 5,
                  children: [
                    Image.asset('assets/star.png', height: 14),
                    Text(itemRate, style: UIFontStyle.paragraphBlack,)
                  ]
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
