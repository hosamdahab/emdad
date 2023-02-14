<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class CityTable extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $json = Storage::disk('local')->get('/json/cities.json');
        $cities = json_decode($json,true);

        foreach($cities as $val) {

            DB::table('cities')->insert([

                'state_id'  => $val['state_id'],
                'name'      => $val['name'],
                'cost'      => $val['cost']

            ]);

        }

    }
}
