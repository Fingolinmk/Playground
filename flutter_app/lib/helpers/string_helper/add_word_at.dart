String addNumberAt(String msg, int position, num number) {
  if (position == msg.length) {
    return msg + "$number";
  }
  if (position > msg.length) {
    throw Exception("Number is to long");
  }

  return msg.substring(0, position) +
      "$number" +
      msg.substring(position, msg.length);
}
