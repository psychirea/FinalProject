<?php
session_start();
include 'admin_middleware.php';
include 'includes/header.php';
include '../vscode/dbcon.php';


if(isset($_POST['ui-edit-btn'])){ //IF EDITING RECORD
    if (isset($_GET['uiidlabel'])) {
        $userinfo_id = $_GET['uiidlabel'];

        $getnamequery = "SELECT * FROM user_information WHERE userinfo_id = ?";
        $stmt = $con->prepare($getnamequery);
        $stmt->bind_param("s",$userinfo_id);
        if ($stmt->execute()) {
            $results = $stmt->get_result(); // Always return the result object        
            $ui_row = mysqli_fetch_assoc($results);            
            $user_full = $ui_row['firstname'] . ' '.$ui_row['lastname'];
            $user_su = $ui_row['student_number'];
            $user_sex = $ui_row['sex'];
            $user_bday = $ui_row['bday'];
            $user_contact = $ui_row['contact_number'];
            $user_email = $ui_row['email'];
            $acc_stat = $ui_row['account_status'];

        } else {
            echo "Error: " . $stmt->error;
        }
        $isEdit = True;

    }                                     
} else if (isset($_POST['ui-add-btn'])){ //IF NEW RECORD
    $userinfo_id = TableRowCount("user_information",$con)+1;
    $isEdit = False;

}

?>

