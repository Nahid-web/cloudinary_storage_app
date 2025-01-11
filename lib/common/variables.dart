import 'package:flutter_dotenv/flutter_dotenv.dart';

final cloudName = dotenv.env['CLOUDINARY_CLOUD_NAME'] ?? '';
final uploadPresent = dotenv.env['UPLOAD_PRESET'] ?? '';
