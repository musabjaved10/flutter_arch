import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_code/presentation/resources/assets_manager.dart';
import 'package:flutter_clean_code/presentation/resources/color_manager.dart';
import 'package:flutter_clean_code/presentation/resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final List<SliderObject> _list = [
    SliderObject(
        title: 'SEE THE BEST COURSE #1',
        subtitle:
            'Tut app is an awesome flutter application using clean architecture #1',
        image: ImageAssets.onboardingLogo1),
    SliderObject(
        title: 'SEE THE BEST COURSE #2',
        subtitle:
            'Tut app is an awesome flutter application using clean architecture #2',
        image: ImageAssets.onboardingLogo2),
    SliderObject(
        title: 'SEE THE BEST COURSE #3',
        subtitle:
            'Tut app is an awesome flutter application using clean architecture #3',
        image: ImageAssets.onboardingLogo3),
    SliderObject(
        title: 'SEE THE BEST COURSE #4',
        subtitle:
            'Tut app is an awesome flutter application using clean architecture #4',
        image: ImageAssets.onboardingLogo4),
  ];
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark),
      ),
      bottomSheet: _getBottomSheetWidget(),
      body: PageView.builder(
          controller: _pageController,
          itemCount: _list.length,
          onPageChanged: (newIndex) {
            setState(() {
              currentIndex = newIndex;
              print(currentIndex);
            });
          },
          itemBuilder: (context, index) {
            return OnboardingPage(_list[index]);
          }),
    );
  }

  Container _getBottomSheetWidget() {
    return Container(
      color: ColorManager.white,
      height: AppSize.s100,
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {},
                  child:  Text(
                    'Skip',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.subtitle2,
                  ))),
          Container(
            color: ColorManager.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p14),
                  child: GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(_getPreviousIndex(),
                          duration: const Duration(
                              milliseconds: DurationConstants.d300),
                          curve: Curves.bounceInOut);
                      setState(() {

                      });
                    },
                    child: SizedBox(
                      height: AppSize.s20,
                      width: AppSize.s20,
                      child: SvgPicture.asset(ImageAssets.leftArrowIcon),
                    ),
                  ),
                ),
                Row(
                  children: [
                    for (int i = 0; i < _list.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(AppPadding.p8),
                        child: _getProperCircle(i),
                      )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p14),
                  child: GestureDetector(
                    onTap: () {
                      print('heee');
                      _pageController.animateToPage(_getNextIndex(),
                          duration: const Duration(
                              milliseconds: DurationConstants.d300),
                          curve: Curves.bounceInOut);
                    },
                    child: SizedBox(
                      height: AppSize.s20,
                      width: AppSize.s20,
                      child: SvgPicture.asset(ImageAssets.rightArrowIcon),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  int _getPreviousIndex() {
    int previousIndex = currentIndex--;
    if (previousIndex == -1) {
      currentIndex = _list.length - 1;
    }
    return currentIndex;
  }

  int _getNextIndex() {
    print('h');
    int nextIndex = currentIndex++;
    print(nextIndex);
    if (nextIndex == _list.length) {
      currentIndex = 0;
    }
    return currentIndex;
  }

  Widget _getProperCircle(int index) {
    return index == currentIndex
        ? SvgPicture.asset(ImageAssets.hollowCircle)
        : SvgPicture.asset(ImageAssets.solidCircle);
  }
}

class OnboardingPage extends StatelessWidget {
  SliderObject _sliderObject;

  OnboardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        const SizedBox(height: AppSize.s60),
        SvgPicture.asset(_sliderObject.image)
      ],
    );
  }
}

class SliderObject {
  String title;
  String subtitle;
  String image;

  SliderObject({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}
