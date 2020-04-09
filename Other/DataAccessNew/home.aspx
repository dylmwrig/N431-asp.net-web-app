<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="home.aspx.cs" Inherits="home" %>
<%@ Register TagPrefix="general" TagName="Frame" Src="WebUserControl.ascx" %>
<%@ Register TagPrefix="general" TagName="Footer" Src="FooterUserControl.ascx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
<meta http-equiv="Content-Style-Type" content="text/css" />

<title>
Appassionata Music Store
</title>

<link rel="stylesheet" href="style.css" type="text/css" media="screen" />

</head>

<body>

<div id="container">

	<!-- This line tells where to insert the reusable general frame code -->
    <general:Frame ID="framework" runat="server" />

	<!-- Start of Main Content Area -->

	<div id="main_content">

		<!-- Start of New Item Description -->

		<div class="new_item">

			<div id="new_item_header">
			<h1>Holiday Price Cuts!</h1>
			<h2>30 - 50% Off</h2>
			 <h2><% //int a = 5/0;%></h2>
            <h2>Session start time is <% =Session["startTime"] %></h2>
			</div>

			<div id="new_item_image">
			<img src="images/drum.jpg" width="242" height="180" alt="New Item Name" />
			</div>

			<div id="new_item_text">
			<p>
Sed et turpis ac risus aliquet rhoncus. Nam cursus molestiet. Sed et turpis ac risus 

aliquet rhonmetus.Duis quis dui quis leo pulvinar luctus. Vivamus eu nibh. Nulla 

tincidunt mauris a dui. Morbi.

consectetuer volutpat odio. Sed pulvinar elit vitae diam.

Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nullam quis turpis eu libero 

varius vestibulum. In feugiat. Sed et turpis ac risus aliquet rhoncus. Nam cursus 

molestiet. Sed et turpis ac risus aliquet rhonmetus.</p> 
				
								
			
				
			</div>

			<div class="new_item_link">
			<a href="home.aspx">.....Read More</a>
			</div>

			<div class="clearthis">&nbsp;</div>
		</div>

		<!-- End of New Item Description -->


		<div class="h_divider">&nbsp;</div>


		<!-- Start of Sub Item Descriptions -->

		<div class="sub_items">


			<!-- Start Left Sub Item -->

			<div class="sub_left">

				<div class="sub_items_header">
				<h1>Accordion</h1>
				<h2>Item ID: 452910</h2>
				</div>

				<div class="sub_items_image">
				<img src="images/a.jpg"  alt="Sub Item Name" />
				</div>

				<div class="sub_items_text">
					<p>orem ipsum dolor sit amet, consectetuer adipiscing elit. Nullam quis turpis eu libero 

						varius vestibulum. In feugiat. Sed et turpis ac risus aliquet rhoncus. </p>


					<p>
					<strong>
					Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</strong>
					</p>
				</div>

				<div class="sub_items_cartinfo">
					<div class="price">
					<h2>$245.99</h2>
					</div>

					<div class="addtocart">
					<a href="home.aspx"><span>Add to Cart</span></a>
					</div>

					<div class="clearthis">&nbsp;</div>
				</div>

				<div class="clearthis">&nbsp;</div>

			</div>

			<!-- End of Left Sub Item -->



			<!-- Start Right Sub Item -->

			<div class="sub_right">

				<div class="sub_items_header">
				<h1>Trumpet</h1>
				<h2>Item ID: 577384</h2>
				</div>

				<div class="sub_items_image">
				<img src="images/trumpet.jpg" alt="Sub Item Name" />
				</div>

				<div class="sub_items_text">
<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>

<p>
<strong>
Sed et turpis ac risus aliquet rhoncus. Nam cursus 

molestiet.</strong>
</p>
				</div>

				<div class="sub_items_cartinfo">
					<div class="price">
					<h2>$45.99</h2>
					</div>

					<div class="addtocart">
					<a href="home.aspx"><span>Add to Cart</span></a>
					</div>

					<div class="clearthis">&nbsp;</div>
				</div>

				<div class="clearthis">&nbsp;</div>

			</div>

			<!-- End of Right Sub Item -->

			<div class="clearthis">&nbsp;</div>

		</div>

		<!-- End of Sub Item Descriptions -->


		<div class="h_divider">&nbsp;</div>
		
		
		<div class="new_item">
		<!--
			<div id="featuredProduct">
				<h1>Featured Products</h1><br />
				
			</div>
			-->
			<h1>Featured Products</h1>
			<br/>
			<table>
			<tr>
			<td><img src="images/harp.jpg" alt="f1.jpg" /></td>
			<td>Sed et turpis ac risus aliquet rhoncus. Nam cursus molestiet.Sed et turpis ac risus aliquet rhoncus. Nam cursus molestiet.
					Sed et turpis ac risus aliquet rhoncus. Nam cursus molestiet.
					Sed et turpis ac risus aliquet rhoncus. Nam cursus molestiet.
			</td>
			
			
			</tr>
			
			<tr>
			<td><img src="images/sax.jpg" alt="f1.jpg" /></td>
			<td>Sed et turpis ac risus aliquet rhoncus. Nam cursus molestiet.Sed et turpis ac risus aliquet rhoncus. Nam cursus molestiet.
					Sed et turpis ac risus aliquet rhoncus. Nam cursus molestiet.
					Sed et turpis ac risus aliquet rhoncus. Nam cursus molestiet.
			</td>
			
			
			</tr>
			<tr>
			<td><img src="images/fHorn.jpg" alt="f1.jpg" /></td>
			<td>Sed et turpis ac risus aliquet rhoncus. Nam cursus molestiet.Sed et turpis ac risus aliquet rhoncus. Nam cursus molestiet.
					Sed et turpis ac risus aliquet rhoncus. Nam cursus molestiet.
					Sed et turpis ac risus aliquet rhoncus. Nam cursus molestiet.
			</td>
			
			
			</tr>

			
			</table>
			
							
			</div>
			
			
			<div class="new_item_link">
			<a href="home.aspx">More</a>
			</div>

			<div class="clearthis">&nbsp;</div>
		</div>


	</div>

	<!-- End of Main Content Area -->
<!-- This line tells where to insert the reusable general frame code -->
    <general:Footer ID="footer" runat="server" />



</body>
</html>
