<?php

namespace App\Http\Controllers\Admin;

use App\Report;
use App\User;
use App\Http\Controllers\Controller;

class UsersController extends Controller
{
    public function index() {
        $users = User::orderByDesc('updated_at')->get();
        $reports = Report::orderByDesc('created_at')->get();
        return view('admin.users.index', compact('users', 'reports'));
    }

    public function ban($id)
    {
        Report::where('user_id' , '=', $id)->delete();
        return $this->_setBanned($id, true);
    }

    public function ignoreReport($id)
    {
        Report::where('id' , '=', $id)->delete();
        return redirect('admin/users');
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
