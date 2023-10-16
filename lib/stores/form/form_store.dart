// ignore_for_file: unrelated_type_equality_checks, library_private_types_in_public_api, avoid_print

import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';
import 'package:car_master/stores/error/error_store.dart';

part 'form_store.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  _FormStore() {
    _setupValidations();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => userEmail, validateUserEmail),
      reaction((_) => password, validatePassword),
      reaction((_) => confirmPassword, validateConfirmPassword),
      reaction((_) => mobile, validateMobile),
      reaction((_) => firstName, validateFirstName),
      reaction((_) => lastName, validateLastName),
      reaction((_) => age, validateAge),
      reaction((_) => gender, validateGender),
      reaction((_) => pincode, validatePincode),
      reaction((_) => flatName, validateFlatName),
      reaction((_) => streetName, validateStreetName),
      reaction((_) => prefLocation, validatePrefLocation),
      reaction((_) => startDate, validateStartDate),
      reaction((_) => lastDate, validateLastDate),
      reaction((_) => lastDate, validateEmgContactNo),
      reaction((_) => lastDate, validateEmgName),
      reaction((_) => lastDate, validateCertificateNo),
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  String userEmail = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @observable
  String mobile = '';

  @observable
  String certificateNo = '';

  @observable
  String firstName = '';

  @observable
  String lastName = '';

  @observable
  String emgContactNo = '';

  @observable
  String emgName = '';

  @observable
  String pincode = '';

  @observable
  String flatName = '';

  @observable
  String streetName = '';

  @observable
  String prefLocation = '';

  @observable
  String age = '';

  @observable
  String gender = '';

  @observable
  String startDate = '';

  @observable
  String lastDate = '';

  @observable
  String date = '';

  @observable
  bool success = false;

  @observable
  bool loading = false;

  @computed
  bool get canLogin =>
      !formErrorStore.hasErrorsInLogin &&
      userEmail.isNotEmpty &&
      password.isNotEmpty;

  @computed
  bool get canRegister =>
      !formErrorStore.hasErrorsInRegister &&
      userEmail.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty;

// Login page validation
  @computed
  bool get canRegisterMobile =>
      !formErrorStore.hasErrorsInRegisterMobile &&
      mobile.isNotEmpty &&
      mobile.length == 10;

// User Register page validation
  @computed
  bool get canRegisterYourSelf =>
      !formErrorStore.hasErrorsInRegisterYourSelf &&
      firstName.isNotEmpty &&
      lastName.isNotEmpty;

// User Register contact page validation
  @computed
  bool get canRegisterContact =>
      !formErrorStore.hasErrorsInRegisterContact &&
      mobile.isNotEmpty &&
      mobile.length == 10 &&
      emgContactNo.isNotEmpty &&
      emgContactNo.length == 10 &&
      emgName.isNotEmpty &&
      userEmail.isNotEmpty &&
      isEmail(userEmail);

// User Register Address page validation
  @computed
  bool get canRegisterAddress =>
      !formErrorStore.hasErrorsInRegisterAddress &&
      flatName.isNotEmpty &&
      pincode.isNotEmpty &&
      streetName.isNotEmpty;

