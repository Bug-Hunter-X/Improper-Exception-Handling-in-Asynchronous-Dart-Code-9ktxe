```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class Result<T> {
  final T? data;
  final Exception? error;

  Result({this.data, this.error});
}

Future<Result<Map<String, dynamic>>> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Result(data: jsonData);
    } else {
      return Result(error: Exception('Failed to load data. Status code: ${response.statusCode}'));
    }
  } catch (e) {
    return Result(error: Exception('Error fetching data: $e'));
  }
}
```