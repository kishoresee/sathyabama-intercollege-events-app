import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseAuth auth = FirebaseAuth.instance;

ImagePicker picker = ImagePicker();
Uuid uuid = const Uuid();
FirebaseStorage storage = FirebaseStorage.instance;
