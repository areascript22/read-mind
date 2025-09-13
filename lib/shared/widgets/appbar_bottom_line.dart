import 'package:flutter/material.dart';

PreferredSize appbarContainer(BuildContext context, {required AppBar appBar}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Theme.of(
              context,
            ).colorScheme.inversePrimary.withValues(alpha:  0.2),
            blurRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAlias, // ensures clipping of child
      child: AppBar(
        title: appBar.title,
        actions: appBar.actions,
        leading: appBar.leading,
        backgroundColor:
        appBar.backgroundColor ?? Theme.of(context).colorScheme.surface,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
    ),
  );
}
