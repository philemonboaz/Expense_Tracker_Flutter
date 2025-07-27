String dateFormat(String date) {
  if (date != "") {
    return date.split("T")[0];
  } else {
    return "";
  }
}
