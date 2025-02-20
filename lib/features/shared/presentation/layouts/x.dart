import 'package:appflowy_board/appflowy_board.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/auth/domain/entities/user_entity.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class MultiBoardListExample extends StatefulWidget {

  final List<UserEntity> usuarios;
  const MultiBoardListExample(
      {Key? key, required this.usuarios})
      : super(key: key);

  @override
  State<MultiBoardListExample> createState() => _MultiBoardListExampleState();

}

class _MultiBoardListExampleState extends State<MultiBoardListExample> {

  final AppFlowyBoardController controller = AppFlowyBoardController(
    onMoveGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      debugPrint('Move item from $fromIndex to $toIndex');
    },
    onMoveGroupItem: (groupId, fromIndex, toIndex) {
      debugPrint('Move $groupId:$fromIndex to $groupId:$toIndex');
    },
    onMoveGroupItemToGroup: (fromGroupId, fromIndex, toGroupId, toIndex) {
      debugPrint('Move $fromGroupId:$fromIndex to $toGroupId:$toIndex');
    },
  );

  late AppFlowyBoardScrollController boardController;

  @override
  void initState() {
    boardController = AppFlowyBoardScrollController();
    final group1 = AppFlowyGroupData(
        id: "Liberaciones recientes",
        name: "To Do",
        items: widget.usuarios.map((usuario) => TextItem(usuario.name)).toList());

    final group2 = AppFlowyGroupData(
      id: "Funcionalidades planeadas",
      name: "In Progress",
      items: <AppFlowyGroupItem>[
        TextItem("Card 6"),
        TextItem("Card 2"),
        TextItem("Card 2"),
      ],
    );

    final group3 = AppFlowyGroupData(
      id: "Bajo consideracion",
      name: "In Progress",
      items: <AppFlowyGroupItem>[
        TextItem("Card 6"),
        TextItem("Card 2"),
        TextItem("Card 2"),
      ],
    );

    final group4 = AppFlowyGroupData(
      id: "Ideas",
      name: "In Progress",
      items: <AppFlowyGroupItem>[
        TextItem("Card 6"),
        TextItem("Card 2"),
        TextItem("Card 2"),
      ],
    );


    controller.addGroup(group1);
    controller.addGroup(group2);
    controller.addGroup(group3);
    controller.addGroup(group4);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final config = AppFlowyBoardConfig(
      groupBackgroundColor: Colors.white,
      stretchGroupHeight: false,
    );
    return AppFlowyBoard(
    controller: controller,
    cardBuilder: (context, group, groupItem) {
      return AppFlowyGroupCard(
        boxConstraints: const BoxConstraints(maxHeight: 50),
        key: ValueKey(groupItem.id),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), 
          color: Colors.white
        ),
        child: _buildCard(groupItem),
      );
    },
    boardScrollController: boardController,
    footerBuilder: (context, columnData) {
      return Container(
        margin: const EdgeInsets.only(top: 15),
        decoration: BoxDecoration(color: Color(0xffDD052B)),
        child: AppFlowyGroupFooter(
          icon: const Icon(
            BootstrapIcons.plus,
            size: 20,
            color: Colors.white,
          ),
          title: Container(
            decoration: BoxDecoration(
                color: Color(0xffDD052B),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              'Agregar',
              style: GoogleFonts.quicksand(color: Colors.white),
            ),
          ),
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          onAddButtonClick: () {
            boardController.scrollToBottom(columnData.id);
          },
        ),
      );
    },
    headerBuilder: (context, columnData) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        columnData.id,
                        style: GoogleFonts.quicksand(
                          color: Colors.black, 
                          fontSize: 15,
                        ),
                        maxLines: 2,
                      ),
                      Text(
                        columnData.id == "Matutino"
                            ? "08:00 - 15:00"
                            : "16:00 - 22:00",
                        style: GoogleFonts.quicksand(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Icon(
                  Icons.more_horiz,
                  color: Colors.black
                )
              ],
            ),
            const Gap(5),
            const Divider(
              height: 1,
              thickness: 2,
              color: Colors.white,
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: TextField(
                      controller: TextEditingController()
                        ..text = "Buscar... ",
                      style: GoogleFonts.quicksand(color: Colors.red),
                      decoration: InputDecoration(
                          hintStyle:
                              GoogleFonts.quicksand(color: Colors.white),
                          fillColor: Colors.red.withOpacity(.1),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0),
                                  width: 1)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0),
                                  width: 1)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.black.withOpacity(0),
                                  width: 1))),
                      onSubmitted: (val) {
                        controller
                            .getGroupController(
                                columnData.headerData.groupId)!
                            .updateGroupName(val);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
    groupConstraints: const BoxConstraints.tightFor(width: 240),
    config: config);
  }

  Widget _buildCard(AppFlowyGroupItem item) {
    if (item is TextItem) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            item.s,
            style: GoogleFonts.quicksand(color: Colors.black),
          ),
        ),
      );
    }

    if (item is RichTextItem) {
      return RichTextCard(item: item);
    }

    throw UnimplementedError();
  }
}

class RichTextCard extends StatefulWidget {
  final RichTextItem item;
  const RichTextCard({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  State<RichTextCard> createState() => _RichTextCardState();
}

class _RichTextCardState extends State<RichTextCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.item.title,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 10),
            Text(
              widget.item.subtitle,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}

class TextItem extends AppFlowyGroupItem {
  final String s;

  TextItem(this.s);

  @override
  String get id => s;
}

class RichTextItem extends AppFlowyGroupItem {
  final String title;
  final String subtitle;

  RichTextItem({required this.title, required this.subtitle});

  @override
  String get id => title;
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
