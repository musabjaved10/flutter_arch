import 'dart:async';

import 'package:flutter_clean_code/domain/model.dart';
import 'package:flutter_clean_code/presentation/base/base_view_model.dart';
import 'package:flutter_clean_code/presentation/resources/assets_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final StreamController _streamController =
      StreamController<SliderViewObject>();

  late List<SliderObject> _list;

  int currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    //send this slider data to our view
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = currentIndex++;
    if (nextIndex == _list.length) {
      currentIndex = 0;
    }
    _postDataToView();
    return currentIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = currentIndex--;
    if (previousIndex == -1) {
      currentIndex = _list.length - 1;
    }
    _postDataToView();
    return currentIndex;
  }

  @override
  void onPageChanged(int index) {
    currentIndex = index;
    _postDataToView();
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  // TODO: implement outputSliderViewObject
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  //private functions
  List<SliderObject> _getSliderData() => [
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

  _postDataToView(){
    inputSliderViewObject.add(SliderViewObject(sliderObject: _list[currentIndex], numOfSlides: _list.length, currentIndex: currentIndex));
  }
}

// input means the order that our viewmodel receives from our view
abstract class OnBoardingViewModelInputs {
  void goNext(); //when user click on next arrow or swipe
  void goPrevious();

  void onPageChanged(int index);

  Sink get inputSliderViewObject; // this is the way to add data to stream
}

// output means the data will be sent to the view
abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject(
      {required this.sliderObject,
      required this.numOfSlides,
      required this.currentIndex});
}
