<!DOCTYPE html>
<html class="bg-black">
    <head>
        <meta charset="UTF-8">
        <title><?=$cms['page_title'];?></title>
        <meta name="keywords" content="<?=$cms['meta_description'];?>"/>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <link href="<?php echo BASE_FOLDER . 'application/themes/default/bootstrap.css'; ?>" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="<?php echo BASE_FOLDER . 'application/themes/default/login.css'; ?>" rel="stylesheet" type="text/css" />

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
     <body class="bg-black">

        <div class="form-box" id="login-box">
            <div class="header">Universidad de Manila-Graduate School</div>
             
        
                <div class="body bg-gray">
                <?php if($this->session->flashdata('error_login')) { ?>
        <div class="alert alert-error login-error">
            <?php echo $this->session->flashdata('error_message'); ?>
        </div>
        <?php } ?>
         <form id="login" name="login" enctype="application/x-www-form-urlencoded" method="post" action="<?php echo url('login/check_login'); ?>">
        <input type="hidden" id="next" name="next" value="<?php echo $next; ?>" />
             
                    <div class="form-group">
                        <input type="text" name="username" class="form-control" placeholder="User Name"/>
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" class="form-control" placeholder="Password"/>
                    </div>          
                    <div class="form-group">
                   
                    </div>
                </div>
                <div class="footer" >                                                             
                    <button type="submit" class="btn bg-olive btn-block">Sign me in</button>  
                    
                    <p><a href="#">I forgot my password</a></p>
                    
                    <a href="register.html" class="text-center" style="display:none;">Register a new membership</a>
                </div>
                </form>


            <div class="margin text-center" style="display:none;">
                <span>Sign in using social networks</span>
                <br/>
                <button class="btn bg-light-blue btn-circle"><i class="fa fa-facebook"></i></button>
                <button class="btn bg-aqua btn-circle"><i class="fa fa-twitter"></i></button>
                <button class="btn bg-red btn-circle"><i class="fa fa-google-plus"></i></button>

            </div>
        </div>
    <script src="<?php echo BASE_FOLDER . 'application/scripts/jquery.js'; ?>"></script>
        <script src="<?php echo BASE_FOLDER . 'application/scripts/bootstrap.js'; ?>" type="text/javascript"></script>

    </body>
</html>