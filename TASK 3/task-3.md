### TASK 3
#### Langkah-langkah demo setup dbt dari 0

#### 1) Membuat direktori baru 'dbt-demo'
```
mkdir dbt-demo
```
Pindah ke direktori dbt-demo
```
cd dbt-demo
```

![mkdir-dbt-demo](ss/mkdir-dbt-demo.png)

#### 2) Buat file [docker-compose.yml](../docker-compose.yml)
```
vi docker-compose.yml
```
Paste code dan save file

![new-file](ss/new-file.png)

![copy-paste](ss/copy-paste.png)

![docker-compose-yml](ss/docker-compose-yml.png)

#### 3) Jalankan docker compose
```
docker compose up -d
```

![docker-compose-up](ss/docker-compose-up.png)

Cek status container apakah sudah berjalan
```
docker ps
```

![docker-ps](ss/docker-ps.png)

#### 4) Buat venv
```
python -m venv .venv
```
Cek apakah .venv sudah ada
```
ls -a
```

![buat-venv](ss/buat-venv.png)

#### 5) Aktifkan venv
```
source .venv/bin/activate
```

![activate-venv](ss/activate-venv.png)

#### 6) Install DBT-postgres
```
pip install dbt-postgres
```

![install-dbt-postgres](ss/install-dbt-postgres.png)

![install-dbt-postgres-2](ss/install-dbt-postgres-2.png)

#### 7) Simpan list packages DBT
Tampilkan list DBT packages yang sudah terinstall
```
pip freeze | grep dbt
```

![grep-dbt](ss/grep-dbt.png)

Simpan ke dalam file baru ['requirements.txt'](../requirements.txt) agar jika ingin menginstall DBT dengan packages yang sama, bisa dengan ```pip install -r requirements.txt```
```
pip freeze | grep dbt >> requirements.txt
```

![requirements](ss/requirements.png)

#### 8) Buat DBT project
```
dbt init my_project
```
Pilih postgres (1) dan input data profile sesuai dengan yang sudah dibuat di [docker-compose.yml](../docker-compose.yml)

![dbt-init](ss/dbt-init.png)

Secara default, DBT akan membuat dbt profile di home direktori ```~/.dbt/profiles.yml```

![home-dir](ss/home-dir.png)

Untuk mengubah profile dan mengubah path direktori DBT profile, bisa dengan membuat direktori baru dbt-profiles dan mengubah variabel path direktori DBT profile
```
mkdir dbt-profiles
export DBT_PROFILES_DIR=$(pwd)/dbt-profiles
```

![mkdir-dbt-profiles](ss/mkdir-dbt-profiles.png)

Lalu bisa membuat profile baru atau menggunakan profile yang diinput sebelumnya. Untuk membuat profile baru:
```
touch dbt-profiles/profiles.yml
```
Setelah itu isi profiles.yml dengan format berikut sesuai kebutuhan.
```
my_project:
  outputs:

    dev:
      type: postgres
      threads: 1
      host: <your_host>
      port: <your_port>
      user: <your_username>
      pass: <your_password>
      dbname: <your_database>
      schema: <your_schema>

  target: dev
```
Untuk menggunakan profile yang diinput sebelumnya, bisa mengcopy file profiles.yml dari home direktori ke direktori dbt-profiles yang baru dibuat
```
cp ../.dbt/profiles.yml dbt-profiles
```

![profiles](ss/profiles.png)

#### 9) Connect ke DBeaver dan jalankan query pada [init.sql](../init.sql)

![init-sql](ss/init-sql.png)

Setelah di refresh

![tables-created](ss/tables-created.png)

#### 10) Setup DBT project configuration
Edit models pada ```my_project/dbt_project.yml``` agar menjadi seperti ini:
```
models:
  my_project:
    # Config indicated by + and applies to all files under models/example/
    store:
      +schema: public
      +database: store
    store_analytics:
      +materialized: table
      +schema: analytics
      +database: store
```

![dbt-project-config](ss/dbt-project-config.png)

#### 11) Setup source
Buat direktori store di dalam direktori models
```
mkdir my_project/models/store
```
Lalu buat file ['schema.yml'](../my_project/models/store/schema.yml) di dalam direktori store
```
vi my_project/models/store/schema.yml
```

![mkdir-store](ss/mkdir-store.png)

![source-schema-yml](ss/source-schema-yml.png)

#### 12) Buat model
Buat direktori baru 'store_analytics' di dalam direktori models
```
mkdir my_project/models/store_analytics
```

Kemudian definisikan tabel dengan membuat file ['daily_sales.sql'](../my_project/models/store_analytics/daily_sales.sql) di direktori store_analytics
```
vi my_project/models/store_analytics/daily_sales.sql
```
Dan buat file ['schema.yml'](../my_project/models/store_analytics/schema.yml) di direktori yang sama
```
vi my_project/models/store_analytics/schema.yml
```

![mkdir-store-analytics](ss/mkdir-store-analytics.png)

![daily-sales-sql](ss/daily-sales-sql.png)

![models-schema-yml](ss/models-schema-yml.png)

#### 13) Run dan test model yang sudah dibuat
```
cd my_project
dbt run
dbt test
```

![dbt-run](ss/dbt-run.png)

![dbt-test1](ss/dbt-test1.png)

![dbt-test2](ss/dbt-test2.png)


#### 14) Cek hasilnya di DBeaver
Refresh

![public-analytics](ss/public-analytics.png)

Jalankan query berikut untuk mengecek tabel daily_sales
```
select
    *
from store.public_analytics.daily_sales
```

![daily-sales](ss/daily-sales.png)
