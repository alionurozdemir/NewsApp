import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/news_model.dart';
import 'package:flutter_news_app/screens/details_page.dart';
import 'package:flutter_news_app/services/get_news.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Son Dakika Haberleri"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh))
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder<List<Result>>(
              future: getNews(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const CircularProgressIndicator();
                } else {
                  return SizedBox(
                    height: MediaQuery.of(context).copyWith().size.height / 1.1,
                    child: ListView.builder(
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        Result result = snapshot.data[index];

                        return Column(
                          children: [
                            Card(
                                child: Image.network(
                              result.image.toString(),
                              height: height / 3,
                              width: width,
                            )),
                            ListTile(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => DetailsPage(result: result)))),
                              title: Text(result.name.toString()),
                              subtitle: Text(result.description.toString()),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) => DetailsPage(result: result))));
                                    },
                                    child: const Text("Haber Detayı")),
                                IconButton(onPressed: () {}, icon: const Icon(Icons.share))
                              ],
                            )
                          ],
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Ana Sayfa", backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.notification_add),
                label: "Bildirimler",
                backgroundColor: Colors.grey),
            BottomNavigationBarItem(
                icon: Icon(Icons.comment),
                label: "Yorumlar",
                backgroundColor: Color.fromARGB(255, 243, 181, 10)),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Profilim", backgroundColor: Colors.green),
          ]),
    );
  }
}
