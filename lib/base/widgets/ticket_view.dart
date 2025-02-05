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
  final bool? isColor;
  const TicketView(
      {super.key,
      required this.ticket,
      this.wholeScreen = false,
      this.isColor});

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
                  color: isColor == null
                      ? AppStyles.ticketBlue
                      : AppStyles.ticketColor,
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
                        text: ticket["from"]["code"], isColor: isColor,
                      ),
                      Expanded(child: Container()), //pour les espacements
                      BigDot(
                        isColor: isColor,
                      ),
                      Expanded(
                          child: Stack(
                        children: [
                          SizedBox(
                            height: 24,
                            child: AppLayoutbuilderWidget(
                              randomDivider: 6,
                              isColor: isColor,
                            ),
                          ),
                          Center(
                            child: Transform.rotate(
                                angle:
                                    1.57, // Pi/2 ==> 90° car, par defaut, l avion etait positionné verticalement
                                child: Icon(
                                  Icons.local_airport_rounded,
                                  color: isColor == null
                                      ? Colors.white
                                      : AppStyles.planeSecondColor,
                                )),
                          )
                        ],
                      )),
                      BigDot(
                        isColor: isColor,
                      ),
                      Expanded(child: Container()),
                      TextStyleThird(
                        //recuperation des donnees du fichier json
                        text: ticket["to"]["code"], isColor: isColor,
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
                        child: TextStyleFourth(
                          text: ticket["from"]["name"],
                          isColor: isColor,
                        ),
                      ),

                      Expanded(child: Container()), //pour les espacements
                      TextStyleFourth(
                        text: ticket["flying_time"],
                        isColor: isColor,
                      ),
                      Expanded(child: Container()),
                      SizedBox(
                        //pour pouvoir donner une taille fixe et permettre que les textes soient centrés
                        width: 98,
                        child: TextStyleFourth(
                          text: ticket["to"]["name"],
                          align: TextAlign.end,
                          isColor: isColor,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          //circles and dots
          Container(
            color: isColor == null
                ? AppStyles.ticketOrange
                : AppStyles.ticketColor,
            child: Row(
              children: [
                BigCircleDot(
                  isRight: false,
                  isColor: isColor,
                ),
                Expanded(
                    //Pour placer les 2 bigcircledot à l'extraime
                    child: AppLayoutbuilderWidget(
                  randomDivider: 10,
                  isColor: isColor,
                )),
                BigCircleDot(
                  isRight: true,
                  isColor: isColor,
                ),
              ],
            ),
          ),
          //orange part of the ticket
          Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: isColor == null
                      ? AppStyles.ticketOrange
                      : AppStyles.ticketColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(isColor == null ? 21 : 0),
                      bottomRight: Radius.circular(isColor == null ? 21 : 0))),
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
                          isColor: isColor,
                        ),
                        AppColumnTextLayout(
                          topText: ticket["departure_time"],
                          botomText: "Departure time",
                          alignment: CrossAxisAlignment.center,
                          isColor: isColor,
                        ),
                        AppColumnTextLayout(
                          topText: ticket["number"].toString(),
                          botomText: "Number",
                          alignment: CrossAxisAlignment.end,
                          isColor: isColor,
                        ),
                      ]),
                ],
              )),
        ]),
      ),
    );
  }
}
