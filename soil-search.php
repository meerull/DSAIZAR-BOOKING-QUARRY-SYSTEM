
    <?php include('partials-front/menu.php'); ?>

    <!-- soil sEARCH Section Starts Here -->
    <section class="soil-search text-center">
        <div class="container">
            <?php 

                //Get the Search Keyword
                // $search = $_POST['search'];
                $search = mysqli_real_escape_string($conn, $_POST['search']);
            
            ?>


            <h2>soils on Your Search <a href="#" class="text-white">"<?php echo $search; ?>"</a></h2>

        </div>
    </section>
    <!-- soil sEARCH Section Ends Here -->



    <!-- soil MEnu Section Starts Here -->
    <section class="soil-menu">
        <div class="container">
            <h2 class="text-center">Soil Menu</h2>

            <?php 

                //SQL Query to Get soils based on search keyword
                //$search = burger '; DROP database name;
                // "SELECT * FROM tbl_soil WHERE title LIKE '%burger'%' OR description LIKE '%burger%'";
                $sql = "SELECT * FROM tbl_soil WHERE title LIKE '%$search%' OR description LIKE '%$search%'";

                //Execute the Query
                $res = mysqli_query($conn, $sql);

                //Count Rows
                $count = mysqli_num_rows($res);

                //Check whether soil available of not
                if($count>0)
                {
                    //soil Available
                    while($row=mysqli_fetch_assoc($res))
                    {
                        //Get the details
                        $id = $row['id'];
                        $title = $row['title'];
                        $price = $row['price'];
                        $description = $row['description'];
                        $image_name = $row['image_name'];
                        ?>

                        <div class="soil-menu-box">
                            <div class="soil-menu-img">
                                <?php 
                                    // Check whether image name is available or not
                                    if($image_name=="")
                                    {
                                        //Image not Available
                                        echo "<div class='error'>Image not Available.</div>";
                                    }
                                    else
                                    {
                                        //Image Available
                                        ?>
                                        <img src="<?php echo SITEURL; ?>images/soil/<?php echo $image_name; ?>" alt="Chicke Hawain Pizza" class="img-responsive img-curve">
                                        <?php 

                                    }
                                ?>
                                
                            </div>

                            <div class="soil-menu-desc">
                                <h4><?php echo $title; ?></h4>
                                <p class="soil-price">RM<?php echo $price; ?></p>
                                <p class="soil-detail">
                                    <?php echo $description; ?>
                                </p>
                                <br>

                                <a href="<?php echo SITEURL; ?>order.php?soil_id=<?php echo $id; ?>" class="btn btn-primary">Order Now</a>
                            </div>
                        </div>

                        <?php
                    }
                }
                else
                {
                    //soil Not Available
                    echo "<div class='error'>soil not found.</div>";
                }
            
            ?>

            

            <div class="clearfix"></div>

            

        </div>

    </section>
    <!-- soil Menu Section Ends Here -->

    <?php include('partials-front/footer.php'); ?>