import 'package:flutter/cupertino.dart';
import 'package:login_ui/translate_image.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  void _initScaleAnimation() {
    _scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _scaleAnimation =
        Tween<double>(begin: 1, end: .95).animate(_scaleController)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                _scaleController.reverse();
              }
            },
          );
  }

  @override
  void initState() {
    _initScaleAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: Stack(
        children: [
          Container(
            height: 450,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const TranslateImage(
            image: 'light-1.png',
            offset: Offset(-120, 80),
            height: 200,
          ),
          const TranslateImage(
            image: 'light-2.png',
            offset: Offset(80, 80),
            height: 120,
          ),
          const TranslateImage(
            image: 'clock.png',
            offset: Offset(170, 270),
            height: 120,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).padding.bottom + 20,
                horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGroupedBackground,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: CupertinoColors.inactiveGray.withOpacity(.5),
                          blurRadius: 20,
                          offset: const Offset(5, 5))
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CupertinoTextFormFieldRow(
                        decoration: const BoxDecoration(
                          // borderRadius: BorderRadius.circular(10),
                          border: Border(
                            bottom: BorderSide(
                                color: CupertinoColors.separator, width: 1),
                          ),
                        ),
                        placeholder: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        prefix: const Icon(CupertinoIcons.mail,
                            color: CupertinoColors.systemIndigo),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CupertinoTextFormFieldRow(
                        decoration: const BoxDecoration(
                          // borderRadius: BorderRadius.circular(10),
                          border: Border(
                            bottom: BorderSide(
                                color: CupertinoColors.separator, width: 1),
                          ),
                        ),
                        placeholder: 'Password',
                        obscureText: true,
                        prefix: const Icon(CupertinoIcons.lock,
                            color: CupertinoColors.systemIndigo),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                AnimatedBuilder(
                  animation: _scaleController,
                  builder: (_, child) => Transform.scale(
                    scale: _scaleAnimation.value,
                    child: CupertinoButton(
                      onPressed: () {
                        _scaleController.forward();
                      },
                      padding: EdgeInsets.zero,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              CupertinoColors.systemIndigo,
                              CupertinoColors.systemIndigo.withOpacity(.5),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: CupertinoColors.inactiveGray
                                    .withOpacity(.5),
                                blurRadius: 20,
                                offset: const Offset(5, 5))
                          ],
                        ),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: CupertinoColors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CupertinoButton(
                  onPressed: () {},
                  child: const Text(
                    'Forget Password',
                    style: TextStyle(
                      color: CupertinoColors.systemIndigo,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
