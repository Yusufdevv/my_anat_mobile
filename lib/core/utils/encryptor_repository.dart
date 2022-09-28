import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';

class EncryptorRepository {
  final String key;
  final String iv;
  late Encrypter _encryptor;

  EncryptorRepository({required this.iv, required this.key}) {
    _encryptor = Encrypter(AES(getKey));
  }

  List<int> getDecryptedDAta(Uint8List data) {
    Encrypted encryptedData = Encrypted(data);
    return _encryptor.decryptBytes(encryptedData, iv: getIV);
  }

  Key get getKey => Key.fromUtf8(key);

  IV get getIV => IV.fromUtf8(iv);

  Encrypter get encryptor => _encryptor;
}
