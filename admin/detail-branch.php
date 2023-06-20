<?php include 'head.php';
$emp = mysqli_query($con,"SELECT users.usersFirstName, users.usersLastName, users.email ,users.profile,users.usersID,  branch_staff.roles, branches.Branch_Name from branch_staff join users on  branch_staff.usersID = users.usersID join branches on branches.branchID = branch_staff.branchID where branches.branchID = $branchIDD")?>
<body>
    <div id="main-wrapper">
        <div class="nav-header">
            <a href="index.html" class="brand-logo">
                <img class="logo-abbr" src="../images/site/fayeed.png" alt="">
                <img class="logo-compact" src="../images/site/fayeed.png" alt="">
                <h4 class="brand-title"><?php echo $settings['System_Name']?></h4>
                <link href="../vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
            </a>
 

            <div class="nav-control">
                <div class="hamburger">
                    <span class="line"></span><span class="line"></span><span class="line"></span>
                </div>
            </div>
        </div>
        <?php include 'header.php'; include 'sidebar.php'?>
        
        <div class="content-body">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-12 col-xxl-12">
                        
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Branch Details</h4> <a href="branches.php" class="btn btn-primary">Back</a>
                            </div>
                            <div class="card-body"><?php
                    if(count($errors) == 1){
                        ?>
                        <div class="alert alert-danger text-center">
                            <?php
                            foreach($errors as $showerror){
                                echo $showerror;
                            }
                            ?>
                        </div>
                        <?php
                    }elseif(count($errors) > 1){
                        ?>
                        <div class="alert alert-danger">
                            <?php
                            foreach($errors as $showerror){
                                ?>
                                <li><?php echo $showerror; ?></li>
                                <?php
                            }
                            ?>
                        </div>
                        <?php
                    }
                    ?>
                                <div class="basic-form"> 
                                <form action="" method="post" enctype="multipart/form-data">

                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label>Branch Name</label>
                                                <input type="text"  class="form-control" value="<?php echo $branch['Branch_Name']?>" disabled>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label>Branch Address</label>
                                                <input type="text" class="form-control" value="<?php echo $branch['Branch_Address']?>" disabled>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label>City</label>
                                                <input type="text" class="form-control" value="<?php echo $branch['city']?>" disabled>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label>Contact Number</label>
                                                <input type="number" class="form-control" value="<?php echo $branch['Branch_Contact_number']?>" disabled>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label>Email</label>
                                                <input type="email"class="form-control" value="<?php echo $branch['branch_email']?>" disabled>
                                            </div>
                                        </div>
                                        
                                </div><hr>
                                <h4 class="card-title">List of Working Personel </h4><br>
                                <div class="card-body">
                                <div class="table-responsive">
                                    <table id="example" class="display" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Address</th>
                                                <th>Email</th>
                                                <th>Contact Number</th>
                                                <th>Roles</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <?php while($administratorss = mysqli_fetch_array($emp)){ ?>
                                                <tr>
                                                <td><?php if($administratorss['usersFirstName']==""){ echo ".........";}else{echo $administratorss['usersFirstName'];}?></td>
                                                <td><?php if($administratorss['usersLastName']==""){ echo ".........";}else{echo $administratorss['usersLastName'];}?></td>
                                                <td><?php if($administratorss['Address']==""){ echo ".........";}else{echo $administratorss['Address'];}?></td>
                                                <td><?php if($administratorss['email']==""){ echo ".........";}else{echo $administratorss['email'];}?></td>
                                                <td><?php if($administratorss['CellNumber']==""){ echo ".........";}else{echo $administratorss['CellNumber'];}?></td>
                                                <td><?php if($administratorss['roles']==1){ echo " Branch Manager ";}elseif($administratorss['roles']==2) { echo " Inventory Admin ";}else{ echo "Branch Staff";}?></td>
                                                <td><a class="btn btn-primary" href="check-profile.php?profile=<?php echo $administratorss['usersID']?>">See Profile</a></td>
                                            </tr>
                                            <?php }?>
                                            
                                            
                                        </tbody>
                                        
                                    </table>
                                </div>
                            </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        
    </div>
    <script type="text/javascript">
      $(".chosen").chosen();
</script>
    <script src="../vendor/global/global.min.js"></script>
    <script src="../js/quixnav-init.js"></script>
    <script src="../js/custom.min.js"></script>
    <script src="../vendor/raphael/raphael.min.js"></script>
    <script src="../vendor/morris/morris.min.js"></script>
    <script src="../vendor/circle-progress/circle-progress.min.js"></script>
    <script src="../vendor/chart.js/Chart.bundle.min.js"></script>
    <script src="../vendor/gaugeJS/dist/gauge.min.js"></script>
    <script src="../vendor/flot/jquery.flot.js"></script>
    <script src="../vendor/flot/jquery.flot.resize.js"></script>
    <script src="../vendor/owl-carousel/js/owl.carousel.min.js"></script>
    <script src="../vendor/jqvmap/js/jquery.vmap.min.js"></script>
    <script src="../vendor/jqvmap/js/jquery.vmap.usa.js"></script>
    <script src="../vendor/jquery.counterup/jquery.counterup.min.js"></script>
    <script src="../js/dashboard/dashboard-1.js"></script>
    <script src="../vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="../js/plugins-init/datatables.init.js"></script>
</body>
</html>