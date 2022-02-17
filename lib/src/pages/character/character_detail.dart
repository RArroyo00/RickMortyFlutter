import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rick_morty_flutter/src/manager/color_manager.dart';
import 'package:rick_morty_flutter/src/manager/font_manager.dart';
import 'package:rick_morty_flutter/src/manager/styles_manager.dart';
import 'package:rick_morty_flutter/src/manager/values_manager.dart';
import 'package:rick_morty_flutter/src/models/domain/character.dart';
import 'package:rick_morty_flutter/src/pages/character/character_detail_viemodel_impl.dart';

class CharacterDetailView extends StatefulWidget {
  static const String route_name = '/detail';
  const CharacterDetailView({Key? key}) : super(key: key);

  @override
  State<CharacterDetailView> createState() => _CharacterDetailViewState();
}

class _CharacterDetailViewState extends State<CharacterDetailView> {
  final CharacterDetailViewModel _detailViewModel = CharacterDetailViewModel();

  _bind() {
    _detailViewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    final Object? args = ModalRoute.of(context)?.settings.arguments;
    late Character character;
    if (args != null) {
      setState(() {
        character = args as Character;
        _detailViewModel.character = character;
        _bind();
      });
    } else {
      Navigator.pop(context);
    }

    return _generateCharacterPage(character);
  }

  Widget _generateCharacterPage(Character c) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          c.name,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              height: AppSize.s12,
            ),
            _topInfo(c)
          ]))
        ],
      ),
    );
  }

  Widget _topInfo(Character c) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s8),
      child: Row(
        children: [
          Hero(
            tag: c.uuid,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s8),
              child: Image(
                image: NetworkImage(c.image),
                width: AppSize.s150,
                height: AppSize.s150,
              ),
            ),
          ),
          const SizedBox(
            width: AppSize.s16,
          ),
          Flexible(
              child: _CharacterInfoWidget(
            character: c,
          ))
        ],
      ),
    );
  }
}

class _CharacterInfoWidget extends StatelessWidget {
  final Character character;
  const _CharacterInfoWidget({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _generateAliveStatusRow(),
        _generateTypeRow(),
        _generateGenderRow(),
        _generateLocationInfo(),
      ],
    );
  }

  Widget _generateTypeRow() {
    if (character.type.isEmpty) {
      return Container();
    }
    return Row(
      children: [
        Text(
          "Type:",
          style: getSemiBoldStyle(
            color: ColorManager.darkGrey,
            fontSize: FontSize.s18,
          ),
        ),
        Text(
          character.type,
          style: getSemiBoldStyle(
            color: ColorManager.white,
            fontSize: FontSize.s18,
          ),
        )
      ],
    );
  }

  Widget _generateAliveStatusRow() {
    return Row(
      children: [
        _getStatusIcon(),
        Text(
          " ${character.status} - ${character.species}",
          style: getSemiBoldStyle(
            color: ColorManager.white,
            fontSize: FontSize.s20,
          ),
        ),
      ],
    );
  }

  Widget _generateGenderRow() {
    return Row(
      children: [
        _getGenderIcon(),
        Text(
          " ${character.gender}",
          style: getSemiBoldStyle(
            color: ColorManager.white,
            fontSize: FontSize.s16,
          ),
        ),
      ],
    );
  }

  _getStatusIcon() {
    IconData statusIcon = FontAwesomeIcons.question;
    Color statusColor = ColorManager.lightGrey;
    String status = character.status.toLowerCase();
    if (status == 'alive') {
      statusIcon = FontAwesomeIcons.thumbsUp;
      statusColor = ColorManager.success;
    } else if (status == 'dead') {
      statusIcon = FontAwesomeIcons.skullCrossbones;
      statusColor = ColorManager.error;
    }
    return FaIcon(
      statusIcon,
      color: statusColor,
      size: AppSize.s18,
    );
  }

  _getGenderIcon() {
    IconData statusIcon = FontAwesomeIcons.question;
    String gender = character.gender.toLowerCase();
    if (gender == 'male') {
      statusIcon = FontAwesomeIcons.mars;
    } else if (gender == 'female') {
      statusIcon = FontAwesomeIcons.venus;
    }
    return FaIcon(
      statusIcon,
      color: ColorManager.white,
      size: AppSize.s14,
    );
  }

  Widget _generateLocationInfo() {
    List<Widget> widgetList = List.empty(growable: true);
    if (character.locationName.isNotEmpty) {
      widgetList.add(
        Text(
          "Last known location:",
          style: getSemiBoldStyle(
            color: ColorManager.darkGrey,
            fontSize: FontSize.s18,
          ),
        ),
      );
      widgetList.add(
        Text(
          character.locationName,
          style: getRegularStyle(
            color: ColorManager.white,
            fontSize: FontSize.s20,
          ),
        ),
      );
    }
    if (character.originName.isNotEmpty) {
      widgetList.add(
        Text(
          "First seen in:",
          style: getSemiBoldStyle(
            color: ColorManager.darkGrey,
            fontSize: FontSize.s18,
          ),
        ),
      );
      widgetList.add(
        Text(
          character.originName,
          style: getRegularStyle(
            color: ColorManager.white,
            fontSize: FontSize.s20,
          ),
        ),
      );
    }

    return Column(
      children: widgetList,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
