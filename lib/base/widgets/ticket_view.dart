import 'package:flutter/material.dart';
import 'package:tichet_app/base/res/styles/app_styles.dart';
import 'package:tichet_app/base/widgets/app_column_text_layout.dart';
import 'package:tichet_app/base/widgets/app_layoutbuilder_widget.dart';
import 'package:tichet_app/base/widgets/big_circle_dot.dart';
import 'package:tichet_app/base/widgets/big_dot.dart';
import 'package:tichet_app/base/widgets/text_style_fourth.dart';
import 'package:tichet_app/base/widgets/text_style_third.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool wholeScreen;
  const TicketView({super.key, required this.ticket, this.wholeScreen = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //size renvoie les dimension de l écran du téléphone
    return SizedBox(
      width: size.width * 0.85,
      height: 189,
      child: Container(
        margin: EdgeInsets.only(
            //0 c est pour all_ticket.dart et 16 c est pour home_Screen.dart
            right: wholeScreen == true ? 0 : 16),
        child: Column(children: [
          //blue part of the ticket
          Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppStyles.ticketBlue,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(21),
                      topRight: Radius.circular(21))),
              child: Column(
                children: [
                  // show departure and destination with icons first line
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextStyleThird(
                        //recuperation des donnees du fichier json
                        text: ticket["from"]["code"],
                      ),
                      Expanded(child: Container()), //pour les espacements
                      const BigDot(),
                      Expanded(
                          child: Stack(
                        children: [
                          const SizedBox(
                            height: 24,
                            child: AppLayoutbuilderWidget(
                              randomDivider: 6,
                            ),
                          ),
                          Center(
                            child: Transform.rotate(
                                angle:
                                    1.57, // Pi/2 ==> 90° car, par defaut, l avion etait positionné verticalement
                                child: const Icon(
                                  Icons.local_airport_rounded,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      )),
                      const BigDot(),
                      Expanded(child: Container()),
                      TextStyleThird(
                        //recuperation des donnees du fichier json
                        text: ticket["to"]["code"],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  //show departure and destianation with time
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        //pour pouvoir donner une taille fixe et permettre que les textes soient centrés
                        width: 98,
                        child: TextStyleFourth(text: ticket["from"]["name"]),
                      ),

                      Expanded(child: Container()), //pour les espacements
                      TextStyleFourth(text: ticket["flying_time"]),
                      Expanded(child: Container()),
                      SizedBox(
                        //pour pouvoir donner une taille fixe et permettre que les textes soient centrés
                        width: 98,
                        child: TextStyleFourth(
                          text: ticket["to"]["name"],
                          align: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          //circles and dots
          Container(
            color: AppStyles.ticketOrange,
            child: const Row(
              children: [
                BigCircleDot(
                  isRight: false,
                ),
                Expanded(
                    //Pour placer les 2 bigcircledot à l'extraime
                    child: AppLayoutbuilderWidget(randomDivider: 10)),
                BigCircleDot(
                  isRight: true,
                ),
              ],
            ),
          ),
          //orange part of the ticket
          Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppStyles.ticketOrange,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(21),
                      bottomRight: Radius.circular(21))),
              child: Column(
                children: [
                  // show departure and destination name with icons first line
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: ticket["date"],
                          botomText: "DATE",
                          alignment: CrossAxisAlignment.start,
                        ),
                        AppColumnTextLayout(
                          topText: ticket["departure_time"],
                          botomText: "Departure time",
                          alignment: CrossAxisAlignment.center,
                        ),
                        AppColumnTextLayout(
                          topText: ticket["number"].toString(),
                          botomText: "Number",
                          alignment: CrossAxisAlignment.end,
                        ),
                      ]),
                ],
              )),
        ]),
      ),
    );
  }
}
