<?php

namespace App\Http\Controllers\Admin;

use App\User;
use App\Http\Controllers\Controller;

class UsersController extends Controller
{
    public function index() {
        $users = User::orderByDesc('updated_at')->get();
        return view('admin.users.index', compact('users'));
    }

    public function ban($id)
    {
        return $this->_setBanned($id, true);
    }

    public function unban($id)
    {
        return $this->_setBanned($id, false);
    }

    protected function _setBanned($id, $banned)
    {
        $user = User::where('id', $id)->firstOrFail();
        $user->is_banned = $banned;
        $user->save();
        return redirect('admin/users');
    }
}
