import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

        length: 4,
        child: Scaffold(
            appBar: AppBar(
              title: Text('WhatsApp'),
              bottom: const TabBar(tabs: [
                Icon(Icons.people_rounded),
                Text('Chat'),
                Text('Status'),
                Text('Calls'),
              ]),
              actions: [
                const Icon(Icons.camera_alt),
                const SizedBox(
                  width: 10,
                  height: 10,
                ),
                const Icon(Icons.search),
                const SizedBox(
                  width: 10,
                  height: 10,
                ),
                PopupMenuButton(
                    icon: const Icon(Icons.more_vert_outlined),
                    itemBuilder: (
                      context,
                    ) =>
                        const [
                          PopupMenuItem(value: '1', child: Text('New Group')),
                          PopupMenuItem(
                              value: '2', child: Text('New Broadcast')),
                          PopupMenuItem(
                              value: '3', child: Text('Linked Devices')),
                          PopupMenuItem(
                              value: '4', child: Text('Starred Messages')),
                          PopupMenuItem(value: '5', child: Text('Payments')),
                          PopupMenuItem(value: '6', child: Text('Settings')),
                        ]),
                const SizedBox(
                  width: 10,
                  height: 10,
                ),
              ],
            ),
            body: TabBarView(children: [
              ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return const ListTile(
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://www.pngjoy.com/pngm/131/2663889_group-of-people-icon-avatar-group-icon-png.png')),
                      title: Text('New community'),
                      subtitle: Text('Make Your new community'),
                    );
                  }),
              ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return const ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://th.bing.com/th/id/R.a6bb23a400e988c08ac7094b0bf67ef7?rik=IH3uLIhQEQWjvw&riu=http%3a%2f%2fde.web.img2.acsta.net%2fnewsv7%2f19%2f05%2f23%2f14%2f03%2f5625579.jpg&ehk=VxlxREvfwajgxCRvU9mDWPz6x1KC3C10ohhgokLje14%3d&risl=&pid=ImgRaw&r=0'),
                      ),
                      title: Text('john Wick'),
                      subtitle: Text('Where is my Dog?'),
                      trailing: Text('3:34 PM'),
                    );
                  }),
              ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: CupertinoColors.systemGreen,
                              width: 3,
                            )),
                        child: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://th.bing.com/th/id/R.a6bb23a400e988c08ac7094b0bf67ef7?rik=IH3uLIhQEQWjvw&riu=http%3a%2f%2fde.web.img2.acsta.net%2fnewsv7%2f19%2f05%2f23%2f14%2f03%2f5625579.jpg&ehk=VxlxREvfwajgxCRvU9mDWPz6x1KC3C10ohhgokLje14%3d&risl=&pid=ImgRaw&r=0'),
                        ),
                      ),
                      title: Text('john Wick'),
                      subtitle: Text('10m ago'),
                    );
                  }),
              ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://th.bing.com/th/id/R.a6bb23a400e988c08ac7094b0bf67ef7?rik=IH3uLIhQEQWjvw&riu=http%3a%2f%2fde.web.img2.acsta.net%2fnewsv7%2f19%2f05%2f23%2f14%2f03%2f5625579.jpg&ehk=VxlxREvfwajgxCRvU9mDWPz6x1KC3C10ohhgokLje14%3d&risl=&pid=ImgRaw&r=0'),
                      ),
                      title: Text('john Wick'),
                      subtitle: Text(index % 2 == 0
                          ? 'you missed audio call call'
                          : 'call time is 12:23'),
                      trailing:
                          Icon(index % 2 == 0 ? Icons.phone : Icons.video_call),
                    );
                  }),
            ])));
  }
}
