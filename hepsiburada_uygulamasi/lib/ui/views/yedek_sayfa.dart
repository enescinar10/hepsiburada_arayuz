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
        padding: const EdgeInsets.all(16.0),
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
                      child: Column(
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
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 33,
                          child: Image.asset(
                            "resimler/premiumm.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
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
                      width: 150,
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
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Her yerde %3 kazan",
                                  style: TextStyle(
                                      fontSize: 9, color: Colors.black87),
                                ),
                              ),
                            ],
                          ),
                          Padding(
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
                child: Image.asset("resimler/cuma.png"),
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
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                        crossAxisCount: 4,
                        childAspectRatio: 0.3 / 0.5,
                      ),
                      itemBuilder: (context, indeks) {
                        var urun = urunlerListesi[indeks];
                        return Card(
                          elevation: 10,
                          margin: EdgeInsets.only(left: 5, right: 5, bottom: 70),
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset("resimler/${urun.resim}"),
                              Text(
                                "${urun.ad}",
                                style: const TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center();
                  }
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
