import 'package:flutter/material.dart';
import 'package:movies_listing/features/movies/widgets/company_info_popup.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        PopupMenuButton<String>(
          icon: const Icon(Icons.menu),
          onSelected: (String companyName) {
            showCompanyInfoDialog(context);
          },
          itemBuilder: (BuildContext context) {
            return {
              'Company Info': 'Geeksynergy technologies',
            }.keys.map((String companyName) {
              return PopupMenuItem<String>(
                value: companyName,
                child: Text(companyName),
              );
            }).toList();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