<!-- CONTENTS -->
<div class="logo-bg-2"></div>
<div class="admin-container">

    <div class="row admin-mod-text">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h2>
                        User Account Records
                    </h2>
                </div>
                <div class="card-body">
                    <form action="admin_proc.php" method="POST" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-md-6">
                                <input type="hidden" name="userinfo_id" value="<?= $userinfo_id; ?>"> <!-- Pass the category ID -->
                                <?php
                                    // IF EDIT RECORD
                                    if($isEdit){?> 
                                        <label for="">
                                            First Name
                                        </label>
                                        <input type="text" name="ui_fname" placeholder="Enter First Name" class="form-control" required>  
                                        <label for="">
                                            Last Name
                                        </label>
                                        <input type="text" name="ui_lname" placeholder="Enter Last Name" class="form-control" required>  
                                        <label for="">
                                            Mobile Number
                                        </label>
                                        <input type="tel" name="ui_contact" placeholder="Enter your mobile number" class="form-control" required>                                          
                                        <label for="">
                                            Email
                                        </label>
                                        <input type="email" name="ui_email" placeholder="Enter Last Name" class="form-control" required>
                                        <label for="">
                                            Password
                                        </label>
                                        <input type="password" id="password" name="ui_password" placeholder="Enter your password" class="form-control" required>   

                                        <p id="passwarning"><b>Password does NOT match</b></p>
                                        
                                        <label for="confirm_password">
                                            Confirm Password
                                        </label>
                                        <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm your password" class="form-control" onkeyup="confirmPass();" required><br>
                                        <label for="type">
                                            Type : 
                                        </label>
                                        <select class="admin-sel" id="type" name="ui_type"  required> 
                                            <!-- WILL BA MODIFIED WITH PHP LATER -->
                                            <option value="student">Student</option>
                                            <option value="non_student">Non-Student</option>
                                        </select>
                                        <br>
                                        <br>
                                        <label for="sex">
                                            Sex : 
                                        </label>
                                        <select class="admin-sel" id="sex" name="ui_sex" required>
                                            <option value="male">Male</option>
                                            <option value="female">Female</option>
                                            <option value="other">Other</option>
                                        </select><br><br>
                                        
                                        <label for="dob">Date of Birth:</label>
                                        <input type="date"  name="ui_bday" placeholder="Enter your date of birth" class="form-control" required><br>
                                        
                                        <label for="student_number">Student Number:</label>
                                        <input type="text" id="student_number" name="student_number" placeholder="Enter your student number" class="form-control" required><br><br>                                    
                                        
                                        <?php

                                    // IF NEW RECORD                                
                                    }else {?>
                                        <label for="">
                                            First Name
                                        </label>
                                        <input type="text" name="ui_fname" placeholder="Enter First Name" class="form-control" required>  
                                        <label for="">
                                            Last Name
                                        </label>
                                        <input type="text" name="ui_lname" placeholder="Enter Last Name" class="form-control" required>  
                                        <label for="">
                                            Mobile Number
                                        </label>
                                        <input type="tel" name="ui_contact" placeholder="Enter your mobile number" class="form-control" required>                                          
                                        <label for="">
                                            Email
                                        </label>
                                        <input type="email" name="ui_email" placeholder="Enter Last Name" class="form-control" required>
                                        <label for="">
                                            Password
                                        </label>
                                        <input type="password" id="password" name="ui_password" placeholder="Enter your password" class="form-control" required>   

                                        <p id="passwarning"><b>Password does NOT match</b></p>
                                        
                                        <label for="confirm_password">
                                            Confirm Password
                                        </label>
                                        <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm your password" class="form-control" onkeyup="confirmPass();" required><br>
                                        <label for="type">
                                            Type : 
                                        </label>
                                        <select class="admin-sel" id="type" name="ui_type"  required> 
                                            <!-- WILL BA MODIFIED WITH PHP LATER -->
                                            <option value="student">Student</option>
                                            <option value="non_student">Non-Student</option>
                                        </select>
                                        <br>
                                        <br>
                                        <label for="sex">
                                            Sex : 
                                        </label>
                                        <select class="admin-sel" id="sex" name="ui_sex" required>
                                            <option value="male">Male</option>
                                            <option value="female">Female</option>
                                            <option value="other">Other</option>
                                        </select><br><br>
                                        
                                        <label for="dob">Date of Birth:</label>
                                        <input type="date"  name="ui_bday" placeholder="Enter your date of birth" class="form-control" required><br>
                                        
                                        <label for="student_number">Student Number:</label>
                                        <input type="text" id="student_number" name="student_number" placeholder="Enter your student number" class="form-control" required><br><br>                                    
                                        <?php
                                    }
                                ?>
                            </div>
                            <div class="col-md-6">
                                <label for="" class="userinfo-label">
                                    User ID : <?=$userinfo_id?>
                                </label>        
                                <br>
                                <br>
                                <label for="">
                                    Membership Status :
                                </label>
                                <br>
                                <select class="admin-sel" name="memstatus_id" id="">

                                <?php
                                    $catquery = "SELECT * FROM mem_status";
                                    $result = mysqli_query($con, $catquery);
                                    
                                    // Check if there are any categories
                                    if (mysqli_num_rows($result) > 0) {
                                        $count = 0;
                                        // Loop through the records and create options
                                        while ($row = mysqli_fetch_assoc($result)) {                                            
                                            echo '<option value="' . $row['memstatus_id'] . '">' . htmlspecialchars($row['memstatus']) . '</option>';
                                            $count++;                                            
                                        }
                                        if($count=== 0){
                                            echo '<option value="0">Status not set</option>';                                                
                                        }
                                    } else {
                                        // If no categories exist, show a message
                                        echo '<option value="0">Status not set</option>';
                                    }                                    
                                ?>

                                </select>
                                <br>
                                <br>
                                <label for="">
                                    Customer Type :
                                </label>
                                <br>
                                <select class="admin-sel" name="customertype_id" id="">

                                <?php
                                    $catquery = "SELECT * FROM customertype";
                                    $result = mysqli_query($con, $catquery);
                                    
                                    // Check if there are any categories
                                    if (mysqli_num_rows($result) > 0) {
                                        $count = 0;
                                        // Loop through the records and create options
                                        while ($row = mysqli_fetch_assoc($result)) {                                            
                                            echo '<option value="' . $row['customertype_id'] . '">' . htmlspecialchars($row['customer_type']) . '</option>';
                                            $count++;                                            
                                        }
                                        if($count=== 0){
                                            echo '<option value="0">Status not set</option>';                                                
                                        }
                                    } else {
                                        // If no categories exist, show a message
                                        echo '<option value="0">Status not set</option>';
                                    }                                    
                                ?>
                                </select>
                                <br>
                                <br>
                                <label for="">
                                    Account Verification Status :
                                </label>
                                <br>
                                <select class="admin-sel" name="custype_verif_id" id="">

                                <?php
                                    $catquery = "SELECT * FROM customertype_verification";
                                    $result = mysqli_query($con, $catquery);
                                    
                                    // Check if there are any categories
                                    if (mysqli_num_rows($result) > 0) {
                                        $count = 0;
                                        // Loop through the records and create options
                                        while ($row = mysqli_fetch_assoc($result)) {                                            
                                            echo '<option value="' . $row['custype_verif_id'] . '">' . htmlspecialchars($row['type_verification_stat']) . '</option>';
                                            $count++;                                            
                                        }
                                        if($count=== 0){
                                            echo '<option value="0">Status not set</option>';                                                
                                        }
                                    } else {
                                        // If no categories exist, show a message
                                        echo '<option value="0">Status not set</option>';
                                    }                                    
                                ?>

                                </select>

                                </select>

                                <?php 
                                
                                if($isEdit){?> 
                                    <br>
                                    <br>

                                    <label for="">
                                        Account Status
                                    </label>
                                    <br>
                                    <select class="admin-sel" name="recstat" id="recstat">
                                        <?php
                                        if($post_stat == "Active"){
                                            ?>
                                                <option value="Active">Active</option>
                                                <option value="Removed">Remove</option>
                                            <?php
                                        } else {
                                            ?>
                                                <option value="Removed">Remove</option>
                                                <option value="Active">Active</option>
                                            <?php
                                        }
                                        ?>                                    
                                    </select>
                                <?php
                                }
                                ?>                            

                            </div>
                            <div>
                                <br>
                                <button type="submit" value="<?= $isEdit ? '1' : '0'; ?>" name="post-confirm-btn">Confirm</button>
                                <button type="submit" name="ui-cancel-btn" formnovalidate>Cancel</button>
                            </div>
                        </div>
                    </form>                
                </div>
            </div>
        </div>
    </div>







<!-- END OF CONTENTS -->
</div>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="reg.js" type="text/javascript"></script>
</body>
<footer>
<?php
include 'includes/footer.php';

function TableRowCount(string $table, $con)
{
    $query = "SELECT COUNT(*) AS total FROM " . $table;
    $count = 0;

    if ($results = mysqli_query($con, $query)) {
        $row = mysqli_fetch_assoc($results);
        $count = $row['total'];
    }

    return $count;
}


?>