@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                Reports
            </div>
            <div class="panel-body">
                <table class="table table-striped">
                    <thead>
                    <th>Username</th>
                    <th>Message</th>
                    <th>Date</th>
                    <th>Action</th>
                    </thead>
                    <tbody>
                    @foreach($reports as $report)
                        <tr>
                            <td>{{ $report->user->name }}</td>
                            <td>{{ $report->message->message }}</td>
                            <td>{{ $report->created_at }}</td>
                            <td>
                                <a href="{{ action('Admin\\UsersController@ban', ['id' => $report->user->id])  }}">Ban</a>
                                <a href="{{ action('Admin\\UsersController@ignoreReport', ['id' => $report->id])  }}">Ignorer</a>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
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