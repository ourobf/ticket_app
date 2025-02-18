import 'package:flutter/material.dart';
import 'package:tichet_app/base/res/styles/app_styles.dart';
import 'package:tichet_app/base/utils/all_json.dart';
import 'package:tichet_app/base/utils/app_routes.dart';
import 'package:tichet_app/screens/hotel_detail.dart';

class AllHotels extends StatelessWidget {
  const AllHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        title: const Text("All hotels"),
        backgroundColor: AppStyles.bgColor,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Nombre d elts a la verticale
                crossAxisSpacing: 16.0, //Espace entre 2 etls horizontalement
                mainAxisSpacing: 16.0, //Espace entre 2 elts verticalement
                childAspectRatio: 0.9, //pourcentage d agrandissement
              ),
              itemCount: hotelList.length, //Nombre d elts à afficher
              itemBuilder: (context, index) {
                var singleHotel = hotelList[index];
                return HotelGridView(
                  hotel: singleHotel,
                );
              }),
        ),
      ),
    );
  }
}

class HotelGridView extends StatelessWidget {
  final Map<String, dynamic> hotel;
  const HotelGridView({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.hotelDetail);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        //width: size.width * 0.6,
        height: 350,
        margin: const EdgeInsets.only(right: 6),
        decoration: BoxDecoration(
          color: AppStyles.primaryColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.3,
              child: Container(
                  decoration: BoxDecoration(
                color: AppStyles.primaryColor,
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/${hotel['image']}")),
              )),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              //c est aussi un widget
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                hotel['place'],
                style: AppStyles.headLineStyle3
                    .copyWith(color: AppStyles.kakiColor),
              ),
            ),
            Row(
              children: [
                Padding(
                  //c est aussi un widget
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    hotel['destination'],
                    style: AppStyles.headLineStyle3
                        .copyWith(color: Colors.white, fontSize: 13),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Padding(
                  //c est aussi un widget
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "\$${hotel['price']}/night",
                    style: AppStyles.headLineStyle4
                        .copyWith(color: AppStyles.kakiColor, fontSize: 15),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
