<?php $__env->startSection('styles'); ?>
    <style type="text/css">
        .profile-picture img {
            width: 10%;
            min-width: 64px;
        }
    </style>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('scripts'); ?>
    <script language="JavaScript">
        function checkResult() {
            var win = false;
            // Top Row
            if ($('#block-1.player-<?php echo e($playerType); ?>:checked').length && $('#block-2.player-<?php echo e($playerType); ?>:checked').length && $('#block-3.player-<?php echo e($playerType); ?>:checked').length) {
                win = true;
            }
            // Middle Row
            else if ($('#block-4.player-<?php echo e($playerType); ?>:checked').length && $('#block-5.player-<?php echo e($playerType); ?>:checked').length && $('#block-6.player-<?php echo e($playerType); ?>:checked').length) {
                win = true;
            }
            // Bottom Row
            else if ($('#block-7.player-<?php echo e($playerType); ?>:checked').length && $('#block-8.player-<?php echo e($playerType); ?>:checked').length && $('#block-9.player-<?php echo e($playerType); ?>:checked').length) {
                win = true;
            }
            // Left Col
            else if ($('#block-1.player-<?php echo e($playerType); ?>:checked').length && $('#block-4.player-<?php echo e($playerType); ?>:checked').length && $('#block-7.player-<?php echo e($playerType); ?>:checked').length) {
                win = true;
            }
            // Center Col
            else if ($('#block-2.player-<?php echo e($playerType); ?>:checked').length && $('#block-5.player-<?php echo e($playerType); ?>:checked').length && $('#block-8.player-<?php echo e($playerType); ?>:checked').length) {
                win = true;
            }
            // Right Col
            else if ($('#block-3.player-<?php echo e($playerType); ?>:checked').length && $('#block-6.player-<?php echo e($playerType); ?>:checked').length && $('#block-9.player-<?php echo e($playerType); ?>:checked').length) {
                win = true;
            }
            // Diagonal Left to Right
            else if ($('#block-1.player-<?php echo e($playerType); ?>:checked').length && $('#block-5.player-<?php echo e($playerType); ?>:checked').length && $('#block-9.player-<?php echo e($playerType); ?>:checked').length) {
                win = true;
            }
            // Diagonal Right to Left
            else if ($('#block-3.player-<?php echo e($playerType); ?>:checked').length && $('#block-5.player-<?php echo e($playerType); ?>:checked').length && $('#block-7.player-<?php echo e($playerType); ?>:checked').length) {
                win = true;
            }

        if (!win) {
            if ($('input[type=radio]:checked').length == 9) {
                return 'tie'
            }
        }
        else {
            return 'win'
        }

        return false;
        }

        $(document).ready(function () {
            $('input[type=radio]').on('click', function () {
                $('input[type=radio]').attr('disabled', true);
                var result = checkResult();
                if (!result) {
                    $('.profile-username').html('Waiting on player 2...');
                    $.ajax({
                        url: '/play/<?php echo e($nextTurn->game_id); ?>',
                        method: 'POST',
                        data: {
                            location: $(this).val(),
                            _token: $('input[name=_token]').val()
                        },
                        success: function (data) {
                            if (data.status == 'success') {
                                console.log('Play saved');
                            }
                            else {
                                alert(data.data);
                            }
                        }
                    });
                }
                else {
                    if (result == 'win') {
                        $('.profile-username').html('You win!');
                    }
                    else {
                        $('.profile-username').html('Its a tie!');
                    }
                    $('#exit-button').show();
                    $.ajax({
                        url: '/game-over/<?php echo e($nextTurn->game_id); ?>',
                        method: 'POST',
                        data: {
                            location: $(this).val(),
                            result: result,
                            _token: $('input[name=_token]').val()
                        },
                        success: function (data) {
                            if (data.status == 'success') {
                                console.log('Play saved');
                            }
                            else {
                                alert(data.data);
                            }
                        }
                    });
                }
            });
        });

        var pusher = new Pusher('298a256e3674cbad81e2');
        var gamePlayChannel = pusher.subscribe('game-channel-<?php echo e($id); ?>-<?php echo e($otherPlayerId); ?>');
        var gameOverChannel = pusher.subscribe('game-over-channel-<?php echo e($id); ?>-<?php echo e($otherPlayerId); ?>');
        gamePlayChannel.bind('App\\Events\\Play', function (data) {
            $('#block-' + data.location).removeClass('player-<?php echo e($playerType); ?>').addClass('player-' + data.type);
            $('#block-' + data.location).attr('checked', true);
            $('input[type=radio]').removeAttr('disabled');
            $('.profile-username').html('You are next!');

        });
        gameOverChannel.bind('App\\Events\\GameOver', function (data) {
            $('#block-' + data.location).removeClass('player-<?php echo e($playerType); ?>').addClass('player-' + data.type);
            $('#block-' + data.location).attr('checked', true);
            if (data.result == 'win') {
                $('.profile-username').html('You loose!');
            }
            else {
                $('.profile-username').html('Its a tie!');
            }
            $('#exit-button').show();
        });
    </script>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="profile-info">
                    <div class="profile-username"><?php echo e($user->id == $nextTurn->player_id ? "You are next!" : "Waiting on player 2..."); ?></div>
                </div>
                <div class="clearfix"></div>
                <?php echo e(csrf_field()); ?>

                <div class="tic-tac-toe">
                    <?php $__currentLoopData = $locations; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $location): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <input class="player-<?php echo e($location["checked"] ? $location["type"] : $playerType); ?> <?php echo e($location["class"]); ?>"
                               id="block-<?php echo e($index); ?>" value="<?php echo e($index); ?>"
                               type="radio" <?php echo e($location["checked"] ? "checked" : ""); ?> <?php echo e($user->id != $nextTurn->player_id ? "disabled" : ""); ?>/>
                        <label for="block-<?php echo e($index); ?>"></label>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>
                <div class="clearfix"></div>
                <br>
                <a id="exit-button" href="/home" class="btn btn-lg btn-primary" style="display: none">Exit Game</a>
            </div>
            <div class="col-md-6">
                <chat sendername="<?php echo e($user->name); ?>" name="<?php echo e($otherPlayer->name); ?>" :receiverid=<?php echo e($otherPlayerId); ?>></chat>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>