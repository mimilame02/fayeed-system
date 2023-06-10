<?php 
require_once "../controllerUserData.php";
$email = $_SESSION['email'];
$password = $_SESSION['password'];
if($email != false && $password != false){
    $sql = "SELECT * FROM users WHERE email = '$email'";
    $run_Sql = mysqli_query($con, $sql);
    if($run_Sql){
        $fetch_info = mysqli_fetch_assoc($run_Sql);
        $status = $fetch_info['status'];
        $code = $fetch_info['code'];
        $roles = $fetch_info['roles'];
        $id = $fetch_info['usersID'];
        if($status == "verified"){
            if($code != 0){
                header('Location: ../reset-code.php');
            }
        }else{
            header('Location: ../user-otp.php');
        }
        if($roles == 1 ){
            $title = "Administrator";
        }
        if($roles == 2){
            header('Location: ../inventory/home.php');
        }
        if($roles == 3){
            header('Location: ../user/home.php');
        }
    }
}else{
    header('Location: ../login-user.php');
}

//<queries> ----------------------------------------------------------------------------------------------------------
$pr = mysqli_query($con,"SELECT * FROM users WHERE usersID = $id");
$profile = mysqli_fetch_assoc($pr);
if($do != 1){
    if(empty($profile['usersFirstName']) || empty($profile['usersLastName']) || empty($profile['age']) || empty($profile['Address']) || empty($profile['username']) || empty($profile['CellNumber'])){
        echo "<script>alert('Please update your account credentials');window.location.href='profile.php'</script>";
        }
}
date_default_timezone_set('Asia/Manila');
$currentDate = date('Y-m-d');
$currentTime = date('H:i:s');
$dateString = $currentDate." ".$currentTime;
$timestamp = strtotime($dateString);
$formattedDate = date('l - F d Y, g:i A', $timestamp);

$adm = mysqli_query($con,"SELECT * FROM users WHERE roles = 1");


        // ->Profile.php ---------------------------------------------------------------------------------------------------
                if(empty($profile['usersFirstName'])){
                $fn = "invalid";
                }else{
                $fn = "valid";
                }
                if(empty($profile['usersLastName'])){
                    $ln = "invalid";
                }else{
                    $ln = "valid";
                }
                if(empty($profile['age'])){
                    $age = "invalid";
                }else{
                    $age = "valid";
                }
                if(empty($profile['Address'])){
                    $add = "invalid";
                }else{
                    $add = "valid";
                }
                if(empty($profile['username'])){
                    $usr = "invalid";
                }else{
                    $usr = "valid";
                }
                if(empty($profile['CellNumber'])){
                    $cln = "invalid";
                }else{
                    $cln = "valid";
                }
                if(isset($_POST['profile'])){
                    if($_FILES['lis_img0']['name']!=''){
                        $lis_img0 = $_FILES['lis_img0']['name'];
                        }
                        else{
                          $lis_img0 = $profile['profile'];
                        }
                        $tempname = $_FILES['lis_img0']['tmp_name'];
                        $folder = "../images/users/".$lis_img0;
                        if(empty($_POST['cover'])){
                            $cover = $profile['cover_photo'];
                        }else{
                            $cover = $_POST['cover'];
                        }
                        
                        $first = $_POST['firstname'];
                        $last = $_POST['lastname'];
                        $age = $_POST['ages'];
                        $address = $_POST['address'];
                        $username = $_POST['username'];
                        $contact = $_POST['controlnumber'];
                            move_uploaded_file($tempname, $folder);
                            $update = mysqli_query($con,"UPDATE users SET profile='$lis_img0',cover_photo = '$cover', usersFirstName='$first', username='$username', usersLastName='$last', age='$age' , Address='$address', CellNumber='$contact' WHERE usersID =$id ");  
                            echo "<script>alert('Update Successfully');window.location.href='profile.php'</script>";
                }
        // Profile.php ---------------------------------------------------------------------------------------------------
        // Check-Profile.php ---------------------------------------------------------------------------------------------------
                        if(isset($_GET['profile'])){
                            $profileid = $_GET['profile'];
                            $s = mysqli_query($con,"SELECT * FROM users WHERE usersID = $profileid");
                            $ckprofile =mysqli_fetch_assoc($s);
                        }
        
        
        // Check-Profile.php ---------------------------------------------------------------------------------------------------
        // Branches.php ---------------------------------------------------------------------------------------------------
        if(isset($_POST['createbranch'])){
            if(empty($_POST['branch_name'])){
                $errors['branch_name'] = "Please Provide a Branch Name";
            }else{
                $branch_name = $_POST['branch_name'];
            }

            if(empty($_POST['branch_address'])){
                $errors['branch_address'] = "Please Provide branch address";
            }else{
                $branch_address = $_POST['branch_address'];
            }
            if(empty($_POST['branch_city'])){
                $errors['branch_city'] = "Please Provide branch city";
            }else{
                $branch_city = $_POST['branch_city'];
            }
            if(empty($_POST['branch_number'])){
                $errors['branch_number'] = "Please Provide branch number";
            }else{
                $branch_number = $_POST['branch_number'];
            }
            if(empty($_POST['branch_email'])){
                $errors['branch_email'] = "Please Provide branch email";
            }else{
                $branch_email = $_POST['branch_email'];
            }
            if($editbranch == ""){
                if(count($errors) === 0){
                    $insert = mysqli_query($con,"INSERT INTO branches (usersID, Branch_Name, Branch_Address, city, Branch_Contact_number, branch_email, DateCreated) VALUES($id,'$branch_name','$branch_address','$branch_city','$branch_number','$branch_email','$currentDate')");
                    if($insert){
                        echo "<script>alert('Branch $branch_name Successfully Created');window.location.href='branches.php'</script>";
                    }else {
                        $errors['cant'] = "Cant Save to Database $branch_name";
                    }
                }
            }
            
        }
        // Branches.php ---------------------------------------------------------------------------------------------------

        //</queries> ----------------------------------------------------------------------------------------------------------



?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Fayeed Electornics</title>
   
    <link rel="icon" type="image/png" sizes="16x16" href="../images/site/fayeed.png">
    <link rel="stylesheet" href="../vendor/owl-carousel/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../vendor/owl-carousel/css/owl.theme.default.min.css">
    <link href="../vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>
