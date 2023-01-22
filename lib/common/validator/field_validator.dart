String validateName(String name) {
  if (name.isEmpty) {
    return "Name is Required";
  } else {
    return "";
  }
}

String validateEmail(String email) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (email.isEmpty || !regex.hasMatch(email)) {
    return "Email is Required";
  } else {
    return "";
  }
}
