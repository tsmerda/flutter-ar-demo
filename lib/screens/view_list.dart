import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ViewList extends StatelessWidget {
  const ViewList({super.key});

  @override
  Widget build(BuildContext context) {
    final samples = [
      Sample(
        'ARKit',
        'The simple scene with a ball',
        Icons.home,
        () => context.push('/arkit'),
      ),
      Sample(
        'ARKit Mask',
        'The simple scene with face mask',
        Icons.home,
        () => context.push('/arkit-mask'),
      ),
      Sample(
        'ARKit Physics',
        'The simple scene with dynamic object',
        Icons.home,
        () => context.push('/arkit-physics'),
      ),
      Sample(
        'AR Collaboration',
        'The simple scene with collaboration',
        Icons.home,
        () => context.push('/ar-collaboration'),
      ),
      Sample(
        'Default Screen',
        'The simple screen with parameter',
        Icons.home,
        () => context.push('/page-with-parameter'),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('ARKit Demo'),
      ),
      body:
          ListView(children: samples.map((s) => SampleItem(item: s)).toList()),
    );
  }
}

class SampleItem extends StatelessWidget {
  const SampleItem({
    required this.item,
    Key? key,
  }) : super(key: key);
  final Sample item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => item.onTap(),
        child: ListTile(
          leading: Icon(item.icon),
          title: Text(
            item.title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          subtitle: Text(
            item.description,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
      ),
    );
  }
}

class Sample {
  const Sample(this.title, this.description, this.icon, this.onTap);
  final String title;
  final String description;
  final IconData icon;
  final Function onTap;
}
