# E-Waste Management System Backend API ♻️

Backend REST API untuk **Sistem Manajemen Daur Ulang Sampah Elektronik (E-Waste) Desa**. Sistem ini dirancang untuk mencatat dan mengelola penerimaan limbah elektronik (seperti laptop bekas, HP rusak, baterai, kabel, dll.) dari warga secara terstruktur dan digital.

## 🚀 Tech Stack

- **Runtime Environment:** Node.js
- **Framework:** Express.js
- **Database:** PostgreSQL (`db_ewaste`)
- **Database Modeling:** dbdiagram.io

---

## 🗄️ Database Schema & Relasi

Database `db_ewaste` terdiri dari 7 tabel yang saling berelasi:
1. `residents` (Warga)
2. `dropoff_locations` (Pos Penampungan E-Waste)
3. `categories` (Kategori Sampah Elektronik)
4. `ewaste_items` (Item Sampah Elektronik)
5. `dropoff_logs` (Log Setoran E-Waste) — *Main API Entity*
6. `log_details` (Detail Item Setoran) — *Junction Table / Many-to-Many*
7. `processing_status_history` (Riwayat Processing Status)

---

## 📌 REST API Endpoints

Semua endpoint untuk manajemen log penyetoran e-waste menggunakan base URL: `/api/ewaste`

| Method | Endpoint | Deskripsi | Status Code |
| :--- | :--- | :--- | :--- |
| **POST** | `/api/ewaste` | Menambahkan log penyetoran e-waste baru | `201 Created` |
| **GET** | `/api/ewaste` | Mendapatkan seluruh daftar log e-waste | `200 OK` |
| **GET** | `/api/ewaste/:id` | Mendapatkan detail log e-waste berdasarkan ID | `200 OK` |
| **PUT** | `/api/ewaste/:id` | Memperbarui status/data log e-waste berdasarkan ID | `200 OK` |
| **DELETE** | `/api/ewaste/:id` | Menghapus log e-waste berdasarkan ID | `200 OK` |

---

## 🛠️ Cara Menjalankan Project Secara Lokal

1. **Clone Repositori:**
   ```bash
   git clone [https://github.com/frethesss/ewaste-management-backend.git](https://github.com/frethesss/ewaste-management-backend.git)
   cd ewaste-management-backend
