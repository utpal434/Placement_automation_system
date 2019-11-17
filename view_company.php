<?php
include "includes/header.php";
$company_name = "Current_Placements";
if(isset($_GET['id'])) {
    $get_id = trim($_GET['id']);
    $sql = "SELECT * FROM company WHERE company.company_id='$get_id'";
    if($result = mysqli_query($con, $sql)){
        $row = mysqli_fetch_assoc($result);
        $company_name = $row['company_name'];
    }
}else{
    header("Location: home.php");
}

?>
    <div class="col-md-9 main">
        <!--banner-section-->
        <div class="banner-section">
            <h3 class="tittle"><?php echo $company_name; ?><i class="glyphicon glyphicon-"></i></h3>
            <!--/top-currents-->
            <div class="top-news">
                <div class="top-inner">
                    <?php
                    $sql = "SELECT * FROM company 
                            WHERE  
                            company.company_id='$get_id'";
                    $result1 = mysqli_query($con, $sql);
                    while($row1 = mysqli_fetch_assoc($result1)) {
                      //  $drive_id = trim($row1['drive_id']);
                      //  $drive_title = trim($row1['drive_title']);
                        $company_name = trim($row1['company_name']);
                        $company_branch = trim($row1['company_branch']);
                        $company_url = trim($row1['company_url']);
                       // $position = trim($row1['job_position']);
                       // $job_profile = trim($row1['job_profile']);
                       // $dod = trim($row1['dod']);
                        //$salary = trim($row1['salary']);
                        //$ssc_result = trim($row1['ssc_result']);
                        //$hsc_result = trim($row1['hsc_result']);
                        //$graduation_result = trim($row1['graduation_result']);
                        echo '
                            <div class="col-md-9" style="height:400px;padding-left:150px;">
                            <center>
                                    <h4>Company Detail:</h4>
                                    <div style="margin:100px;border:2px solid #3d4747;">
                                        <p><b>Company Name:</b> '.$company_name.'</p>
                                        &nbsp&nbsp&nbsp<p><b>Company Branch:</b> '.$company_branch.'</p>
                                        &nbsp&nbsp&nbsp<h4 style="color: #d58512"><u><i><a href="http://'.$company_url.'" target="_blank"> '.$company_url.'</a></u></i></h4>
                                            </div>
                                            </center>
                                            </div>
                ';
                    }
                     ?>
                    </div>
            </div>
                    <div class="clearfix"> </div>
                </div>
            <!--//top-current-->
        <!--//banner-section-->
        <div class="banner-right-text">
            <h3 class="tittle">Top-Compannies</h3>
            <!--/general-news-->
            <div class="general-news">
                <div class="general-inner">
                    <div class="edit-pics">
                        <?php
                            $sql = "SELECT *
                                    FROM company,drive 
                                    WHERE company.company_id=drive.company_id
                                    GROUP BY drive.company_id
                                    ORDER BY count(drive.company_id) desc
                                    LIMIT 5";
                            $result = mysqli_query($con, $sql);
                            while($row = mysqli_fetch_assoc($result)) { {
                                    $id = $row['company_id'];
                                    $name = $row['company_name'];
                                    $branch = $row['company_branch'];
                                    $url = $row['company_url'];

                                    echo '
                                    <div class="editor-pics">
                                        <div class="col-md-10 item-details" style="border: #14bcd5 solid 1px; padding: 10px;margin: 10px">
                                    <h4 class="inner two"><a href="view_company.php?id='.$id.'">'.$name.'</a>
                                    </h4>
                                    <h5>&nbspBranch: '.$branch.'&nbsp&nbsp&nbsp
                                    <a href="http://'.$url.'" target="_blank">'.$url.'</a>
                                    </h5>
                                </div>
                                </div>
                                    ';
                                }
                            }
                        ?>
                        </div>
                    </div>

                </div>
            </div>
        </div>
            <!--/companies-->
        </div>
        <div class="clearfix"> </div>
        <!--/footer-->
<?php
include "includes/footer.php";
?>

<!--

    company(company_id, name)
    drive(drive_id, company_id)

-->
