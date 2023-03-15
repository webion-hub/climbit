import 'package:climbit/models/gym_model.dart';
import 'package:climbit/screens/gym_details_screen.dart';
import 'package:flutter/material.dart';

class GymCard extends StatelessWidget {
  final GymModel gym;
  
  const GymCard({
    super.key, 
    required this.gym,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: gym.id,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => GymDetailsScreen(
                          gym: gym,
                        )));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Ink.image(
                        width: double.infinity,
                        height: 154,
                        image: const AssetImage('assets/images/Test.jpeg'),
                        fit: BoxFit.fitWidth,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, top: 16, right: 16, bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              gym.name,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.0, bottom: 0, right: 0, left: 0),
                                  child: Text(
                                    'Aperto ',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10.0, bottom: 0, right: 0, left: 0),
                                  child: Text(
                                    ' - chiude alle 22',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.signal_cellular_alt,
                              size: 40,
                              color: Colors.red,
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.circle_notifications,
                              size: 40,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
