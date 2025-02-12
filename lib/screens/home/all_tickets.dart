import 'package:flutter/material.dart';
import 'package:tichet_app/base/utils/all_json.dart';
import 'package:tichet_app/base/utils/app_routes.dart';
import 'package:tichet_app/base/widgets/ticket_view.dart';

class AllTickets extends StatelessWidget {
  const AllTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All tickets"),
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Column(
              children: ticketList
                  //Classe du fichier json
                  .map((singleTicket) => GestureDetector(
                        onTap: () {
                          var index = ticketList.indexOf(singleTicket);
                          print("I m tapped");
                          Navigator.pushNamed(context, AppRoutes.ticketScreen,
                              arguments: {"index": index});
                        },
                        child: Container(
                          //on a utiliser container pour espacer les tickets avec margin
                          margin: const EdgeInsets.only(bottom: 20),
                          child: TicketView(
                            ticket: singleTicket,
                            wholeScreen: true, //
                          ),
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
