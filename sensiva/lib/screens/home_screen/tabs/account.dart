import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:sensiva/core/core.dart';
import 'package:ui_common/ui_common.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 80),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 70,
                        backgroundColor: ThemeColors.prColor,
                        child: CircleAvatar(
                          radius: 68,
                          backgroundColor: ThemeColors.cardColor,
                          child: Icon(
                            IconlyBold.profile,
                            color: ThemeColors.selectedColor,
                            size: 40,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -10,
                        right: 0,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            IconlyLight.camera,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Chasm Chasm',
                      style: context.displayMedium.copyWith(
                        color: ThemeColors.textColor,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Text(
                    'chasm@gmail.com',
                    style: context.bodyMedium.copyWith(
                      color: ThemeColors.textColor,
                    ),
                  )
                ],
              ),
            ),
            const Gap(30),
            Text(
              'Account Settings',
              style: context.titleMedium.copyWith(
                color: ThemeColors.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const AccItem(
              itemName: 'Profile',
              subtitle: 'Update and modify your profile',
              icon: Icons.person,
            ),
            const AccItem(
              itemName: 'Payment ',
              subtitle: 'Visa ending with ..........1234',
              icon: Icons.money,
            ),
            const AccItem(
              itemName: 'Edit Address',
              subtitle: 'Edit you delivery address ',
              icon: IconlyBold.location,
            ),
            const Gap(30),
            Text(
              'App Settings',
              style: context.titleMedium.copyWith(
                color: ThemeColors.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const AccItem(
              itemName: 'Notifcations',
              subtitle: 'set and edit your notification preferences',
              icon: Icons.notifications,
            ),
            const AccItem(
              itemName: 'General Settings ',
              subtitle: 'Your app, your style! Make it yours',
              icon: Icons.settings,
            ),
            const AccItem(
              itemName: 'Help',
              subtitle: 'For all your queries',
              icon: IconlyBold.location,
            ),
          ],
        ),
      ),
    );
  }
}

class AccItem extends StatelessWidget {
  const AccItem({
    super.key,
    required this.itemName,
    required this.icon,
    required this.subtitle,
  });
  final String itemName, subtitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: ThemeColors.cardColor,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: ThemeColors.selectedColor),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          dense: true,
          leading: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Icon(
              icon,
              color: ThemeColors.prColor,
              size: 25,
            ),
          ),
          title: Text(
            itemName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.bodyLarge.copyWith(
              color: ThemeColors.textColor,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: context.bodySmall.copyWith(
              color: ThemeColors.textColor,
            ),
          ),
          trailing: const Icon(
            IconlyLight.arrow_right_2,
            color: ThemeColors.textColor,
            size: 25,
          ),
        ),
      ),
    );
  }
}
