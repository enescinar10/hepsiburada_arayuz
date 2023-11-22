import 'package:flutter/material.dart';
import 'package:hepsiburada_uygulamasi/data/entity/urunler.dart';

class HepsiburadaSayfa extends StatefulWidget {
  const HepsiburadaSayfa({super.key});

  @override
  State<HepsiburadaSayfa> createState() => _HepsiburadaSayfaState();
}

class _HepsiburadaSayfaState extends State<HepsiburadaSayfa> {
  final GlobalKey _textFieldKey = GlobalKey();

  Future<List<Urunler>> urunleriYukle() async {
    var urunlerListesi = <Urunler>[];
    var u1 = Urunler(id: 1, ad: "Market ve Su", resim: "marketvesu.png");
    var u2 = Urunler(id: 2, ad: "Honor 90", resim: "honordoksan.png");
    var u3 = Urunler(id: 3, ad: "Elektronik", resim: "elektronik.png");
    var u4 = Urunler(id: 4, ad: "Hemen Katıl", resim: "hemenkatil.png");
    var u5 = Urunler(id: 5, ad: "Acele Et Kaçırma", resim: "aceleetkacırma.png");
    var u6 = Urunler(id: 6, ad: "HP", resim: "hp.png");
    var u7 = Urunler(id: 7, ad: "Xiaomi", resim: "xiaomi.png");
    var u8 = Urunler(id: 8, ad: "English Home", resim: "englishhome.png");
    urunlerListesi.addAll([u1, u2, u3, u4, u5, u6, u7, u8]);
    return urunlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0,right: 16,top: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        TextField(
                          key: _textFieldKey,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: "Ürün, kategori veya marka ara",
                            prefixIconColor: Colors.grey,
                            suffixIcon: Icon(Icons.camera_alt_outlined),
                            hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 13),
                            border: InputBorder.none,
                          ),
                        ),
                        Container(
                          height: 2.0,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue,
                                Colors.red,
                                Colors.orange,
                                Colors.green
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            "Konum",
                            style:
                            TextStyle(fontSize: 13, color: Colors.orange),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.grey,
                              ),
                              Text(
                                "İzmir /Ka..",
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: morGradient(),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3.0),
                          child: SizedBox(
                            width: 80,
                            height: 20,
                            child: Image.asset(
                              "resimler/pr.jpg",
                              //fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0,top: 8),
                          child: Text(
                            "Kargo Bedava",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 160,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: 85,
                                height: 30,
                                child: Image.asset("resimler/hepsipay.png"),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Her yerde %3 kazan",
                                  style: TextStyle(
                                      fontSize: 9, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 32, top: 12),
                            child: Icon(
                              Icons.chevron_right_outlined,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFe0c3de),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Icon(Icons.qr_code, color: Colors.deepPurple),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: ClipRRect(borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset("resimler/efsanecuma.jpeg")),
              ),
              FutureBuilder(
                future: urunleriYukle(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var urunlerListesi = snapshot.data;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: urunlerListesi!.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 5.0, // Dikey boşluğu buradan ayarlayabilirsin
                        crossAxisSpacing: 10.0, // Yatay boşluğu buradan ayarlayabilirsin
                        crossAxisCount: 4,
                        childAspectRatio: 1 / 1,
                      ),
                      itemBuilder: (context, indeks) {
                        var urun = urunlerListesi[indeks];
                        return Card(
                          margin: EdgeInsets.only(bottom: 1),
                          elevation: 0,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min, // Column'ın yüksekliğini içeriğine göre ayarlar
                              children: [
                                ClipRRect(borderRadius: BorderRadius.circular(5.0),
                                    child: Image.asset("resimler/${urun.resim}")),
                                SizedBox(
                                  height: 60, // Text'in yüksekliğine göre ayarla
                                  child: Text(
                                    "${urun.ad}",
                                    style: const TextStyle(fontSize: 10,color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center();
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ClipRRect(borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset("resimler/msi.png")),
              ),


            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items:  const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled,color: Colors.orange,),
            label: 'Anasayfam'
          ),
           BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border,color: Colors.black54,),
              label: 'Listelerim'
          ),
           BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined,color: Colors.black54,),
              label: 'Sepetim'
          ),
           BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined,color: Colors.black54,),
              label: 'Hesabım'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.now_widgets_rounded,
              color: Colors.orange, // İkon rengi
            ),
            label: 'Hepsi',
          ),
        ],
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
        showUnselectedLabels: true, // Bu satırı ekleyerek seçili olmayan labellerin görünürlüğünü kontrol edebilirsiniz.
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black54,
        selectedFontSize: 14.0, // Seçili öğenin metin boyutu
        unselectedFontSize: 12.0, // Seçili olmayan öğelerin metin boyutu
      ),
    );
  }
  LinearGradient morGradient() {
    // Koyu mor ve morun RGB değerlerini belirleyin
    Color koyuMorRenk = Color(0xFF300030);
    Color morRenk = Color(0xFF800080);

    // Gradient oluşturun
    return LinearGradient(
      begin: Alignment.centerLeft,  // Gradient'in sol ortadan başlamasını sağlar
      end: Alignment.centerRight,  // Gradient'in sağ ortaya kadar gitmesini sağlar
      colors: [koyuMorRenk, morRenk],
    );
  }
}
