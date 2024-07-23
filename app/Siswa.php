<?php

namespace App;

use Auth;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Siswa extends Model
{
    use SoftDeletes;

    protected $fillable = ['no_induk', 'nis', 'nama_siswa', 'kelas_id', 'jk', 'telp', 'tmp_lahir', 'tgl_lahir', 'foto'];

    protected $table = 'siswa';

    public function kelas()
    {
        return $this->belongsTo(Kelas::class, 'kelas_id');
    }

    public function ulangan($mapelId)
    {
        $guru = Guru::where('id_card', Auth::user()->id_card)->first();
        return Ulangan::where('siswa_id', $this->id)->where('guru_id', $guru->id)->where('mapel_id', $mapelId)->first();
    }

    public function sikap($mapelId)
    {
        $guru = Guru::where('id_card', Auth::user()->id_card)->first();
        return Sikap::where('siswa_id', $this->id)->where('guru_id', $guru->id)->where('mapel_id', $mapelId)->first();
    }

    public function nilai($mapelId)
    {
        $guru = Guru::where('id_card', Auth::user()->id_card)->first();
        return Rapot::where('siswa_id', $this->id)->where('guru_id', $guru->id)->where('mapel_id', $mapelId)->first();
    }
}