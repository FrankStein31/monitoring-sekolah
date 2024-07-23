<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ModifyRoleEnumInUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            // Ubah tipe kolom ke VARCHAR sementara
            DB::statement("ALTER TABLE users CHANGE role role VARCHAR(255)");

            // Perbarui nilai 'Operator' menjadi 'Kepala Sekolah'
            DB::statement("UPDATE users SET role = 'Kepala Sekolah' WHERE role = 'Operator'");

            // Ubah kembali tipe kolom ke ENUM dengan nilai yang baru
            DB::statement("ALTER TABLE users CHANGE role role ENUM('Admin', 'Guru', 'Siswa', 'Kepala Sekolah')");
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            // Ubah tipe kolom ke VARCHAR sementara
            DB::statement("ALTER TABLE users CHANGE role role VARCHAR(255)");

            // Perbarui nilai 'Kepala Sekolah' menjadi 'Operator'
            DB::statement("UPDATE users SET role = 'Operator' WHERE role = 'Kepala Sekolah'");

            // Ubah kembali tipe kolom ke ENUM dengan nilai yang asli
            DB::statement("ALTER TABLE users CHANGE role role ENUM('Admin', 'Guru', 'Siswa', 'Operator')");
        });
    }
}