import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UserProfile extends StatelessWidget {
  List<MenuRowData> firstMenuRow = [
    MenuRowData(icon: Icons.favorite, text: 'Избранное'),
    MenuRowData(icon: Icons.call, text: 'Звонки'),
    MenuRowData(icon: Icons.computer, text: 'Устройство'),
    MenuRowData(icon: Icons.folder_copy_outlined, text: 'Папка с чатами'),
  ];
  List<MenuRowData> secondMenuRow = [
    MenuRowData(icon: Icons.notifications, text: 'Уведомление и Звуки'),
    MenuRowData(icon: Icons.privacy_tip, text: 'Конфиденциальность'),
    MenuRowData(icon: Icons.date_range, text: 'Данные и память'),
    MenuRowData(icon: Icons.brush, text: 'Оформление'),
    MenuRowData(icon: Icons.language, text: 'Язык'),
    MenuRowData(icon: Icons.sticky_note_2, text: 'Стикеры'),
  ];
  List<MenuRowData> thirdMenuRow = [
    MenuRowData(icon: Icons.lock_clock, text: 'Apple Watch'),
  ];
  List<MenuRowData> fourthMenuRow = [
    MenuRowData(icon: Icons.help, text: 'Помошь'),
    MenuRowData(icon: Icons.question_answer, text: 'Вопросы о Телеграм'),
  ];
  UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Option'),
        
      ),
      body: SizedBox(
        width: double.infinity,
        child: ListView(
          children: [
            const _UserInfo(),
            // Gap(30,color: Colors.grey.shade300,),
            const Divider(
              thickness: 1,
              color: Colors.blue,
            ),
            _MenuWidget(
              menuRow: firstMenuRow,
            ),
            // const Gap(30),
            const Divider(
              thickness: 1,
              color: Colors.blue,
            ),

            _MenuWidget(
              menuRow: secondMenuRow,
            ),
            const Divider(
              thickness: 1,
              color: Colors.blue,
            ),

            _MenuWidget(
              menuRow: thirdMenuRow,
            ),
            _MenuWidget(
              menuRow: fourthMenuRow,
            ),
          ],
        ),
      ),
    );
  }
}

class MenuRowData {
  final IconData icon;
  final String text;

  MenuRowData({required this.icon, required this.text});
}

class _MenuWidget extends StatelessWidget {
  List<MenuRowData> menuRow;
  _MenuWidget({required this.menuRow});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: menuRow
            .map((data) => _MenuWidgetRow(
                  data: data,
                ))
            .toList(),
      ),
    );
  }
}

//Reusible row second bloc
class _MenuWidgetRow extends StatelessWidget {
  final MenuRowData data;
  const _MenuWidgetRow({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(data.icon),
          const Gap(15),
          Expanded(
            child: Text(data.text),
          ),
          const Icon(Icons.chevron_right),
          const Divider(
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}

//First Block
class _UserInfo extends StatelessWidget {
  const _UserInfo();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: Colors.white,
          child: const Column(
            children: [
              Gap(20),
              _AvatarWidget(),
              Gap(20),
              _UserNameWidget(),
              Gap(10),
              _UserPhoneWidget(),
              Gap(10),
              _UserNickNameWidget(),
            ],
          ),
        ),
        const Positioned(
          top: 25,
          right: 25,
          child: Text(
            'Изменить',
            style: TextStyle(color: Colors.blue,fontSize: 17),
          ),
        ),
      ],
    );
  }
}

//NickName
class _UserNickNameWidget extends StatelessWidget {
  const _UserNickNameWidget();

  @override
  Widget build(BuildContext context) {
    return const Text(
      '@Kamalovd_',
      style: TextStyle(color: Colors.grey),
    );
  }
}

//Number//
class _UserPhoneWidget extends StatelessWidget {
  const _UserPhoneWidget();

  @override
  Widget build(BuildContext context) {
    return const Text('+996 708 777768');
  }
}

//Name//
class _UserNameWidget extends StatelessWidget {
  const _UserNameWidget();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Kamalov Dastan',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    );
  }
}

//Avatar//
class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      width: 100,
      child: Placeholder(),
    );
  }
}
