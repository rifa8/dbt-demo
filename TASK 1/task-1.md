### Task 1

#### 1. Jelaskan apa itu DBT!
DBT atau  Data Build Tool, adalah software open-source yang digunakan untuk transformasi data. Pengguna DBT dapat memanfaatkannya untuk mengelola dan mendefinisikan transformasi data dengan cara yang lebih modern dan terstruktur dibandingkan dengan pendekatan tradisional ETL (Extract, Transform, Load).

#### 2. Apa keuntungan menggunakan DBT?
Keuntungan menggunakan DBT:
- Better Data Quality: DBT membantu meningkatkan kualitas data melalui pengujian dan validasi yang terintegrasi.
- Easy Maintenance: Dengan adanya definisi model data terstruktur, pemeliharaan dan pengembangan menjadi lebih mudah dan dapat dilakukan secara otomatis.
- Data Consistency: DBT memastikan data yang dihasilkan memiliki konsistensi, sehingga setiap orang di dalam team atau organisasi menggunakan data yang seragam.
- Reduced Technical Burden: DBT memungkinkan analis data bekerja lebih produktif tanpa harus mengkhawatirkan proses teknis ETL.
- Version Control: DBT terintegrasi dengan sistem version control seperti Git, memungkinkan tim untuk mengelola perubahan pada definisi transformasi data dengan aman.
- Dokumentasi Otomatis: DBT menghasilkan dokumentasi otomatis untuk model-model data, membantu dalam pemahaman struktur dan konten data tanpa perlu dokumentasi manual yang terpisah.

#### 3. Jelaskan dependency tree dan versioning pada DBT!
Dependency Tree

Dependency Tree adalah hubungan antara model-model data. Hubungan tersebut menggambarkan ketergantungan sebuah model terhadap model lainnya. Setiap project pada DBT memiliki dependency tree yang menggambarkan hubungan model-data. Hal ini memungkinkan dbt untuk mengelola urutan transformasi data dan memastikan model data diperbarui dengan benar.

Versioning

Versioning adalah salah satu basic concept dari DBT, dimana DBT dapat melakukan pengelolaan versi atau version control (seperti Git) dari suatu project yang dibuat dengan DBT. Sehingga kita dapat memanfaatkannya untuk melacak perubahan yang dibuat dan mengelola version yang kita butuhkan.
Dengan versioning, tim dapat bekerja secara aman dan dapat melihat perubahan yang telah terjadi pada model-model data. DBT juga memastikan bahwa versi yang digunakan dari model-model data sesuai dengan definisi transformasi yang sesuai. Ini membantu dalam menghindari konflik dan memastikan konsistensi dalam proses pengelolaan transformasi data.
