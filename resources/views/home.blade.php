@extends('layouts.app')

@section('scripts')
    <script language="javascript">
        var pusher = new Pusher('298a256e3674cbad81e2');
        var gamePlayChannel = pusher.subscribe('new-game-channel');
        gamePlayChannel.bind('App\\Events\\NewGame', function (data) {
            if (data.destinationUserId == '{{$user->id}}') {
                $('#from').html(data.from);
                $('#accept').attr('href', '/accept/' + data.gameId);
                $('#deny').attr('href', '/deny/' + data.gameId);
                $('#accept-game-modal').modal('show');
            }
        });
        $('#country').on('change', function(){
            $('#search-form').submit();
        });
    </script>
@endsection

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="profile-picture">
                            <img class="img-responsive img-circle"
                                 src="https://www.gravatar.com/avatar/{{ md5($user->email) }}?d=retro&s=200">
                        </div>
                        <div class="profile-info">
                            <div class="profile-username">{{$user->name}}</div>
                            <div class="profile-score">Score: {{$user->score}}</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="pull-right">
                            <form id="search-form" class="form-inline" method="get">
                                <div class="form-group" style="margin-right: 10px;">
                                    <label>Country: </label>
                                    <select id="country" class="form-control" name="country">
                                        <option value="all">All</option>
                                        @foreach($countries as $code => $country_)
                                            <option {{ $country ==  $code ? 'selected' : ''}} value="{{$code}}">{{$country_}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Search: </label>
                                    <div class="input-group">
                                        <input type="text" name="search" class="form-control"
                                               value="{{request('search')}}">
                                        <span class="input-group-btn">
                                        <button type="submit" class="btn btn-primary"><i
                                                    class="fa fa-search"></i></button>
                                    </span>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="clearfix"></div>
                        <div class="list-group">
                            @foreach($users as $_user)
                                <a class="list-group-item clearfix" class="list-group-item">
                                    <img class="img-responsive img-circle"
                                         src="https://www.gravatar.com/avatar/{{ md5($_user->email) }}?d=retro&">
                                    <span class="user-info">
                                {{$_user->name}}<br>
                                <small>Score: {{$_user->score}}</small>
                            </span>
                                    <form action="/new-game" method="post">
                                        {{ csrf_field() }}
                                        <input type="hidden" name="user_id" value="{{$_user->id}}">
                                        <button type="submit" class="btn btn-primary pull-right" {{ \App\User::hasPendingChallenge($user->id, $_user->id)  ? 'disabled' : '' }}>Send challenge</button>
                                    </form>
                                </a>
                            @endforeach
                        </div>

                        {{ $users->links() }}

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="accept-game-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">New Game</h4>
                </div>
                <div class="modal-body">
                    <p><span id="from"></span> invited you to a game</p>
                </div>
                <div class="modal-footer">
                    <a id="deny" class="btn btn-danger">Deny</a>
                    <a id="accept" class="btn btn-success">Accept</a>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

@endsection
