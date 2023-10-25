import 'package:flutter/material.dart';
import 'package:kanver_flutter_app/view/pages/profile/widgets/personal_information_page_widgets/custom_list_tile.dart';
import 'package:kanver_flutter_app/view/pages/profile/widgets/personal_information_page_widgets/single_section.dart';

class PersonalInformationsPage extends StatelessWidget {
  const PersonalInformationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişisel Bilgiler"),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView(
            children: const [
              Divider(),
              SingleSection(
                title: "Organization",
                children: [
                  CustomListTile(
                      title: "Profile", icon: Icons.person_outline_rounded),
                  CustomListTile(
                      title: "Messaging", icon: Icons.message_outlined),
                  CustomListTile(title: "Calling", icon: Icons.phone_outlined),
                  CustomListTile(
                      title: "People", icon: Icons.contacts_outlined),
                  CustomListTile(
                      title: "Calendar", icon: Icons.calendar_today_rounded)
                ],
              ),
              Divider(),
              SingleSection(
                children: [
                  CustomListTile(
                      title: "Help & Feedback",
                      icon: Icons.help_outline_rounded),
                  CustomListTile(
                      title: "About", icon: Icons.info_outline_rounded),
                  CustomListTile(
                      title: "Sign out", icon: Icons.exit_to_app_rounded),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
