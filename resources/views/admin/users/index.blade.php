@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                List of users
            </div>
            <div class="panel-body">
                <table class="table table-striped">
                    <thead>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Score</th>
                    <th>Action</th>
                    </thead>
                    <tbody>
                    @foreach($users as $_user)
                        <tr>
                            <td>{{ $_user->name }}</td>
                            <td>{{ $_user->email }}</td>
                            <td>{{ $_user->score }}</td>
                            <td>
                                @if($_user->is_banned == false)
                                    <a href="{{ action('Admin\\UsersController@ban', ['id' => $_user->id])  }}">Ban</a>
                                @else
                                    <a href="{{ action('Admin\\UsersController@unban', ['id' => $_user->id])  }}">Unban</a>
                                @endif
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection