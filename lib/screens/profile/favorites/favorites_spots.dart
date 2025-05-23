import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';

class FavoritesSpots extends StatefulWidget {
  @override
  _FavoritesSpotsState createState() => _FavoritesSpotsState();
}

class _FavoritesSpotsState extends State<FavoritesSpots> {

  final List<Map<String, dynamic>> items = [
    {
    "spotIcon":"rail",
    "spotName":"Picnic DIY Skatepark",
    "spotAddress":"Carrer de Amaya 16, Sant Martí, Barcelona ...",
    },
    {
    "spotIcon":"stairs",
    "spotName":"Skatepark Favència",
    "spotAddress":"Via Favència, Barcelona, Spain",
    },
    {
    "spotIcon":"halfpipe",
    "spotName":"Skatepark Mar Bella",
    "spotAddress":"Avinguda del Litoral, Barcelona, Spain",
    },
    {
    "spotIcon":"bowl",
    "spotName":"Fòrum",
    "spotAddress":"Avinguda del Litoral, Barcelona, Spain",
    },
    {
    "spotIcon":"ramp",
    "spotName":"Plaça de la Universitat",
    "spotAddress":"L’Eixample, Barcelona, Spain",
    },
    {
    "spotIcon":"rail",
    "spotName":"Plaça de les Glòries Catalanes",
    "spotAddress":"Plaça de les Glòries Catalanes, Barcelona, Spain ",
    },
  ];

  final railIcon = 'assets/profile_page/favorites_page/icons/rail.png';
  final stairsIcon = 'assets/profile_page/favorites_page/icons/stairs.png';
  final halfpipeIcon = 'assets/profile_page/favorites_page/icons/halfpipe.png';
  final bowlIcon = 'assets/profile_page/favorites_page/icons/bowl.png';
  final rampIcon = 'assets/profile_page/favorites_page/icons/ramp.png';

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 0,
        mainAxisSpacing: 1.0,
        childAspectRatio: 5,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GridTile(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: item['spotIcon'] == 'rail'
                    ? Image.asset(railIcon)
                    : item['spotIcon'] == 'stairs'
                        ? Image.asset(stairsIcon)
                        : item['spotIcon'] == 'ramp'
                            ? Image.asset(rampIcon)
                            : item['spotIcon'] == 'bowl'
                                ? Image.asset(bowlIcon)
                                : item['spotIcon'] == 'halfpipe'
                                    ? Image.asset(halfpipeIcon)
                                    : Container(),
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item['spotName'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      item['spotAddress'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: AppColors.primaryGray30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        );
      },
    );
  }
}

