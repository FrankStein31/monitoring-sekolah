<?php

namespace App\Http\Controllers;

use App\Pengumuman;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class PengumumanController extends Controller
{
    public function index()
    {
        $pengumuman = Pengumuman::where('opsi', 'pengumuman')->first();
        return view('admin.pengumuman', compact('pengumuman'));
    }

    public function show($id)
    {
    try {
        $pengumuman = Pengumuman::findOrFail($id);
        return view('admin.pengumuman', compact('pengumuman'));
        } catch (\Exception $e) {
        // Handle exception (misalnya tampilkan pesan error atau redirect ke halaman lain)
        return redirect()->back()->with('error', 'Pengumuman tidak ditemukan');
        }
    }

    public function simpan(Request $request)
    {
        $this->validate($request, [
            'isi' => 'required',
        ]);

        Pengumuman::updateOrCreate(
            [
                'id' => $request->id
            ],
            [
                'isi' => $request->isi,
            ]
        );

        return redirect()->back()->with('success', 'Pengumuman berhasil di perbarui!');
    }
}
