# Responsive Dashboard

## What i've learned?

1. How to create an responsive layout by define the layout structure that each
device - web, tablet, phone - will use;

   - Using different layout structures by creating a class called `responsive.dart`.

2. Create and use a `app_colors.dart` that contains all the colors the app will use;

   - Need to improve the use of constraints in the app.

3. How to use the [FL_CHART](https://pub.dev/packages/fl_chart) flutter package;

   - Pie chart
   - Line chart
   - Bar chart

4. Use of `models` and `data` classes to structure and populate the charts in the app;

5. Sometimes, for a more flexible AppBar, is recommended to create your own and
call the AppBar function when needed.

```dart
if (!Responsive.isDesktop(context))
    child: InkWell(
        onTap: () => Scaffold.of(context).openDrawer(),
        // Simulate the APPBAR function of openDrawer
        ...
```
