import 'package:flutter/material.dart';
import 'package:flutter_app/routing/routes.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';

class LoginScreen extends StatelessWidget with AppMixin {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        color: theme.themeBlue,
        height: Get.height,
        width: Get.width,
        child: ListView(
          children: [
            verticalGap(Get.height * 0.1),
            Center(
                child: Text(Constants.logo,
                    style: theme.title2(
                      color: theme.themeGreen,
                      fontStyle: FontStyle.italic,
                    ))),
            SizedBox(height: Get.height * 0.1),
            CommonTextField(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              controller: snc.usernameController,
              hintText: Constants.username,
            ),
            Obx(
              () => CommonTextField(
                obscureText: !snc.showPassword.value,
                icon: InkWell(
                  onTap: () => snc.showPassword.value = !snc.showPassword.value,
                  child: Icon(snc.showPassword.value ? Icons.visibility_off_sharp : Icons.visibility_sharp,
                      color: Colors.white, size: 20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                controller: snc.passwordController,
                hintText: Constants.password,
              ),
            ),
            Container(
              width: Get.width * 0.5,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(theme.themeGreen),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                onPressed: () async {
                  if (!snc.loader.value) {
                    if (await snc.login()) Navigator.pushNamed(context, Routes.homeScreen);
                  }
                },
                child: Obx(() => Text(snc.loader.value ? Constants.logginIn : Constants.login,
                    style: theme.head1(color: theme.themeBlue))),
              ),
            ),
            verticalGap(Get.height * 0.05),
            //const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                Constants.or,
                style: theme.label1(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            verticalGap(Get.height * 0.05),

            Container(
              width: Get.width * 0.5,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(theme.themeBlue),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        side: BorderSide(color: theme.themeGreen), borderRadius: BorderRadius.circular(10)))),
                onPressed: () async {
                  if (!snc.signUpLoader.value) {
                    await snc.signUp();
                  }
                },
                child: Obx(() => Text(snc.signUpLoader.value ? Constants.signingUp : Constants.signUp,
                    style: theme.head1(color: theme.themeGreen))),
              ),
            ),
            verticalGap(Get.height * 0.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                Constants.loginSignUpClarification,
                style: theme.label1(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            //const Spacer(),
            //verticalGap(Get.height * 0.07),
          ],
        ),
      ),
    );
  }
}
