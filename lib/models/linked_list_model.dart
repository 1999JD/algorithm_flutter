class Node<T> {
  Node({required this.value, this.next});
  T value;
  Node<T>? next;
  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
}

class LinkedListModel<E> {
  Node<E>? head;
  Node<E>? tail;

  bool get isEmpty => head == null;
  @override
  String toString() {
    if (isEmpty) return 'Empty List';
    return head.toString();
  }

  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }
}
