import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const CounterImageToggleApp());
}

class CounterImageToggleApp extends StatelessWidget {
  const CounterImageToggleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'CW1 Counter & Toggle',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int _counter = 0;
  int _step = 1;
  bool _isDark = false;
  bool _isFirstImage = true;
  final List<int> _history = [];
  final AudioPlayer _audioPlayer = AudioPlayer();

  late final AnimationController _controller;
  late final Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _history.add(_counter);
      if (_history.length > 5) {
        _history.removeAt(0);
      }
      _counter += _step;
    });
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _history.add(_counter);
        if (_history.length > 5) {
          _history.removeAt(0);
        }
        _counter -= _step;
        if (_counter < 0) {
          _counter = 0;
        }
      });
    }
  }

  void _resetCounter() {
    if (_counter != 0) {
      setState(() {
        _history.add(_counter);
        if (_history.length > 5) {
          _history.removeAt(0);
        }
        _counter = 0;
      });
    }
  }

  void _undo() {
    if (_history.isNotEmpty) {
      setState(() {
        _counter = _history.removeLast();
      });
    }
  }

  void _toggleTheme() {
    setState(() => _isDark = !_isDark);
  }

  void _toggleImage() async {
    if (_isFirstImage) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    setState(() => _isFirstImage = !_isFirstImage);
    
    try {
      await _audioPlayer.play(AssetSource('toggle_sound.mp3'));
    } catch (e) {
      debugPrint('Audio playback error: $e');
    }
  }

  void _changeStep(int newStep) {
    setState(() => _step = newStep);
  }

  Color _getCounterColor() {
    if (_counter < 10) {
      return Colors.green;
    } else if (_counter < 25) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CW1 Counter & Toggle'),
          actions: [
            IconButton(
              onPressed: _toggleTheme,
              icon: Icon(_isDark ? Icons.light_mode : Icons.dark_mode),
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Counter: $_counter',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: _getCounterColor(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _counter == 0 ? null : _decrementCounter,
                      child: const Text('Decrement'),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: _incrementCounter,
                      child: const Text('Increment'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _counter == 0 ? null : _resetCounter,
                      child: const Text('Reset'),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: _history.isEmpty ? null : _undo,
                      child: const Text('Undo'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Step Size: $_step',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChoiceChip(
                      label: const Text('+1'),
                      selected: _step == 1,
                      onSelected: (selected) {
                        if (selected) _changeStep(1);
                      },
                    ),
                    const SizedBox(width: 8),
                    ChoiceChip(
                      label: const Text('+5'),
                      selected: _step == 5,
                      onSelected: (selected) {
                        if (selected) _changeStep(5);
                      },
                    ),
                    const SizedBox(width: 8),
                    ChoiceChip(
                      label: const Text('+10'),
                      selected: _step == 10,
                      onSelected: (selected) {
                        if (selected) _changeStep(10);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                FadeTransition(
                  opacity: _fade,
                  child: Image.asset(
                    _isFirstImage ? 'assets/image1.png' : 'assets/image2.png',
                    width: 180,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: _toggleImage,
                  child: const Text('Toggle Image'),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
