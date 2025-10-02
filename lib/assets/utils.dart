// On prends une array 1,1,0,0 => Doit devenir 2,0,0,0

class Utils {
  List<int> swipeLeft(List<int> row) {
    final List<int> res = row;
    int ptr1 = 0;
    while (ptr1 <= row.length - 1) {
      if (row[ptr1] != 0) {
        for (int i = ptr1 + 1; i < row.length; i++) {
          if (row[ptr1] == row[i]) {
            row[ptr1] *= 2;
            row[i] = 0;
            break;
          }
        }
      }
      ptr1 += 1;
    }
    return res;
  }

  List<int> clearFromZeroes(List<int> row) {
    final List<int> cleansed = row.where((n) => n != 0).toList();
    while (cleansed.length < 4) {
      cleansed.add(0);
    }
    return cleansed;
  }

  List<int> fullSwipeLeft(List<int> row) {
    return clearFromZeroes(swipeLeft(row));
  }

  List<List<int>> generateBoard() {
    return List.generate(4, (n) => List.generate(4, (n) => 0));
  }

  void transpose<T>(List<List<T>> matrix) {
    final n = matrix.length;
    for (int i = 0; i < n; i++) {
      for (int j = i + 1; j < n; j++) {
        final tmp = matrix[i][j];
        matrix[i][j] = matrix[j][i];
        matrix[j][i] = tmp;
      }
    }
  }
}
