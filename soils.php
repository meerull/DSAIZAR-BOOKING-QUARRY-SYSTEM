
    <?php include('partials-front/menu.php'); ?>

    <!-- soil sEARCH Section Starts Here -->
    <section class="soil-search text-center">
        <div class="container">
            
            <form action="<?php echo SITEURL; ?>soil-search.php" method="POST">
                <input type="search" name="search" placeholder="Search for soil.." required>
                <input type="submit" name="submit" value="Search" class="btn btn-primary">
            </form>

        </div>
    </section>
    <!-- soil sEARCH Section Ends Here -->



    <!-- soil MEnu Section Starts Here -->
    <section class="soil-menu">
        <div class="container">
            <h2 class="text-center">Soil Menu</h2>

            <?php 
                //Display soils that are Active
                $sql = "SELECT * FROM tbl_soil WHERE active='Yes'";

                //Execute the Query
                $res=mysqli_query($conn, $sql);

                //Count Rows
                $count = mysqli_num_rows($res);

                //CHeck whether the soils are availalable or not
                if($count>0)
                {
                    //soils Available
                    while($row=mysqli_fetch_assoc($res))
                    {
                        //Get the Values
                        $id = $row['id'];
                        $title = $row['title'];
                        $description = $row['description'];
                        $price = $row['price'];
                        $image_name = $row['image_name'];
                        ?>
                        
                        <div class="soil-menu-box">
                            <div class="soil-menu-img">
                                <?php 
                                    //CHeck whether image available or not
                                    if($image_name=="")
                                    {
                                        //Image not Available
                                        echo "<div class='error'>Image not Available.</div>";
                                    }
                                    else
                                    {
                                        //Image Available
                                        ?>
                                        <img src="<?php echo SITEURL; ?>images/soil/<?php echo $image_name; ?>" alt="Clay soil" class="img-responsive img-curve">
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
                    //soil not Available
                    echo "<div class='error'>soil not found.</div>";
                }
            ?>

            

            

            <div class="clearfix"></div>

            

        </div>

    </section>
    <!-- soil Menu Section Ends Here -->

    <?php include('partials-front/footer.php'); ?>