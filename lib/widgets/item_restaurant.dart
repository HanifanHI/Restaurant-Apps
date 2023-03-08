import 'package:flutter/material.dart';
import 'package:restaurant_app/models/restaurant_model.dart';

import '../pages/detail_page.dart';
import '../shared/style.dart';

class ItemRestaurant extends StatelessWidget {
  final Restaurant restaurant;

  const ItemRestaurant({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailPage.routeName,
          arguments: restaurant,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: restaurant.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  restaurant.pictureId,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    restaurant.name,
                    style: blackTextstyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                      letterSpacing: 0.5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/ic_star.png',
                      width: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${restaurant.rating}',
                      style: grayTextstyle.copyWith(
                        fontSize: 14,
                        fontWeight: regular,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/ic_loc.png',
                  width: 14,
                ),
                const SizedBox(width: 4),
                Text(
                  restaurant.city,
                  style: grayTextstyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
