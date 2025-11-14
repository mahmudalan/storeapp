
import 'package:flutter/material.dart';
import 'package:storeapp/models/product.dart';
import 'package:storeapp/theme/color.dart';
import 'package:storeapp/theme/font.dart';

class DetailPage extends StatelessWidget {
  final Product product;

  const DetailPage({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Details', style: UIFontStyle.headingLargeBlack,),
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Image.asset(
            'assets/angle-left.png',
            height: 20,
            color: AppColors.blue,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.grey
            ),
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child:Image.network(
              product.image,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.category,
                  style: UIFontStyle.headingMediumBlue,
                ),

                Row(
                  spacing: 5,
                  children: [
                    Image.asset('assets/star.png', height: 14,),
                    Text(
                      '${product.rating.rate} (${product.rating.count} reviews)',
                      style: UIFontStyle.paragraphBlack,
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              product.title,
              style: UIFontStyle.titleLargeBlack,
              textAlign: TextAlign.start,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14),
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Product Details',
                  style: UIFontStyle.headingMediumBlack,
                ),
                Text(product.description, style: UIFontStyle.paragraphBlack,)
              ],
            ),
          ),
          Spacer(),

          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(25), topLeft: Radius.circular(25)),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Price', style: UIFontStyle.headingSmallBlack.copyWith(color: Colors.grey.shade600),),
                    Text('\$${product.price.toStringAsFixed(2)}', style: UIFontStyle.headingLargeBlue,)
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blue,
                    fixedSize: Size(200, 50)
                  ),
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/cart.png', height: 25, color: AppColors.white,),
                        Text('Add to Cart', style: UIFontStyle.headingLargeBlue.copyWith(color: AppColors.white),)
                      ],
                    )
                )
              ]
            ),
          )

        ],
      ),
    );
  }
}