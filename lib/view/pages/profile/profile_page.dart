import 'package:flutter/material.dart';
import 'package:kanver_flutter_app/view/pages/profile/widgets/profile_page_widgets/profile_bottom_portion.dart';
import 'package:kanver_flutter_app/view/pages/profile/widgets/profile_page_widgets/profile_top_portion.dart';
import 'package:kanver_flutter_app/view/pages/test_page/route_where_you_go.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(flex: 1, child: TopPortion()),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Oğuzhan Öztürk",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  // EĞER KULLANICI ZATEN DONOR İSE BUTON RENGİ YEŞİL OLCAK VE TEXT
                  // YERİNE ZATEN DONORSUNUZ DİYE YAZI ÇIKACAK
                  FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const RouteWhereYouGo(),
                        ),
                      );
                    },
                    heroTag: 'donorOl',
                    backgroundColor: Colors.red.shade300,
                    elevation: 0,
                    label: const Text("Donor ol"),
                    icon: const Icon(Icons.bloodtype),
                  ),
                  const SizedBox(height: 30),
                  const BottomPortion()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
