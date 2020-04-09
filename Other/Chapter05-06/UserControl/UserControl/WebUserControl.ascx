<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControl.ascx.cs" Inherits="WebUserControl" %>

	<div id="page_header">
        <div id="page_heading">
            <h1>
                <img alt="icon" src="images/company_logo.jpg" />&nbsp;APPASSIONATA</h1>
            <h2>
                Music Score</h2>
        </div>
        <div id="page_headerlinks">
            <ul>
                <li><a href="register.aspx">Register</a></li>
                <li><a href="login.aspx">Login</a></li>
                <li class="last"><a href="home.aspx">Shopping Cart</a></li>
            </ul>
            <br />
            <br />
            <form action="home.aspx">
            <div id="search" style="margin-left:10px;">
                Search:
                <input size="35" type="text" />
                <input type="button" value="GO" />
            </div>
            </form>
        </div>
</div>

	

	<div id="page_menu">
        <ul>
            <li><a href="home.aspx">Home</a></li>
            <li><a href="home.aspx">About</a></li>
            <li><a href="home.aspx">Products</a></li>
            <li><a href="home.aspx">Services</a></li>
            <li><a href="home.aspx">Sale</a></li>
            <li class="last"><a href="home.aspx">Contact</a></li>
        </ul>
</div>

	

	<div id="left_sidebar">


		

		<div id="newsletter">
            <h2>
                Phone:</h2>
            <div>
                (123) 456-7890
            </div>
        </div>



		

		<div class="categories">
            <div class="categories_header">
                <h2>
                    Music Instruments</h2>
            </div>
            <ul>
                <li><a href="home.aspx">Flute</a></li>
                <li><a href="home.aspx">Clarinet</a></li>
                <li><a href="home.aspx">Vilin</a></li>
                <li><a href="home.aspx">Piano</a></li>
                <li><a href="home.aspx">Guitar</a></li>
                <li><a href="home.aspx">Saxophone</a></li>
                <li><a href="home.aspx">Bass Drum</a></li>
                <li class="last"><a href="home.aspx">All</a></li>
            </ul>
            <div class="clearthis">
                &nbsp;</div>
        </div>
        <div class="categories">
            <div class="categories_header">
                <h2>
                    CDs</h2>
            </div>
            <ul>
                <li><a href="home.aspx">Solo</a></li>
                <li><a href="home.aspx">Orchestral</a></li>
                <li><a href="home.aspx">Chamber</a></li>
                <li class="last"><a href="home.aspx">All</a></li>
            </ul>
            <div class="clearthis">
                &nbsp;</div>
        </div>
        <div class="categories">
            <div class="categories_header">
                <h2>
                    Sheet Music</h2>
            </div>
            <ul>
                <li><a href="home.aspx">Beethoven</a></li>
                <li><a href="home.aspx">Bach</a></li>
                <li><a href="home.aspx">Mozart</a></li>
                <li class="last"><a href="home.aspx">All</a></li>
            </ul>
            <div class="clearthis">
                &nbsp;</div>
        </div>
		

		<div id="specialoffer">
            <div id="specialoffer_text">
                <h2>
                    <span>Get Special Offer <strong>Up to 25% off</strong></span></h2>
            </div>
            <div id="specialoffer_link">
                <a href="home.aspx">...Go</a>
            </div>
            <div class="clearthis">
                &nbsp;</div>
        </div>

		

	</div>

	