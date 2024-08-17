import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:app/navBar.dart';
import 'package:app/savedRecipes.dart';
import 'package:app/recipe.dart';
import 'ingredientsPage.dart';
import 'package:app/textStyles.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/camera': (context) => const CameraPage(),
        '/savedRecipes': (context) => const SavedRecipes(),
        '/ingredients': (context) => const ingredientsPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/recipeInfo') {
          final args = settings.arguments as Map<String, dynamic>;

          return MaterialPageRoute(
            builder: (context) {
              return recipeInfo(
                recipeName: args['recipeName'],
                recipeSteps: args['recipeSteps'],
                Ingredients: args['Ingredients'],
              );
            },
          );
        }
        return null; // Add other routes here as needed
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('imgs/homebg.jpg'),
            // Use AssetImage for local images
            fit: BoxFit.cover, // Ensure the image covers the entire container
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Welcome Back!',
                style: h1(),
              ),
              Text(
                'Ready to Cook?',
                style: h2(),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'To make something delicious:\n',
                      style: h1(),
                    ),
                    TextSpan(
                      text: '1. Scan Pantry\n'
                          '2. Choose a delicious recipe\n'
                          '3. Enjoy!\n',
                      style: h3(),
                    ),
                  ],
                ),
                textAlign: TextAlign
                    .left, // Ensure the entire text is aligned to the left
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(255, 215, 0, 0.6),
                        spreadRadius: 4, // Spread of the glow
                        blurRadius: 20, // Blur radius
                        offset: Offset(0, 0), // Position of the shadow
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(255, 215, 0, 0.8),
                      foregroundColor: Colors.black54,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/camera');
                    },
                    child: const Text(
                      'Scan Pantry',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(context, 1),
    );
  }
}

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );

    _initializeControllerFuture = _controller!.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    try {
      // Ensure the camera is initialized
      await _initializeControllerFuture;

      // Capture the image
      final image = await _controller!.takePicture();

      // Get the directory to save the image
      final imagePath =
          'app/web/picture_${DateTime.now().millisecondsSinceEpoch}.png';

      // Copy the captured image to the desired location
      await image.saveTo(imagePath);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Picture saved to $imagePath')),
      );
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Expanded(
                  child: CameraPreview(_controller!),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: _takePicture,
                    child: const Text('Take Picture'),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
