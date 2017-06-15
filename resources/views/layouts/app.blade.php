<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'TicTacToe') }}</title>

    <!-- Styles -->
    <link href="/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/app.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
    @yield('styles')
    @if(Auth::user())
        <script>
            window.userid = {{\Illuminate\Support\Facades\Auth::user()->id}};
            window.username = "{{\Illuminate\Support\Facades\Auth::user()->name}}";
        </script>
    @endif
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- Scripts -->
    <script>
        window.Laravel = {!! json_encode([
            'csrfToken' => csrf_token(),
        ]) !!};
    </script>
</head>
<body>
<div id="wrapper">
    <nav class="navbar navbar-default navbar-static-top">
        <div class="container">
            <div class="navbar-header">

                <!-- Collapsed Hamburger -->
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#app-navbar-collapse">
                    <span class="sr-only">Toggle Navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <!-- Branding Image -->
                <a class="navbar-brand" href="{{ url('/') }}">
                    {{ config('app.name', 'TicTacToe') }}
                </a>
            </div>

            <div class="collapse navbar-collapse" id="app-navbar-collapse">
                <!-- Left Side Of Navbar -->
                <ul class="nav navbar-nav">
                    &nbsp;
                </ul>

                <!-- Right Side Of Navbar -->
                <ul class="nav navbar-nav navbar-right">
                    <!-- Authentication Links -->
                    @if (Auth::guest())
                        <li><a href="{{ route('login') }}">Login</a></li>
                        <li><a href="{{ route('register') }}">Register</a></li>
                    @else
                        @if($user->is_admin)
                            <li><a href="/admin">Admin panel</a></li>
                        @endif
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-expanded="false">
                                Pending challenge
                                @if($challenges->count() > 0)
                                    <span class="badge" style="background: #1e90ff;">{{ $challenges->count() }}</span>
                                @endif
                                <span class="caret"></span>
                            </a>

                            <ul class="dropdown-menu" role="menu" style="padding: 15px;width: 400px;">
                                @forelse($challenges as $challenge)
                                    <li>
                                        <strong>{{ $challenge->first_player->name  }} challenged you !</strong>
                                        <div class="clearfix"></div>
                                        <br>
                                        <a href="{{ action('GameController@accept', $challenge->id) }}"
                                           style="color:#008000;">Accepter</a>
                                        <a href="{{ action('GameController@deny', $challenge->id) }}"
                                           style="color:#ff0000;">Refuser</a>
                                        <hr>
                                    </li>
                                @empty
                                    <p>No challenge waiting</p>
                                @endforelse
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-expanded="false">
                                Games in progress
                                @if($turns_count > 0)
                                    <span class="badge" style="background: #008000">{{ $turns_count }}</span>
                                @endif
                                <span class="caret"></span>
                            </a>

                            <ul class="dropdown-menu" role="menu" style="padding: 15px;width: 400px;">
                                @forelse($games_in_progress as $game)
                                    <li>
                                        <a href="{{ action('GameController@board', $game->id) }}">
                                            <strong>Partie
                                                avec {{ ($game->first_player_id != $user->id) ? $game->first_player->name : $game->second_player->name  }}
                                                :</strong>
                                            <span>
                                            @if(isset($game->turns[0]) && $game->turns[0]->player_id == $user->id)
                                                    it's your turn !
                                                @else
                                                    It's not your turn!
                                                @endif
                                                (Click me)
                                        </span>
                                        </a>
                                        <hr>
                                    </li>
                                @empty
                                    <p>No games in progress</p>
                                @endforelse
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-expanded="false">
                                {{ Auth::user()->name }} <span class="caret"></span>
                            </a>

                            <ul class="dropdown-menu" role="menu">
                                <li>
                                    <a href="{{ route('logout') }}"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                        Logout
                                    </a>

                                    <form id="logout-form" action="{{ route('logout') }}" method="POST"
                                          style="display: none;">
                                        {{ csrf_field() }}
                                    </form>
                                </li>
                            </ul>
                        </li>
                    @endif
                </ul>
            </div>
        </div>
    </nav>

    @yield('content')
</div>

<script src="//js.pusher.com/4.0/pusher.min.js"></script>
<script src="{{ url('/js/app.js') }}"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
@yield('scripts')
</body>
</html>
