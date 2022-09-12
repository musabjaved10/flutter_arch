abstract class BaseViewModel extends BaseViewModelInputs with BaseViewModelOutputs {
  //shared variables and functions that will be used throughout the other view models

}
abstract class BaseViewModelInputs {
  void start(); //will be called while initializetion
  void dispose(); //will be called while viewmodel dies

}

abstract class BaseViewModelOutputs {
  //shared variables and functions that will be used throughout the other view models

}