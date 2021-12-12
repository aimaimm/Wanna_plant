import 'package:flutter/material.dart';
import 'package:wanna_plant/constants.dart';


TextEditingController name = TextEditingController();
TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController phonenumber = TextEditingController();
TextEditingController address = TextEditingController();
TextEditingController protmptpay = TextEditingController();

class textInfo extends StatefulWidget {
  const textInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<textInfo> createState() => _textInfoState();
}

String? val_province;

class _textInfoState extends State<textInfo> {
  List<DropdownMenuItem<String>> createDD() {
    List<String> province = [
      'Bangkok',
      'Amnat Charoen',
      'Ang Thong',
      'Bueng Kan',
      'Buriram',
      'Chachoengsao',
      'Chai Nat',
      'Chaiyaphum',
      'Chanthaburi',
      'Chiang Mai',
      'Chiang Rai',
      'Chonburi',
      'Chumphon',
      'Kalasin',
      'Kamphaeng Phet',
      'Kanchanaburi',
      'Khon Kaen',
      'Krabi',
      'Lampang',
      'Lamphun',
      'Loei',
      'Lopburi',
      'Mae Hong Son',
      'Maha Sarakham',
      'Mukdahan',
      'Nakhon Nayok',
      'Nakhon Pathom',
      'Nakhon Phanom',
      'Nakhon Ratchasima',
      'Nakhon Sawan',
      'Nakhon Si Thammarat',
      'Nan',
      'Narathiwat',
      'Nong Bua Lam Phu',
      'Nong Khai',
      'Nonthaburi',
      'Pathum Thani',
      'Pattani',
      'Phang Nga',
      'Phatthalung',
      'Phayao',
      'Phetchabun',
      'Phetchaburi',
      'Phichit',
      'Phitsanulok',
      'Phra Nakhon Si Ayutthaya',
      'Phrae',
      'Phuket',
      'Prachinburi',
      'Prachuap Khiri Khan',
      'Ranong',
      'Ratchaburi',
      'Rayong',
      'Roi Et',
      'Sa Kaeo',
      'Sakon Nakhon',
      'Samut Prakan',
      'Samut Sakhon',
      'Samut Songkhram',
      'Saraburi',
      'Satun',
      'Sing Buri',
      'Sisaket',
      'Songkhla',
      'Sukhothai',
      'Suphan Buri',
      'Surat Thani',
      'Surin',
      'Tak',
      'Trang',
      'Trat',
      'Ubon Ratchathani',
      'Udon Thani',
      'Uthai Thani',
      'Uttaradit',
      'Yala',
      'Yasothon',
    ];

    return province
        .map(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(
              e,
              style: TextStyle(fontSize: 12),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Style_txtFie(
          control: name,
          hintText: 'Your name',
        ),
        SizedBox(
          height: 13,
        ),
        Style_txtFie(
          control: username,
          hintText: 'Username',
        ),
        SizedBox(
          height: 13,
        ),
        TextField(
          obscureText: true,
          controller: password,
          style: TextStyle(fontSize: 12),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            hintText: 'Password',
            hintStyle: TextStyle(
              fontSize: 10,
            ),
            fillColor: txtg,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'Contact',
          style: TextStyle(fontSize: 10),
        ),
        SizedBox(
          height: 13,
        ),
        Style_txtFie(
          control: phonenumber,
          hintText: 'Phone number',
        ),
        SizedBox(
          height: 13,
        ),
        Container(
          //margin: EdgeInsets.all(12),
          height: 5 * 24.0,
          child: TextField(
            controller: address,
            maxLines: 5,
            style: TextStyle(
              fontSize: 12,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              hintText: 'Address',
              hintStyle: TextStyle(
                fontSize: 10,
              ),
              fillColor: txtg,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          //height: 48,
          decoration: BoxDecoration(
            color: txtg,
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Container(
                child: Text(
                  'Select province',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              value: val_province,
              items: createDD(),
              onChanged: (String? newvalue) {
                setState(() {
                  val_province = newvalue!;
                });
              },
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'Transfer',
          style: TextStyle(fontSize: 10),
        ),
        SizedBox(
          height: 13,
        ),
        Style_txtFie(
          control: protmptpay,
          hintText: 'Protmptpay',
        ),
      ],
    );
  }
}

//Textfeild Style
class Style_txtFie extends StatelessWidget {
  const Style_txtFie({
    Key? key,
    required this.control,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController control;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: control,
      style: TextStyle(fontSize: 12),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 10,
        ),
        fillColor: txtg,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
