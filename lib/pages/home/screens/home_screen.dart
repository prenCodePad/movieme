import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app/routing/routes.dart';

import '../../../common/common.dart';
import '../../../config/config.dart';
import '../../../controllers/controllers.dart';
import '../../pages.dart';

class HomeScreen extends StatelessWidget with AppMixin {
  const HomeScreen({Key? key}) : super(key: key);
  HomeController get hc => Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'Welcome ${StoragePrefs.getStorageValue('name')}!',
                    style: theme.subTitle2(color: Colors.white),
                  ),
                ),
                PopupMenuButton(
                    color: theme.themeBlue,
                    icon: const Icon(Icons.more_vert, color: Colors.white),
                    itemBuilder: (c) => [
                          PopupMenuItem(
                              padding: EdgeInsets.zero,
                              child: InkWell(
                                onTap: () {
                                  snc.logOut();
                                  Get.offAllNamed(Routes.loginScreen);
                                },
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: theme.themeBlue,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(6)),
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    'LogOut',
                                    style: theme.button(color: Colors.white),
                                  ),
                                ),
                              ))
                        ]),
              ],
            ),
            verticalGap(30),
            Text(
              Constants.rateMovies,
              style: theme.subTitle3(color: theme.themeGreen),
            ),
            verticalGap(30),
            Text(
              Constants.recommendationQuote,
              style: theme.head2(color: Colors.white),
            ),
            verticalGap(30),
            CommonTextField(
              onChanged: (p) => hc.searchMovies(p ?? ''),
              decoration: InputDecoration(
                hintText: Constants.searchTitle,
                hintStyle: theme.body(color: Colors.white.withOpacity(0.4)),
                filled: true,
                border: _border(),
                enabledBorder: _border(),
                focusedBorder: _border(),
                fillColor: Colors.grey.withOpacity(0.1),
              ),
            ),
            Expanded(child: Obx(() {
              if (hc.loader.value) return Center(child: CircularProgressIndicator(color: theme.themeGreen));
              return GridView.builder(
                itemCount: hc.movies.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.8, crossAxisSpacing: 20.0, mainAxisSpacing: 20.0),
                itemBuilder: (context, index) {
                  return EventWidget(event: hc.movies[index]);
                },
              );
            })),
          ],
        ),
      ),
    );
  }

  _border() => OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(12),
      );
}
