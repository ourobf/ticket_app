import 'package:flutter/material.dart';

class HotelDetail extends StatelessWidget {
  const HotelDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Hotel title"),
              //background: Image.network("https://via.placeholder.com/600x400"),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                  "Space Oddity est le deuxième album studio de David Bowie. Il est sorti en novembre 1969 chez Philips Records au Royaume-Uni sous le titre David Bowie et chez Mercury Records aux États-Unis sous le titre Man of Words / Man of Music. Il est plus connu sous le titre Space Oddity qui est utilisé à partir de sa réédition chez RCA Records en 1972Les chansons figurant sur cet album, enregistrées avec les membres du groupe Junior's Eyes, relèvent du genre folk rock et témoignent de l'influence de Bob Dylan et de Simon and Garfunkel sur Bowie. Plusieurs sont d'ordre autobiographique et reviennent sur sa relation avec l'actrice Hermione Farthingale, dont il partage la vie durant la majeure partie de l'année 1968. D'autres témoignent de son expérience du mouvement hippie, dont il est proche depuis la création de l'Arts Lab de Beckenham au printemps 1969, et d'une certaine désillusion à son égard.Malgré le succès du single Space Oddity, qui est repris en ouverture du 33 tours, cet album est un échec commercial. Ce n'est qu'au moment de sa réédition chez RCA, lorsque Bowie est devenu une vedette sous l'identité de Ziggy Stardust, qu'il entre dans le top 20 des ventes au Royaume-Uni et aux États-Unis."),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("More images",
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            ),
            Container(
              height: 200.0,
              child: ListView.builder(itemBuilder: (context, index) {
                return Image.network("#");
              }),
            )
          ]))
        ],
      ),
    );
  }
}
