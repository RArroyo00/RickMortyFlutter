import 'package:flutter/material.dart';
import 'package:rick_morty_flutter/src/manager/assets_manager.dart';
import 'package:rick_morty_flutter/src/manager/values_manager.dart';
import 'package:rick_morty_flutter/src/models/domain/character.dart';

class HomeCharactersList extends StatelessWidget {
  final List<Character> characterList;
  final Function? endScrollAction;
  final CharacterItemListener? characterItemListener;
  const HomeCharactersList(
      {Key? key,
      required this.characterList,
      this.endScrollAction,
      this.characterItemListener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.pixels >=
          _controller.position.maxScrollExtent - 400) {
        endScrollAction?.call();
      }
    });

    return GridView.builder(
        controller: _controller,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.77,
        ),
        itemCount: characterList.length,
        itemBuilder: (context, i) {
          Character c = characterList.elementAt(i);
          c.uuid = "${c.id}-main";
          return _MainCharacterCardGrid(
              character: c, characterItemListener: characterItemListener);
        });
/*
    return ListView.builder(
        controller: _controller,
        itemCount: characterList.length,
        itemBuilder: (ctx, i) {
          Character c = characterList.elementAt(i);
          c.uuid = "${c.id}-main";
          return _MainCharacterCardList(
              character: c, characterItemListener: characterItemListener);
        });*/
  }
}

class _MainCharacterCardGrid extends StatelessWidget {
  final Character character;
  final CharacterItemListener? characterItemListener;
  const _MainCharacterCardGrid(
      {Key? key, required this.character, required this.characterItemListener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          characterItemListener?.onCharacterDetailsRequired(character);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: character.uuid,
              child: FadeInImage(
                height: 130,
                image: NetworkImage(character.image),
                placeholder: const AssetImage(
                  ImageAssets.loading,
                ),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    character.name,
                    style: Theme.of(context).textTheme.headline3,
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    character.species,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MainCharacterCardList extends StatelessWidget {
  final Character character;
  final CharacterItemListener? characterItemListener;
  const _MainCharacterCardList(
      {Key? key, required this.character, required this.characterItemListener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.s2,
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: GestureDetector(
          onTap: () {
            characterItemListener?.onCharacterDetailsRequired(character);
          },
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: character.uuid,
                  child: FadeInImage(
                    width: AppSize.s80,
                    height: AppSize.s80,
                    image: NetworkImage(character.image),
                    placeholder: const AssetImage(
                      ImageAssets.loading,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      character.name,
                      style: Theme.of(context).textTheme.headline1,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      character.species,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    trailing: const Icon(
                      Icons.navigate_next,
                      color: Colors.black,
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

abstract class CharacterItemListener {
  void onCharacterDetailsRequired(Character character);
}
