import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:office_supply_mobile_master/config/themes.dart';
import 'package:office_supply_mobile_master/models/product_in_menu/product_in_menu.dart';

class StationeryGridItem extends StatelessWidget {
  final ProductInMenu productInMenu;
  final EdgeInsets margin;
  final VoidCallback onTap;

  const StationeryGridItem({
    Key? key,
    required this.productInMenu,
    required this.onTap,
    this.margin = const EdgeInsets.all(5.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: Offset.zero,
              blurRadius: 3,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(7),
                    ),
                    child: Container(
                      height: 190,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          alignment: Alignment.topCenter,
                          image: NetworkImage(
                              productInMenu.productObject!.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  if (/*item.discountPercent != 0*/ true)
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: primaryLightColorTransparent,
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          '-0%',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productInMenu.productObject!.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                  Wrap(
                    spacing: 3,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        ProductInMenu.format(price: productInMenu.price),
                        style: const TextStyle(
                          fontSize: 18,
                          color: primaryColor,
                          height: 1.5,
                        ),
                      ),
                      // if (item.discountPercent != 0)
                      //   Text(
                      //     Item.format(price: item.originalPrice),
                      //     style: const TextStyle(
                      //       fontSize: 12,
                      //       height: 1.5,
                      //       decoration: TextDecoration.lineThrough,
                      //       color: Colors.black38,
                      //     ),
                      //   ),
                      Text(
                        ProductInMenu.format(price: productInMenu.price),
                        style: const TextStyle(
                          fontSize: 11,
                          height: 1.5,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.black38,
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 4.5,
                          minRating: 1,
                          itemSize: 12,
                          ignoreGestures: true,
                          allowHalfRating: true,
                          itemCount: 5,
                          unratedColor: Colors.amber[100],
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            size: 2,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) => {},
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          '4.5',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
