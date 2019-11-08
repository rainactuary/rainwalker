import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:rainwalkers/core/utilities/network_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rainwalkers/core/userexperience/assetswhole.dart' as assets;


class HomePage extends StatelessWidget {
  static final String path = "lib/src/pages/misc/sliver_appbar.dart";
  final List<String> banners = [
    assets.homeBanner[0],
    assets.backgroundImages[0],
    assets.homeBanner[1],
    assets.homeBanner[2],
    assets.homeBanner[3],
    assets.homeBanner[4],
    assets.backgroundImages[1],
    assets.homeBanner[5]
  ];

  final List<String> userPets = [assets.userPets[0]];
  final List<String> spotLightsProducts = [assets.spotLightProducts[0]];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              expandedHeight: 150.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: PNetworkImage(assets.banner[0], fit: BoxFit.cover),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  tooltip: 'Favorites',
                  onPressed: () {
                    /* ... */
                  },
                ),
              ]
          ),
          SliverToBoxAdapter(
            child: Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.grey,
                child: Text("Your Pet".toUpperCase(), style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ))
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return _buildListItem(index);
              },
              childCount: userPets.length,
            ),
          ),
          SliverToBoxAdapter(
            child:
            ListTile(
              title: Row(
                children: <Widget>[
                  Expanded(child: RaisedButton(onPressed: () {},child: Text("Reinbursement"),color: Colors.black,textColor: Colors.white,)),
                  Expanded(child: RaisedButton(onPressed: () {},child: Text("All Pets"),color: Colors.black,textColor: Colors.white,)),
                ],
              ),
            )
            ),


          SliverToBoxAdapter(
            child: Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.grey,
                child: Text("Health Spotlight".toUpperCase(), style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ))
            ),
          ),
          SliverToBoxAdapter(
            child: _buildSlider(),
          ),
        ],
      ),
    );
  }

  Widget _buildSlider() {
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      height: 200.0,
      child: Container(
        child: Swiper(
          autoplay: true,
          itemBuilder: (BuildContext context, int index) {
            return new PNetworkImage(spotLightsProducts[index], fit: BoxFit.cover,);
          },
          itemCount: 1,
          pagination: new SwiperPagination(),
        ),
      ),
    );
  }

  Widget _buildListItem(int index) {
    return Container(
        height: 100,
        child: Card(
          child: Center(
            child: ListTile(
              leading: CircleAvatar(
                radius: 40,
                backgroundImage: CachedNetworkImageProvider(
                    userPets[index % userPets.length]),
              ),
              title: Text('Pet Name: Garfields', style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue),),
              subtitle: Text('Plan Balance: \$89', style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue),),
            ),
          ),
        )
    );
  }
}

