import 'package:flutter/material.dart';

import '../models/restaurant_model.dart';
import '../widgets/item_restaurant.dart';
import '../shared/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  final List<Restaurant> _search = [];
  List<Restaurant> _restaurant = [];

  List<Restaurant> _parseRestaurant(String? json) {
    if (json == null) {
      return [];
    }
    RestaurantModel data = restaurantModelFromJson(json);
    _restaurant = data.restaurants.toList();
    return _restaurant;
  }

  _searchItemRestaurant(String text) {
    _search.clear();
    if (text.isEmpty) {
      setState(() {});
      return _restaurant;
    }

    for (var e in _restaurant) {
      if (e.id.contains(text) ||
          e.name.toLowerCase().contains(text.toLowerCase())) {
        _search.add(e);
      }
    }
    setState(() {});
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: cOrangeColor,
      title: Text(
        'FanResto',
        style: whiteTextstyle.copyWith(
          fontSize: 24,
          fontWeight: semiBold,
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Daftar Restaurant',
            style: blackTextstyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
              letterSpacing: 0.5,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Text(
            'Rekomendasi restoran untuk kamu',
            style: grayTextstyle.copyWith(
              fontSize: 16,
              fontWeight: regular,
              letterSpacing: 0.5,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: cGrayColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Icon(
                Icons.search,
                size: 24,
                color: cBlackColor,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: cGrayColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onChanged: _searchItemRestaurant,
                      textInputAction: TextInputAction.search,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: 'Cari restaurant',
                        hintStyle: blackTextstyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium,
                          letterSpacing: 0.5,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.only(right: 10),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _controller.clear();
                      _searchItemRestaurant('');
                    },
                    child: const Icon(
                      Icons.close,
                      size: 24,
                      color: cBlackColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context)
          .loadString('assets/json/local_restaurant.json'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<Restaurant> rest = _parseRestaurant(snapshot.data);
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: _search.isNotEmpty || _controller.text.isNotEmpty
                  ? _search.map((e) => ItemRestaurant(restaurant: e)).toList()
                  : rest
                      .map((e) => ItemRestaurant(
                            restaurant: e,
                          ))
                      .toList(),
            ),
          );
        } else {
          return Center(
            child: Text(
              'Terjadi Kesalahan\nData Tidak Dapat Ditampilkan',
              style: redTextstyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
                color: cRedColor.withOpacity(0.8),
                letterSpacing: 0.5,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhiteColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildSearch(),
            const SizedBox(height: 20),
            _buildContent(context),
          ],
        ),
      ),
    );
  }
}
