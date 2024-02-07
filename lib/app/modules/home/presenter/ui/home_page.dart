import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sample_project/app/modules/home/presenter/states/cloth_state.dart';
import 'package:sample_project/app/modules/home/presenter/stores/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = Modular.get<HomeStore>();

  @override
  void initState() {
    store.loadClothList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Observer(builder: (context) {
            if (store.state is ClothLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.builder(
              shrinkWrap: true,
              itemCount: store.clothList.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final cloth = store.clothList[index];

                return Image.network(cloth.image);
              },
            );
          }),
        ),
      ),
    );
  }
}
