import 'package:flutter/material.dart';
import 'package:qfoumn/constants/colors.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        // resizeToAvoidBottomInset: true,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text("Feed Back"),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 62, left: 12.0, right: 12.0, top: 12.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildHeader(),
                    const Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 10, left: 5),
                      child: Text(
                        'Comments',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    ...List.generate(10, (index) => buildCardComment())
                  ],
                ),
              ),
            ),
            Positioned(bottom: 0, child: buildTextField())
          ],
        ),
      ),
    );
  }

  Container buildTextField() {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 1,
      color: ColorsConstant.darkPrimaryColor,
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: commentController,
        scrollPadding: const EdgeInsets.only(bottom: 40),
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: "Comment",
            border: InputBorder.none,
            // enabledBorder: const UnderlineInputBorder(
            //   borderSide: BorderSide(color: Colors.blue),
            // ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            // focusedBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(color: ColorsConstant.textLightGrey),
            // ),
            hintStyle: TextStyle(color: ColorsConstant.textLightGrey),
            suffixIcon: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                    )))),
      ),
    );
  }

  Container buildCardComment() {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsConstant.primaryColor,
        border: Border.all(color: ColorsConstant.borderColor, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
        child: Column(
          children: [
            const Text(
              'ຖ້າຖືກໃຈຢ່າລື່ມຝາກກົດໄລ້ກົດຕິດຕາມຂ້ອຍແນ່ເດີ...ຮັບຮອງວ່າຈະນຳຄວາມຮູ້ດີໆມາຝາກທຸກໆທ່ານແນ່ນອນ :)',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'User: ໄຊສົມພອນ ວັນນະແສງ',
                  style: TextStyle(color: ColorsConstant.textLightGrey),
                ),
                Text(
                  'Time: 5s ago',
                  style: TextStyle(color: ColorsConstant.textLightGrey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container buildHeader() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsConstant.darkPrimaryColor,
        border: Border.all(color: ColorsConstant.borderColor, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ທ່ານມັກກິນຫຍັງ?",
              style: TextStyle(
                  color: ColorsConstant.textYellowColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              'User: ໄຊສົມພອນ ວັນນະແສງ',
              style: TextStyle(color: ColorsConstant.textLightGrey),
            ),
            const SizedBox(height: 15),
            const Text(
              'ສະຖານະການປະເທດທີ່ຊ່ວຍເຫຼືອ ແລະ ພາບອັບເດດຊ່ວງວັນທີ:24-25/07/2018 , ນໍ້າຖ້ວມອັດຕະປື ເປັນເຫດການທີ່ຮຸ່ນແຮງທີ່ສຸດ ຈົນລັດຖະບານປະກາດເປັນ “ໄພພິບັດແຫ່ງຊາດ” ໃນວັນທີ 24/07/2018 , ຕໍ່ໜ້າສະພາບດັ່ງກ່າວໄດ້ມີມິດປະເທດ ບ້ານພີ່ເມືອງນ້ອງ ແລະ ປະເທດເພື່ອນມິດຍຸດທະສາດ ຂອງສປປລາວ ,ຢືນມືເຂົ້າຊ່ວຍເຫຼືອຢ່າງຮີບດ່ວນທີ່ສຸດ, ດັ່ງທີ່ພວກເຮົາຈະເຫັນໄດ້ຈາກຂ່າວທີ່ນໍາສະເໜີໄປກ່ອນໜ້າ ແລະ ຮູບພາບດ່ານລຸ່ມນີ້',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'Time: 5s ao',
                style: TextStyle(color: ColorsConstant.textLightGrey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
