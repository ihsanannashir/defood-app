import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MethodPesan extends StatefulWidget {
  @override
  _MethodPesanState createState() => _MethodPesanState();
}

class _MethodPesanState extends State<MethodPesan> {
  //PageView
  int _page = 0;
  PageController _pageController =
      PageController(initialPage: 0, keepPage: true);
  bool _selectedPesan = true;
  String pesan;
  bool _selectedAntar = true;
  String antar;
  DateTime selectedDate = DateTime.now();
  int _selectedJadwal;
  String jam;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBD452C),
      appBar: AppBar(
          title: Text("Metode Pesanan",
              style:
                  TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600)),
          backgroundColor: Color(0xFFBD452C),
          elevation: 0,
          automaticallyImplyLeading: true),
      body: Stack(
        children: <Widget>[
          buildPageView(),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: TextButton(
                  onPressed: () {
                    _pageController.animateToPage(_page += 1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.linear);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('OK',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFBD452C),
                          )),
                      Container(
                        width: 10,
                        height: 0,
                      ),
                      Icon(
                        CupertinoIcons.arrow_right_circle_fill,
                        size: 24,
                        color: Color(0xFFBD452C),
                      )
                    ],
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      _page = index;
    });
  }

  void onSelectedPesan(bool value, String method) {
    setState(() {
      _selectedPesan = value;
      pesan = method;
    });
  }

  void onSelectedAntar(bool value, String method) {
    setState(() {
      _selectedAntar = value;
      antar = method;
    });
  }

  void onSelectedJadwal(int value, String method) {
    setState(() {
      _selectedJadwal = value;
      jam = method;
    });
  }

  Widget buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      onPageChanged: (index) {
        onPageChanged(index);
      },
      children: <Widget>[
        methodPesan(),
        methodAntar(),
        methodJadwal(),
      ],
    );
  }

  Widget methodPesan() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 50, 20, 200),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                onSelectedPesan(true, "Takeout");
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: _selectedPesan ? Colors.white : Colors.white38,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Ambil pesanan Anda langsung di Toko',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: _selectedPesan
                                    ? Colors.black
                                    : Colors.white),
                          ),
                          Container(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Text(
                                'Tanpa Ada Biaya Tambahan',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: _selectedPesan
                                        ? Colors.black
                                        : Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                'Tidak perlu antri di toko setelah Anda melakukan pembayaran melalui aplikasi.',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: _selectedPesan
                                        ? Colors.black
                                        : Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: -40,
                      top: 30,
                      child: Container(
                        alignment: FractionalOffset.centerRight,
                        child: Opacity(
                          opacity: _selectedPesan ? 1 : 0.6,
                          child: Image(
                            image: AssetImage('assets/images/takeout.png'),
                            width: 220,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 10,
            ),
            InkWell(
              onTap: () {
                onSelectedPesan(false, 'Deliv');
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: _selectedPesan ? Colors.white38 : Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Pesanan Anda akan dikirim sampai ke rumah',
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: _selectedPesan
                                    ? Colors.white
                                    : Colors.black),
                          ),
                          Container(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Text(
                                'Gratis ongkir minimal belanja Rp 10.000',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: _selectedPesan
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                          Container(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                'Pesan dan bayar terlebih dahulu melalui aplikasi, item anda akan dikirm sesuai jadwal',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: _selectedPesan
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: -60,
                      top: 30,
                      child: Container(
                        alignment: FractionalOffset.centerRight,
                        child: Opacity(
                          opacity: _selectedPesan ? 0.6 : 1,
                          child: Image(
                            image: AssetImage('assets/images/bike.png'),
                            width: 220,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget methodAntar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 50, 20, 280),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(25)),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Container(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.all(20),
                alignment: Alignment.topLeft,
                child: Text(
                  'Pilih Pengantaran',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              new InkWell(
                onTap: () {
                  onSelectedAntar(true, "Standar");
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                              child: IconButton(
                                onPressed: () {
                                  onSelectedAntar(true, 'Standar');
                                },
                                iconSize: 30,
                                icon: Icon(
                                    _selectedAntar
                                        ? CupertinoIcons.checkmark_alt_circle
                                        : CupertinoIcons.circle,
                                    color: _selectedAntar
                                        ? Colors.green.shade300
                                        : Colors.grey.shade600),
                              ),
                            ),
                            Container(
                              height: 65,
                            )
                          ],
                        ),
                        Container(
                          width: 5,
                          height: 20,
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Standar',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                'Diantar sesuai jadwal gratis ongkir. Wajib pesan 1 jam sebelum waktu pengantaran atau jika melewati akan dikirim di waktu berikutnya.',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade600),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              new InkWell(
                onTap: () {
                  onSelectedAntar(false, "Express");
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                              child: IconButton(
                                onPressed: () {
                                  onSelectedAntar(false, 'Express');
                                },
                                iconSize: 30,
                                icon: Icon(
                                    _selectedAntar
                                        ? CupertinoIcons.circle
                                        : CupertinoIcons.checkmark_alt_circle,
                                    color: _selectedAntar
                                        ? Colors.grey.shade600
                                        : Colors.green.shade300),
                              ),
                            ),
                            Container(
                              height: 65,
                            )
                          ],
                        ),
                        Container(
                          width: 5,
                          height: 20,
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Express',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                'Diantar segera setelah anda menyelesaikan pesanan',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade600),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                'Biaya: Rp 7.000',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget methodJadwal() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 50, 20, 200),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(25)),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Container(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.all(20),
                alignment: Alignment.topLeft,
                child: Text(
                  'Pengantaran Standar',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                alignment: Alignment.topLeft,
                child: Text(
                  'Pilih tanggal',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                alignment: Alignment.topLeft,
                child: TextButton(
                  child: Text(
                    DateFormat('EEEE, dd MMMM yyyy').format(selectedDate),
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.black),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.grey.shade300),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ))),
                  onPressed: () {
                    _selectDate(context);
                  },
                ),
              ),
              new InkWell(
                onTap: () {
                  onSelectedJadwal(1, 'Pagi: 07.00 - 08.00');
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                              child: IconButton(
                                onPressed: () {
                                  onSelectedJadwal(1, 'Pagi: 07.00 - 08.00');
                                },
                                iconSize: 24,
                                icon: Icon(
                                    _selectedJadwal == 1
                                        ? CupertinoIcons.checkmark_alt_circle
                                        : CupertinoIcons.circle,
                                    color: _selectedJadwal == 1
                                        ? Colors.green.shade300
                                        : Colors.grey.shade600),
                              ),
                            ),
                            Container(
                              height: 10,
                            )
                          ],
                        ),
                        Container(
                          width: 5,
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Pagi',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                '(07.00 - 08.00)',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade600),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              new InkWell(
                onTap: () {
                  onSelectedJadwal(2, 'Siang: 11.30 - 14.00');
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                              child: IconButton(
                                onPressed: () {
                                  onSelectedJadwal(2, 'Siang: 11.30 - 14.00');
                                },
                                iconSize: 24,
                                icon: Icon(
                                    _selectedJadwal == 2
                                        ? CupertinoIcons.checkmark_alt_circle
                                        : CupertinoIcons.circle,
                                    color: _selectedJadwal == 2
                                        ? Colors.green.shade300
                                        : Colors.grey.shade600),
                              ),
                            ),
                            Container(
                              height: 10,
                            )
                          ],
                        ),
                        Container(
                          width: 5,
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Siang',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                '(11.30 - 14.00)',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade600),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              new InkWell(
                onTap: () {
                  onSelectedJadwal(3, 'Sore: 17.00 - 18.30');
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                              child: IconButton(
                                onPressed: () {
                                  onSelectedJadwal(3, 'Sore: 17.00 - 18.30');
                                },
                                iconSize: 24,
                                icon: Icon(
                                    _selectedJadwal == 3
                                        ? CupertinoIcons.checkmark_alt_circle
                                        : CupertinoIcons.circle,
                                    color: _selectedJadwal == 3
                                        ? Colors.green.shade300
                                        : Colors.grey.shade600),
                              ),
                            ),
                            Container(
                              height: 10,
                            )
                          ],
                        ),
                        Container(
                          width: 5,
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Sore',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                '(17.00 - 18.30)',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade600),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              new InkWell(
                onTap: () {
                  onSelectedJadwal(4, 'Malam: 20.00 - 21.30');
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                              child: IconButton(
                                onPressed: () {
                                  onSelectedJadwal(4, 'Malam: 20.00 - 21.30');
                                },
                                iconSize: 24,
                                icon: Icon(
                                    _selectedJadwal == 4
                                        ? CupertinoIcons.checkmark_alt_circle
                                        : CupertinoIcons.circle,
                                    color: _selectedJadwal == 4
                                        ? Colors.green.shade300
                                        : Colors.grey.shade600),
                              ),
                            ),
                            Container(
                              height: 10,
                            )
                          ],
                        ),
                        Container(
                          width: 5,
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Malam',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                '(20.00 - 21.30)',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade600),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Refer step 1
      firstDate: DateTime(2020),
      lastDate: DateTime(2022),
      selectableDayPredicate: (DateTime day) =>
          (day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
                  day.isBefore(DateTime.now().add(Duration(days: 2))))
              ? true
              : false,
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}
