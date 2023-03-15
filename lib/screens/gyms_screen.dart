import 'package:climbit/models/gym_model.dart';
import 'package:climbit/widget/loading/loading_wheel.dart';
import 'package:climbit/widget/gyms/gym_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GymsScreen extends StatelessWidget {
  const GymsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Palestre salvate'),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Vicino a te',
              ),
              Tab(
                text: 'Preferiti',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Tab(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                  .collection('gyms')
                  .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.data?.docs == null) {
                    return const LoadingWheel();
                  }
                List<GymModel> gyms = [];
                  for (var element in snapshot.data!.docs) { 
                    gyms.add( GymModel.fromJson(element.data()));
                  }
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: gyms.map((e) => GymCard(gym: e)).toList(),
                    ),
                  );
                }
              ),
            ),
            const Tab(
              text: 'ciao',
            ),
          ],
        ),
      ),
    );
  }
}
