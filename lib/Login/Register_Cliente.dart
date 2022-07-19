import 'package:flutter/material.dart';

class RegisterCliente extends StatelessWidget {
  const RegisterCliente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var nameController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'تسجيل عميل',
          style: TextStyle(
            fontFamily: 'Tajawal',
            fontSize: 20,
            color:  Color(0xff0f0a39),
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.right,
          softWrap: false,
        ),
        iconTheme: const IconThemeData(
          color: Color(0xff0f0a39),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.13,
            ),
            const Text(
              'يرجى ادخال بياناتك',
              style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 28,
                color: const Color(0xff0f0a39),
                fontWeight: FontWeight.w700,
                height: 1.8571428571428572,
              ),
              textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            const Text(
              'يمكنك كتابة اسم المستخدم في الخانة المخصصة له أدناه',
              style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 20,
                color: Color(0xff7b7890),
                height: 2,
              ),
              textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              height: size.height * 0.06,
            ),
            const Text(
              'الاسم',
              style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 14,
                color:  Color(0xff7b7890),
                height: 1.7142857142857142,
              ),
              textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.right,
              softWrap: false,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              height: size.height * 0.05,
              width: size.width * 0.895,
              decoration: BoxDecoration(
                color: const Color(0xffF5F6FA),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value)
                  {
                    if(value == null) {
                      return 'رجاءا أدخل إسمك';
                    }
                    return null;
                  },
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 16,
                    color: Color(0xff0f0a39),

                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'أدخل إسمك',
                    hintStyle: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 16,
                      color:  Color(0xffcbc9d9),
                      //height: 1.5,
                    ),
                  ),
                  onTap: (){},
                  keyboardType: TextInputType.name,
                  controller: nameController,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            InkWell(

              onTap: (){},
              child: Container(
                height: size.height * 0.05,
                width: size.width * 0.895,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff5300BF),
                ),
                child: const Center(
                  child:Text(
                    'التالي',
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontSize: 16,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                    ),
                    textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
