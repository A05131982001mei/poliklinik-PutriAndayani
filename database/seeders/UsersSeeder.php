<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UsersSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            [
                'nama_pengguna' => 'Putriadmin',
                'username' => 'putriamalia',
                'password' => bcrypt('admin'),
                'no_hp' => '08975018627',
                'no_ktp' => '987654321',
                'alamat' => 'Jl. Pancasakti, Semarang No. 81',
                'role' => 'admin',
            ],
            [
                'nama_pengguna' => 'Putridokter',
                'username' => 'putri',
                'password' => bcrypt('dokter'),
                'no_hp' => '08975018622',
                'no_ktp' => '567891234',
                'alamat' => 'Jl. Melati, Semarang No. 18',
                'role' => 'dokter',
            ]
        ]);
    }
}
