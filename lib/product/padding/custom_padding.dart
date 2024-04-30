import 'package:flutter/widgets.dart';

class ProjectPadding extends EdgeInsets {
  const ProjectPadding.all(double value) : super.fromLTRB(value, value, value, value);

  const ProjectPadding.only({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) : super.fromLTRB(left, top, right, bottom);

  const ProjectPadding.symmetric({
    double vertical = 0.0,
    double horizontal = 0.0,
  }) : super.symmetric(vertical: vertical, horizontal: horizontal);
  //top twenty
  const ProjectPadding.topTwenty() : super.only(top: 20.0);
}
