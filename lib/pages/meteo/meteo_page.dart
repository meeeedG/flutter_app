import 'package:flutter/material.dart';
import 'package:github_api_flutter_app/services/meteo_service.dart';

class MeteoPage extends StatefulWidget {
  const MeteoPage({Key? key}) : super(key: key);

  @override
  State<MeteoPage> createState() => _MeteoPageState();
}

class _MeteoPageState extends State<MeteoPage> {
  final _controller = TextEditingController();
  final _service = MeteoService();
  Map<String, dynamic>? _data;
  String? _error;
  bool _loading = false;

  Future<void> _search() async {
    final city = _controller.text.trim();
    if (city.isEmpty) return;

    setState(() {
      _loading = true;
      _error = null;
      _data = null;
    });

    try {
      final res = await _service.fetchWeather(city);
      setState(() {
        _data = res;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildResult() {
    if (_loading) return const Center(child: CircularProgressIndicator());
    if (_error != null)
      return Center(
        child: Text(
          'Erreur: $_error',
          style: const TextStyle(color: Colors.red),
        ),
      );
    if (_data == null) return const Center(child: Text('Aucune donnée'));

    final main = _data!['main'] ?? {};
    final weatherList = _data!['weather'] as List<dynamic>? ?? [];
    final weather = weatherList.isNotEmpty ? weatherList.first : null;
    final name = _data!['name'] ?? '';

    final items = <Map<String, String>>[
      {'label': 'Ville', 'value': name.toString()},
      {
        'label': 'Météo',
        'value': weather != null ? (weather['description'] ?? '') : '',
      },
      {'label': 'Température', 'value': '${main['temp']?.toString() ?? ''} °C'},
      {
        'label': 'Temp min',
        'value': '${main['temp_min']?.toString() ?? ''} °C',
      },
      {
        'label': 'Temp max',
        'value': '${main['temp_max']?.toString() ?? ''} °C',
      },
      {'label': 'Humidité', 'value': '${main['humidity']?.toString() ?? ''} %'},
    ];

    return ListView.separated(
      shrinkWrap: true,
      itemCount: items.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final it = items[index];
        return ListTile(
          title: Text(it['label']!),
          subtitle: Text(it['value'] ?? ''),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Météo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Ville',
                hintText: 'Entrez le nom de la ville',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (_) => _search(),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _search, child: const Text('Rechercher')),
            const SizedBox(height: 16),
            Expanded(child: SingleChildScrollView(child: _buildResult())),
          ],
        ),
      ),
    );
  }
}
