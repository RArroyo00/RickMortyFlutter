import 'package:flutter/material.dart';
import 'package:rick_morty_flutter/src/manager/assets_manager.dart';
import 'package:rick_morty_flutter/src/manager/values_manager.dart';
import 'package:rick_morty_flutter/src/models/domain/character.dart';
import 'package:rick_morty_flutter/src/pages/home/home_viewmodel_impl.dart';
import 'package:rick_morty_flutter/src/pages/home/widgets/home_characters_list.dart';

class HomeView extends StatefulWidget {
  static const String route_name = '/home';
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> implements CharacterItemListener {
  final HomeViewModel _homeViewModel = HomeViewModel();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .2,
        title: _createHomeHeader(),
      ),
      body: SafeArea(child: _createHeaderCharacters()),
    );
  }

  @override
  void dispose() {
    _homeViewModel.dispose();
    super.dispose();
  }

  _bind() {
    _homeViewModel.start();
  }

  Widget _createHomeHeader() {
    return const SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.s8),
        child: Image(
          image: AssetImage(ImageAssets.main),
        ),
      ),
    );
  }

  Widget _createHeaderCharacters() {
    return StreamBuilder(
      stream: _homeViewModel.outputCharacters,
      builder: (context, AsyncSnapshot<HomeViewObject> snapshot) {
        if (snapshot.hasData) {
          List<Character> characters = snapshot.data!.mainCharacters;
          return HomeCharactersList(
            characterList: characters,
            endScrollAction: _homeViewModel.fetchCharacters,
            characterItemListener: this,
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  @override
  void onCharacterDetailsRequired(Character character) {
    _homeViewModel.navigateToCharacterDetail(context, character);
  }
}