// User Address book page validation
  @computed
  bool get canAddAddress =>
      !formErrorStore.hasErrorsInAddAddress &&
      flatName.isNotEmpty &&
      pincode.isNotEmpty &&
      mobile.isNotEmpty &&
      streetName.isNotEmpty;

  @computed
  bool get canForgetPassword =>
      !formErrorStore.hasErrorInForgotPassword && userEmail.isNotEmpty;

  @computed
  bool get canSatrtDate =>
      !formErrorStore.hasErrorsInStartDate &&
      startDate.isNotEmpty &&
      lastDate.isNotEmpty &&
      startDate != lastDate &&
      lastDate != "null" &&
      startDate != "null" &&
      lastDate != "Schedule time should be after 2 hour" &&
      startDate != "Schedule time should be after 2 hour" &&
      lastDate != 'End time should be after start time';

  @computed
  bool get canScheduleCall =>
      !formErrorStore.hasErrorsInScheduleCall &&
      startDate.isNotEmpty &&
      certificateNo.isNotEmpty &&
      certificateNo.length == 12;
  // actions:-------------------------------------------------------------------
  @action
  void setEmail(String value) {
    userEmail = value;
  }

  @action
  void setEmgNo(String value) {
    emgContactNo = value;
  }

  @action
  void setEmgName(String value) {
    emgName = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setMobile(String value) {
    mobile = value;
  }

  @action
  void setCertificateNo(String value) {
    certificateNo = value;
  }

  @action
  void setFirstName(String value) {
    firstName = value;
  }

  @action
  void setLastName(String value) {
    lastName = value;
  }

  @action
  void setAge(String value) {
    age = value;
  }

  @action
  void setPinCode(String value) {
    pincode = value;
  }

  @action
  void setFlatName(String value) {
    flatName = value;
  }

  @action
  void setStreetName(String value) {
    streetName = value;
  }

  @action
  void setPrefLocation(String value) {
    prefLocation = value;
  }

  @action
  void setGender(String value) {
    gender = value;
  }

  @action
  void setStartDate(String value) {
    startDate = value;
  }

  @action
  void setLastDate(String value) {
    lastDate = value;
  }

  @action
  void setDate(String value) {
    date = value;
  }

  @action
  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  @action
  void validateUserEmail(String value) {
    if (value.isEmpty) {
      formErrorStore.userEmail = "Email can't be empty";
    } else if (!isEmail(value)) {
      formErrorStore.userEmail = 'Please enter a valid email address';
    } else {
      formErrorStore.userEmail = null;
    }
  }

  @action
  void validatePassword(String value) {
    if (value.isEmpty) {
      formErrorStore.password = "Password can't be empty";
    } else if (value.length < 6) {
      formErrorStore.password = "Password must be at-least 6 characters long";
    } else {
      formErrorStore.password = null;
    }
  }

  @action
  void validateConfirmPassword(String value) {
    if (value.isEmpty) {
      formErrorStore.confirmPassword = "Confirm password can't be empty";
    } else if (value != password) {
      formErrorStore.confirmPassword = "Password doen't match";
    } else {
      formErrorStore.confirmPassword = null;
    }
  }

  @action
  void validateMobile(String value) {
    if (value.isEmpty) {
      formErrorStore.mobile =
          "Please enter a valid mobile number to receive OTP";
    } else if (value.length < 10) {
      formErrorStore.mobile = 'Please enter a valid Mobile Number';
    } else {
      formErrorStore.mobile = null;
    }
  }

  @action
  void validateCertificateNo(String value) {
    if (value.isEmpty) {
      formErrorStore.certificateNo = "Please enter Certificate Number";
    } else if (value.length < 12) {
      formErrorStore.certificateNo = 'Please enter a valid Certificate Number';
    } else {
      formErrorStore.certificateNo = null;
    }
  }

  @action
  void validateEmgContactNo(String value) {
    if (value.isEmpty) {
      formErrorStore.emgContactNo = "Please enter Mobile Number";
    } else if (value.length < 10) {
      formErrorStore.emgContactNo = 'Please enter a valid Mobile Number';
    } else {
      formErrorStore.emgContactNo = null;
    }
  }

  @action
  void validateEmgName(String value) {
    if (value.isEmpty) {
      formErrorStore.emgName = "Emergency contact Name can't be empty";
    } else if (value != emgName) {
      formErrorStore.emgName = 'Please enter a valid Name';
    } else {
      formErrorStore.emgName = null;
    }
  }

  @action
  void validateStartDate(String value) {
    if (value.isEmpty) {
      formErrorStore.startDate = "Start date can't be empty";
    } else if (value == "Schedule time should be after 2 hour") {
      formErrorStore.startDate = 'Schedule Start time should be after 2 hour';
    } else if (value == "null") {
      formErrorStore.startDate = 'Please Select a Start date';
    } else if (value != startDate) {
      formErrorStore.startDate = 'Please Select a Start date';
    } else {
      formErrorStore.startDate = null;
    }
  }

  @action
  void validateLastDate(String value) {
    if (value.isEmpty) {
      formErrorStore.lastDate = "End date can't be empty";
    } else if (value == "End time should be after 2 hour") {
      formErrorStore.lastDate = 'End time should be after 2 hour';
    } else if (value == "End time should be after start time") {
      formErrorStore.lastDate = 'End time should be after start time';
    } else if (value == "null") {
      formErrorStore.lastDate = 'Please Select a end date';
    } else if (value != lastDate) {
      formErrorStore.lastDate = 'Please Select a end date';
    } else if (value == startDate) {
      formErrorStore.lastDate = "Start date & end date can't be same";
    } else {
      formErrorStore.lastDate = null;
    }
  }

  @action
  void validateFirstName(String value) {
    if (value.isEmpty) {
      formErrorStore.firstName = "First name is required";
    } else if (value != firstName) {
      formErrorStore.firstName = 'Please enter a valid First Name';
    } else {
      formErrorStore.firstName = null;
    }
  }

  @action
  void validateLastName(String value) {
    if (value.isEmpty) {
      formErrorStore.lastName = "Last name is required";
    } else if (value != lastName) {
      formErrorStore.lastName = 'Please enter a valid Last Name';
    } else {
      formErrorStore.lastName = null;
    }
  }

  @action
  void validateAge(String value) {
    if (value.isEmpty) {
      formErrorStore.age = "Age can't be empty";
    } else if (value != age) {
      formErrorStore.age = 'Please enter a valid age';
    } else {
      formErrorStore.age = null;
    }
  }

  @action
  void validateFlatName(String value) {
    if (value.isEmpty) {
      formErrorStore.flatName = "Flat Name can't be empty";
    } else if (value != flatName) {
      formErrorStore.flatName = 'Please enter a valid flat name';
    } else {
      formErrorStore.flatName = null;
    }
  }

  @action
  void validateStreetName(String value) {
    if (value.isEmpty) {
      formErrorStore.streetName = "Street Name can't be empty";
    } else if (value != streetName) {
      formErrorStore.streetName = 'Please enter a valid street name';
    } else {
      formErrorStore.streetName = null;
    }
  }

  @action
  void validatePrefLocation(String value) {
    if (value.isEmpty) {
      formErrorStore.prefLocation = "Preferred Location can't be empty";
    } else if (value != prefLocation) {
      formErrorStore.prefLocation = 'Please enter a valid Preferred Location';
    } else {
      formErrorStore.prefLocation = null;
    }
  }

  @action
  void validatePincode(String value) {
    if (value.isEmpty) {
      formErrorStore.pincode = "Pincode can't be empty";
    } else if (value.length < 6) {
      formErrorStore.pincode = 'Please enter a valid pincode';
    } else {
      formErrorStore.pincode = null;
    }
  }

  @action
  void validateGender(String value) {
    if (value.isEmpty) {
      formErrorStore.gender = "Gender can't be empty";
    } else if (!isEmail(value)) {
      formErrorStore.gender = 'Please enter a valid gender';
    } else {
      formErrorStore.gender = null;
    }
  }

  @action
  Future register() async {
    loading = true;
  }

  @action
  Future login() async {
    loading = true;

    Future.delayed(const Duration(milliseconds: 2000)).then((future) {
      loading = false;
      success = true;
    }).catchError((e) {
      loading = false;
      success = false;
      errorStore.errorMessage = e.toString().contains("ERROR_USER_NOT_FOUND")
          ? "Username and password doesn't match"
          : "Something went wrong, please check your internet connection and try again";
      print(e);
    });
  }

  @action
  Future forgotPassword() async {
    loading = true;
  }

  @action
  Future logout() async {
    loading = true;
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validatePassword(password);
    validateUserEmail(userEmail);
    validateMobile(mobile);
    validateFirstName(firstName);
    validateLastName(lastName);
    validateAge(age);
    validateGender(gender);
    validatePincode(lastName);
    validateFlatName(age);
    validateStreetName(gender);
    validateLastDate(lastDate);
    validateStartDate(startDate);
  }
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {
  @observable
  String? userEmail;

  @observable
  String? password;

  @observable
  String? confirmPassword;

  @observable
  String? mobile;

  @observable
  String? certificateNo;

  @observable
  String? firstName;

  @observable
  String? lastName;

  @observable
  String? age;

  @observable
  String? flatName;

  @observable
  String? streetName;

  @observable
  String? prefLocation;

  @observable
  String? pincode;

  @observable
  String? gender;

  @observable
  String? startDate;

  @observable
  String? lastDate;

  @observable
  String? emgContactNo;

  @observable
  String? emgName;

  @computed
  bool get hasErrorsInLogin => userEmail != null || password != null;

  @computed
  bool get hasErrorsInRegisterMobile => mobile != null;

  @computed
  bool get hasErrorsInRegisterYourSelf => firstName != null || lastName != null;

  @computed
  bool get hasErrorsInRegisterAddress =>
      pincode != null || flatName != null || streetName != null;

  @computed
  bool get hasErrorsInAddAddress =>
      pincode != null ||
      flatName != null ||
      streetName != null && mobile != null;

  @computed
  bool get hasErrorsInRegisterContact =>
      mobile != null ||
      userEmail != null ||
      emgContactNo != null ||
      emgName != null;

  @computed
  bool get hasErrorsInRegister =>
      userEmail != null || password != null || confirmPassword != null;

  @computed
  bool get hasErrorInForgotPassword => userEmail != null;

  @computed
  bool get hasErrorsInStartDate => lastDate != null || startDate != null;

  @computed
  bool get hasErrorsInScheduleCall =>
      startDate != null || certificateNo != null;
}
