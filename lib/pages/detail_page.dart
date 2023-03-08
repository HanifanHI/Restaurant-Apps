import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../models/restaurant_model.dart';
import '../shared/style.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  static const String routeName = '/detail';

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: cWhiteColor,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Image.asset(
            'assets/icons/ic_arrow_left.png',
            width: 24,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final restaurant = ModalRoute.of(context)!.settings.arguments as Restaurant;
    return Scaffold(
      backgroundColor: cWhiteColor,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: restaurant.id,
              child: Image.network(
                restaurant.pictureId,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          restaurant.name,
                          style: blackTextstyle.copyWith(
                            fontSize: 20,
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
                              fontSize: 16,
                              fontWeight: regular,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
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
                          fontSize: 16,
                          fontWeight: regular,
                          letterSpacing: 0.5,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deskripsi',
                    style: blackTextstyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                      letterSpacing: 0.5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  ReadMoreText(
                    restaurant.description,
                    style: grayTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: regular,
                      letterSpacing: 0.5,
                    ),
                    trimLines: 4,
                    colorClickableText: cOrangeColor,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Lebih Banyak',
                    trimExpandedText: 'Lebih Sedikit',
                    moreStyle: orangeTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                      letterSpacing: 0.5,
                    ),
                    lessStyle: orangeTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                      letterSpacing: 0.5,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Menu',
                    style: blackTextstyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                      letterSpacing: 0.5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Makanan :',
                    style: blackTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                      letterSpacing: 0.5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: restaurant.menus.foods
                          .map(
                            (e) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: cOrangeColor.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                e.name,
                                style: blackTextstyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: regular,
                                  letterSpacing: 0.5,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Minuman :',
                    style: blackTextstyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                      letterSpacing: 0.5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: restaurant.menus.drinks
                          .map(
                            (e) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: cOrangeColor.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                e.name,
                                style: blackTextstyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: regular,
                                  letterSpacing: 0.5,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
