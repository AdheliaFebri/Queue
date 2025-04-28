import 'dart:io';

class AntrianNomor {
  List<int?> _queue = [];
  int _front = 0;
  int _rear = 0;
  int _size = 0;
  int _maxQueue = 0;

  void BuatAntrian(int kapasitas) {
    _maxQueue = kapasitas;
    _queue = List<int?>.filled(kapasitas, null);
    _front = 0;
    _rear = 0;
    _size = 0;
  }

  bool isEmpty() => _size == 0;

  bool isFull() => _size == _maxQueue;

  void TambahAntrian(int nomor) {
    if (isFull()) {
      print("Antrian penuh! Tidak bisa menambah nomor $nomor.");
    } else {
      _queue[_rear] = nomor;
      _rear = (_rear + 1) % _maxQueue;
      _size++;
      print("Nomor antrian $nomor berhasil ditambahkan.");
    }
  }

  void KeluarkanAntrian() {
    if (isEmpty()) {
      print("Antrian kosong! Tidak ada yang dikeluarkan.");
    } else {
      int? nomor = _queue[_front];
      _queue[_front] = null;
      _front = (_front + 1) % _maxQueue;
      _size--;
      print("Nomor antrian $nomor telah keluar dari antrian.");
    }
  }

  void TampilkanAntrian() {
    if (isEmpty()) {
      print("Antrian masih kosong.");
      return;
    }
    print("Isi antrian saat ini:");
    int idx = _front;
    for (int i = 0; i < _size; i++) {
      print("- Nomor antrian: ${_queue[idx]}");
      idx = (idx + 1) % _maxQueue;
    }
  }
}

void main() {
  AntrianNomor antrian = AntrianNomor();
  stdout.write("\nMasukkan kapasitas maksimal antrian: ");
  int kapasitas = int.parse(stdin.readLineSync()!);
  antrian.BuatAntrian(kapasitas);

  while (true) {
    print("\nMenu Antrian:");
    print("1. Tambah Antrian");
    print("2. Keluarkan Antrian");
    print("3. Tampilkan Antrian");
    print("4. Keluar Program");
    stdout.write("Pilih menu (1-4): ");
    int pilihan = int.parse(stdin.readLineSync()!);

    if (pilihan == 1) {
      stdout.write("\nMasukkan nomor antrian yang ingin ditambahkan: ");
      int nomor = int.parse(stdin.readLineSync()!);
      antrian.TambahAntrian(nomor);
    } else if (pilihan == 2) {
      antrian.KeluarkanAntrian();
    } else if (pilihan == 3) {
      antrian.TampilkanAntrian();
    } else if (pilihan == 4) {
      print("Program selesai.");
      break;
    } else {
      print("Pilihan tidak valid!");
    }
  }
}
