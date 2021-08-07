import 'package:flutter/material.dart';
import 'package:interview_task/core/provider/base_provider.dart';
import 'package:interview_task/injection_container.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseProvider> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final Function(T)? onReady;

  BaseView({required this.builder, this.onReady});

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseProvider> extends State<BaseView<T>> {
  T model = sl<T>();

  @override
  void initState() {
    if (widget.onReady != null) {
      widget.onReady!(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) => model,
      child: Consumer<T>(builder: widget.builder)
    );
  }  
}