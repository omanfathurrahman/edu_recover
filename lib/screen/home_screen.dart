import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Image.asset("assets/images/adu_revocer_logo.png"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Text(
                    "100xp Poin",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: const [
            Text(
              "Hai, Stevanus",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            CarouselSliderComponent(),
            SizedBox(height: 10),
            ButtonContainerComponent(),
            SizedBox(height: 10),
            BeritaContainerComponent(),
          ],
        ),
      ),
    );
  }
}

class CarouselSliderComponent extends StatefulWidget {
  const CarouselSliderComponent({super.key});

  @override
  State<CarouselSliderComponent> createState() =>
      _CarouselSliderComponentState();
}

class _CarouselSliderComponentState extends State<CarouselSliderComponent> {
  final List<String> imgList = [
    'assets/images/Rectangle 18.png',
    'assets/images/Rectangle 19.png',
    'assets/images/Rectangle 20.png',
  ];
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            height: 150.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: imgList.map((img) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  clipBehavior: Clip.hardEdge,
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Image.asset(img, fit: BoxFit.cover),
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 4.0,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(
                    _current == entry.key ? 0.9 : 0.4,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class ButtonContainerComponent extends StatelessWidget {
  const ButtonContainerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              print("hehe");
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    Image.asset("assets/images/pembelajaran.png"),
                    const Text("Pembelajaran")
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              print("jir");
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    Image.asset("assets/images/pelatihan.png"),
                    const Text("Pelatihan")
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BeritaContainerComponent extends StatelessWidget {
  const BeritaContainerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Berita",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Lihat Semua"),
            ),
          ],
        ),
        const Divider(),
        ...[1, 2, 3]
            .map((e) => Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Gempa bumi M 2,7 Guncang Garut, Kedalaman 6 KM",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ),
                        Image.asset("assets/images/Rectangle 23.png")
                      ],
                    ),
                    const Divider(),
                  ],
                ))
            .toList()
      ],
    );
  }
}
