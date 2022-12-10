import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class TitleContainer extends StatelessWidget {
  const TitleContainer({super.key});

  @override
  Widget build(BuildContext context) {
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
