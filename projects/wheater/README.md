# Weather

Yeah, i know that i`ved missed spelled Weather 

## What i've learned?
1. How to use the BLOC extention and it parterns;

2. Asyncrhonous requisition in flutter;
    - Using `Future` , `async` and `FutureBuilder`

```dart
Future<void> main() async {}
```

    - Also create a circular loading screen.

3. The EXTENDED widget doesn't work with the STACK;
    - Using SizeBox and MediaQueries

4. Usage of Blur BackdropFilter to create a cool estitic on the app;
```dart
// Containers to be blured
BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
    child: Container(color: Colors.transparent),
),
```

5. How to lock the app in a portrait mode;