import 'package:flutter/material.dart';
import 'package:rick_morty_flutter/src/manager/assets_manager.dart';
import 'package:rick_morty_flutter/src/models/domain/character.dart';

class HorizontalCharacterSlider extends StatelessWidget {
  final List<Character> characterList;
  final Function? endScrollAction;

  const HorizontalCharacterSlider(
      {Key? key, required this.characterList, this.endScrollAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    final _pageController = PageController(
      initialPage: 1,
      viewportFraction: .3,
    );

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        if (endScrollAction != null) {
          endScrollAction!();
        }
      }
    });

    return SizedBox(
      height: _screenSize.height * .32,
      child: PageView.builder(
          pageSnapping: false,
          controller: _pageController,
          itemCount: characterList.length,
          itemBuilder: (context, i) =>
              _createTrendingCard(context, characterList[i])),
    );
  }

  Widget _createTrendingCard(BuildContext context, Character character) {
    character.uuid = '${character.id}-main';
    final movieCard = Hero(
      tag: character.uuid,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 3,
        child: Column(
          children: [
            FadeInImage(
              height: 180,
              image: NetworkImage(character.image),
              placeholder: const AssetImage(ImageAssets.loading),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(3),
              child: Text(
                character.name,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            )
          ],
        ),
      ),
    );

    final movieCardContainer = Container(
      margin: const EdgeInsets.only(right: 4),
      child: Column(
        children: [
          GestureDetector(
            child: movieCard,
            onTap: () {
              // Navigator.pushNamed(context, 'detail', arguments: character);
            },
          )
        ],
      ),
    );

    return movieCardContainer;
  }
}
