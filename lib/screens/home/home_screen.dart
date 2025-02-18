import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:tichet_app/base/res/media.dart';
import 'package:tichet_app/base/res/styles/app_styles.dart';
import 'package:tichet_app/base/utils/all_json.dart';
import 'package:tichet_app/base/utils/app_routes.dart';
import 'package:tichet_app/base/widgets/app_double_text.dart';
import 'package:tichet_app/base/widgets/ticket_view.dart';
import 'package:tichet_app/screens/home/widgets/hotel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        //listview ne prend que les widgets
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
              //container pour utiliser le padding
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //c est une propriete horizontale
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //pour les Columns c est CrossAxisAlignment
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good morning",
                            style: AppStyles.headLineStyle3,
                          ),
                          //Espacement vertical
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Book tickets",
                            style: AppStyles.headLineStyle1,
                          )
                        ],
                      ),
                      Container(
                        //color: Colors.red,
                        //color doit etre usé ds decoration si ce dernier est utilisé
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage(AppMedia.logo)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF4F6FD)),
                    child: const Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          FluentSystemIcons.ic_fluent_search_regular,
                          color: Color(0xFFBFC205),
                        ),
                        Text("Search")
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  AppDoubleText(
                    bigText: "Upcoming flights",
                    smallText: 'View all',
                    func: () =>
                        Navigator.pushNamed(context, AppRoutes.allTickets),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: ticketList
                            .take(2) //Classe du fichier json
                            .map((singleTicket) => TicketView(
                                  ticket: singleTicket,
                                ))
                            .toList(),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  AppDoubleText(
                    bigText: 'Hotels',
                    smallText: 'View all',
                    func: () =>
                        Navigator.pushNamed(context, AppRoutes.allHotels),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: hotelList
                          .take(2) //Classe du fichier json
                          .map((singleHotel) => Hotel(
                                hotel: singleHotel,
                              ))
                          .toList(),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
