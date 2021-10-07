import 'package:flutter/material.dart';

class AnimatedListPage extends StatefulWidget {
  const AnimatedListPage({Key? key}) : super(key: key);

  @override
  createState() => _AnimatedListState();
}

class _AnimatedListState extends State<AnimatedListPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final List<int> _items = [1, 2, 3, 4, 5];
  int counter = 0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Animated list')),
        body: AnimatedList(
            key: listKey,
            initialItemCount: _items.length,
            itemBuilder:
                (BuildContext context, int index, Animation<double> animation) {
              return fadeListTile(context, index, animation);
            }),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              insertPizza();
            }));
  }

  Widget fadeListTile(
      BuildContext context, int index, Animation<double> animation) {
    int item = _items[index];
    return FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(animation),
        child: Card(
            child: ListTile(
                title: Text('pizza ' + item.toString()),
                onTap: () {
                  removePizza(index);
                })));
  }

  removePizza(int index) async {
    if (index == _items.length - 1) index--;
    listKey.currentState!.removeItem(index, (context, animation) {
      return fadeListTile(context, index, animation);
    }, duration: const Duration(seconds: 1));
    await Future.delayed(const Duration(seconds: 1));
    _items.removeAt(index);
  }

  void insertPizza() {
    listKey.currentState!
        .insertItem(_items.length, duration: const Duration(seconds: 1));
    _items.add(++counter);
  }
}
