

<?php $__env->startSection('content'); ?>
    <div class="container">
        <div class="alert alert-danger">
            You are banned !
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>