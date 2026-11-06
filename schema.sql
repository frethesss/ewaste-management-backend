-- 1. Tabel Warga (Users)
CREATE TABLE residents (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20)
);

-- 2. Tabel Warga Profiles (One-to-One dengan Residents)
CREATE TABLE resident_profiles (
    id SERIAL PRIMARY KEY,
    resident_id INT UNIQUE REFERENCES residents(id) ON DELETE CASCADE,
    rt_rw VARCHAR(10) NOT NULL,
    home_address TEXT
);

-- 3. Tabel E-Waste Categories (Kategori Sampah Elektronik)
CREATE TABLE ewaste_categories (
    id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
    hazard_level VARCHAR(20) NOT NULL -- Rendah, Sedang, Tinggi
);

-- 4. Tabel Dropoff Logs (One-to-Many dengan Residents)
CREATE TABLE dropoff_logs (
    id SERIAL PRIMARY KEY,
    resident_id INT REFERENCES residents(id) ON DELETE CASCADE,
    dropoff_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'received'
);

-- 5. Tabel Log Details (Many-to-Many Junction Table)
CREATE TABLE log_details (
    id SERIAL PRIMARY KEY,
    dropoff_id INT REFERENCES dropoff_logs(id) ON DELETE CASCADE,
    category_id INT REFERENCES ewaste_categories(id) ON DELETE CASCADE,
    item_quantity INT NOT NULL,
    notes TEXT
);

-- 6. Tabel Collection Hubs (Lokasi Pos Penampungan)
CREATE TABLE collection_hubs (
    id SERIAL PRIMARY KEY,
    hub_name VARCHAR(100) NOT NULL,
    location_detail TEXT NOT NULL
);

-- 7. Tabel Hub Officers (One-to-Many dengan Collection Hubs)
CREATE TABLE hub_officers (
    id SERIAL PRIMARY KEY,
    hub_id INT REFERENCES collection_hubs(id) ON DELETE CASCADE,
    officer_name VARCHAR(100) NOT NULL,
    shift_hours VARCHAR(50)
);