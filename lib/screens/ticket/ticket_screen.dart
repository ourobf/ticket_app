import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:tichet_app/base/res/media.dart';
import 'package:tichet_app/base/res/styles/app_styles.dart';
import 'package:tichet_app/base/utils/all_json.dart';
import 'package:tichet_app/base/widgets/app_column_text_layout.dart';
import 'package:tichet_app/base/widgets/app_layoutbuilder_widget.dart';
import 'package:tichet_app/base/widgets/ticket_view.dart';
import 'package:tichet_app/screens/search/widgets/app_ticket_tabs.dart';
import 'package:tichet_app/screens/ticket/widgets/ticket_positioned_circle.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  late int ticketIndex = 0;

  @override
  void didChangeDependencies() {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    //cette est utilisée si on passe d une fenetre a une autre
//tout en passant les donnees reccueillies de  l autre fenetre
    ticketIndex = args["index"];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyles.bgColor,
        appBar: AppBar(
          backgroundColor: AppStyles.bgColor,
          //Avec appBar on a la fleche de retour en arriere
          title: const Text("Tickets"),
        ),
        body: Stack(children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: [
              // const SizedBox( height: 40,),
              //Text("Tickets",style: AppStyles.headLineStyle1,),
              //const SizedBox(height: 20,),
              const AppTicketTabs(
                firstTab: "Upcoming",
                secondTab: "Privious",
              ),
              const SizedBox(
                height: 20,
              ),
              //white and black ticket
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: TicketView(
                    //isColor = true, est utilisé par la classe TicketView
                    ticket: ticketList[ticketIndex],
                    isColor: true),
              ),
              const SizedBox(
                height: 1,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                color: AppStyles.ticketColor,
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: "Flutter DB",
                          botomText: "Passenger",
                          alignment: CrossAxisAlignment.start,
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                          topText: "5221 364629",
                          botomText: "Passpart",
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AppLayoutbuilderWidget(
                      randomDivider: 15,
                      width: 5,
                      isColor: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: "2465 6854940",
                          botomText: "Number of E-ticket",
                          alignment: CrossAxisAlignment.start,
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                          topText: "B46859",
                          botomText: "Booking code",
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const AppLayoutbuilderWidget(
                      randomDivider: 15,
                      width: 5,
                      isColor: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppMedia.visaCard,
                                  scale: 11,
                                ),
                                Text(
                                  " *** 2462",
                                  style: AppStyles.headLineStyle3,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Payment method",
                              style: AppStyles.headLineStyle4,
                            )
                          ],
                        ),
                        const AppColumnTextLayout(
                          topText: "\$249.99",
                          botomText: "Price",
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              //Bottom of the ticket detail section
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    color: AppStyles.ticketColor,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(21),
                        bottomRight: Radius.circular(21))),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: BarcodeWidget(
                        height: 70,
                        barcode: Barcode.code128(),
                        data: "https//dbesetch.com",
                        drawText: false,
                        color: AppStyles.textColor,
                        width: double.infinity,
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //Colorfull ticket
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: TicketView(
                  //isColor = true, est utilisé par la classe TicketView
                  ticket: ticketList[ticketIndex],
                ),
              ),
            ],
          ),
          const TicketPositionedCircle(
            pos: true,
          ),
          const TicketPositionedCircle(
            pos: false,
          )
        ]));
  }
}
