<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\SellerWallet;

class WalletController extends Controller
{
   public function index() {


        $wallet = SellerWallet::latest()->paginate(10);
        return view('admin-views.seller.wallet', compact('wallet'));

   }
}
