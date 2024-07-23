<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Guru extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'id_card', 'nip', 'nama_guru', 'mapel_id', 'kode', 'jk', 'telp', 'tmp_lahir', 'tgl_lahir', 'foto'
    ];

    protected $table = 'guru';

    // Relasi ke model Mapel
    public function mapel()
    {
        return $this->belongsTo(Mapel::class)->withDefault();
    }

    // Relasi ke model Kelas
    public function kelas()
    {
        return $this->hasMany(Kelas::class, 'guru_id');
    }

    // Metode untuk mendapatkan nilai DSK
    public function dsk()
    {
        return $this->hasOne(Nilai::class, 'guru_id')->withDefault();
    }
}