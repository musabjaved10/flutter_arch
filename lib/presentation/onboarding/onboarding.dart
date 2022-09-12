import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_code/domain/model.dart';
import 'package:flutter_clean_code/presentation/onboarding/onboarding_view_model.dart';
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
  final PageController _pageController = PageController(initialPage: 0);
  OnBoardingViewModel _viewModel = OnBoardingViewModel();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject ,
      builder: (context, snapshot) {
        return _getScaffoldContent(snapshot.data);
      }
    );
  }

  Widget _getScaffoldContent(SliderViewObject? sliderViewObject ) {
    if(sliderViewObject == null){
      return SizedBox();
    }
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
        bottomSheet: _getBottomSheetWidget(sliderViewObject!),
        body: PageView.builder(
            controller: _pageController,
            itemCount: sliderViewObject?.numOfSlides,
            onPageChanged: (index){
              _viewModel.onPageChanged(index);
            },
            itemBuilder: (context, index) {
              return OnboardingPage(sliderViewObject!.sliderObject);
            }),
      );
  }

  Container _getBottomSheetWidget(SliderViewObject sliderViewObject) {
    return Container(
      color: ColorManager.white,
      height: AppSize.s100,
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
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
                      _pageController.animateToPage(_viewModel.goPrevious(),
                          duration: const Duration(
                              milliseconds: DurationConstants.d300),
                          curve: Curves.bounceInOut);
                      setState(() {});
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
                    for (int i = 0; i < sliderViewObject.numOfSlides; i++)
                      Padding(
                        padding: const EdgeInsets.all(AppPadding.p8),
                        child: _getProperCircle(i, sliderViewObject.currentIndex),
                      )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p14),
                  child: GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(_viewModel.goNext(),
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

  Widget _getProperCircle(int index, currentIndex) {
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
