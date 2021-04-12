import 'package:cod3r_refeicao_app/screens/categorys_screen.dart';
import 'package:cod3r_refeicao_app/screens/favorites_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Vamos Cozinhar'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categorias',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favoritas',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [CategoriesScreen(), FavoriteScreen()],
        ),
      ),
    );
  }
}
