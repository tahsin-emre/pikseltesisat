import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  Widget get toSliver => SliverToBoxAdapter(child: this);
  Widget get expanded => Expanded(child: this);
}
