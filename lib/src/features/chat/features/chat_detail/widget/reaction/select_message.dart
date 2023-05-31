class SelectMessage {
  const SelectMessage(this.action, [this.content = '']);
  final SelectMessageAction action;
  final String content;
}

enum SelectMessageAction {
  reaction,
  reply,
}
