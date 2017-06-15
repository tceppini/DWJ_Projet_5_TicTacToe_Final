

<?php $__env->startSection('content'); ?>
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
                    <?php $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $_user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <tr>
                            <td><?php echo e($_user->name); ?></td>
                            <td><?php echo e($_user->email); ?></td>
                            <td><?php echo e($_user->score); ?></td>
                            <td>
                                <?php if($_user->is_banned == false): ?>
                                    <a href="<?php echo e(action('Admin\\UsersController@ban', ['id' => $_user->id])); ?>">Ban</a>
                                <?php else: ?>
                                    <a href="<?php echo e(action('Admin\\UsersController@unban', ['id' => $_user->id])); ?>">Unban</a>
                                <?php endif; ?>
                            </td>
                        </tr>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>