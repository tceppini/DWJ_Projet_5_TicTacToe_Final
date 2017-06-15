<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">

    <title><?php echo e(config('app.name', 'TicTacToe')); ?></title>

    <!-- Styles -->
    <link href="/css/font-awesome.min.css" rel="stylesheet">
    <link href="/css/app.css" rel="stylesheet">
    <link href="/css/styles.css" rel="stylesheet">
    <?php echo $__env->yieldContent('styles'); ?>
    <?php if(Auth::user()): ?>
        <script>
            window.userid = <?php echo e(\Illuminate\Support\Facades\Auth::user()->id); ?>;
            window.username = "<?php echo e(\Illuminate\Support\Facades\Auth::user()->name); ?>";
        </script>
    <?php endif; ?>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- Scripts -->
    <script>
        window.Laravel = <?php echo json_encode([
            'csrfToken' => csrf_token(),
        ]); ?>;
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
                <a class="navbar-brand" href="<?php echo e(url('/')); ?>">
                    <?php echo e(config('app.name', 'TicTacToe')); ?>

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
                    <?php if(Auth::guest()): ?>
                        <li><a href="<?php echo e(route('login')); ?>">Login</a></li>
                        <li><a href="<?php echo e(route('register')); ?>">Register</a></li>
                    <?php else: ?>
                        <?php if($user->is_admin): ?>
                            <li><a href="/admin">Admin panel</a></li>
                        <?php endif; ?>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-expanded="false">
                                Pending challenge
                                <?php if($challenges->count() > 0): ?>
                                    <span class="badge" style="background: #1e90ff;"><?php echo e($challenges->count()); ?></span>
                                <?php endif; ?>
                                <span class="caret"></span>
                            </a>

                            <ul class="dropdown-menu" role="menu" style="padding: 15px;width: 400px;">
                                <?php $__empty_1 = true; $__currentLoopData = $challenges; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $challenge): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                    <li>
                                        <strong><?php echo e($challenge->first_player->name); ?> challenged you !</strong>
                                        <div class="clearfix"></div>
                                        <br>
                                        <a href="<?php echo e(action('GameController@accept', $challenge->id)); ?>"
                                           style="color:#008000;">Accepter</a>
                                        <a href="<?php echo e(action('GameController@deny', $challenge->id)); ?>"
                                           style="color:#ff0000;">Refuser</a>
                                        <hr>
                                    </li>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                    <p>No challenge waiting</p>
                                <?php endif; ?>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-expanded="false">
                                Games in progress
                                <?php if($turns_count > 0): ?>
                                    <span class="badge" style="background: #008000"><?php echo e($turns_count); ?></span>
                                <?php endif; ?>
                                <span class="caret"></span>
                            </a>

                            <ul class="dropdown-menu" role="menu" style="padding: 15px;width: 400px;">
                                <?php $__empty_1 = true; $__currentLoopData = $games_in_progress; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $game): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                    <li>
                                        <a href="<?php echo e(action('GameController@board', $game->id)); ?>">
                                            <strong>Partie
                                                avec <?php echo e(($game->first_player_id != $user->id) ? $game->first_player->name : $game->second_player->name); ?>

                                                :</strong>
                                            <span>
                                            <?php if(isset($game->turns[0]) && $game->turns[0]->player_id == $user->id): ?>
                                                    it's your turn !
                                                <?php else: ?>
                                                    It's not your turn!
                                                <?php endif; ?>
                                                (Click me)
                                        </span>
                                        </a>
                                        <hr>
                                    </li>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                    <p>No games in progress</p>
                                <?php endif; ?>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-expanded="false">
                                <?php echo e(Auth::user()->name); ?> <span class="caret"></span>
                            </a>

                            <ul class="dropdown-menu" role="menu">
                                <li>
                                    <a href="<?php echo e(route('logout')); ?>"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                        Logout
                                    </a>

                                    <form id="logout-form" action="<?php echo e(route('logout')); ?>" method="POST"
                                          style="display: none;">
                                        <?php echo e(csrf_field()); ?>

                                    </form>
                                </li>
                            </ul>
                        </li>
                    <?php endif; ?>
                </ul>
            </div>
        </div>
    </nav>

    <?php echo $__env->yieldContent('content'); ?>
</div>

<script src="//js.pusher.com/4.0/pusher.min.js"></script>
<script src="<?php echo e(url('/js/app.js')); ?>"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<?php echo $__env->yieldContent('scripts'); ?>
</body>
</html>
