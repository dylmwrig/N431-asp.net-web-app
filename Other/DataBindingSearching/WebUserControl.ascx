<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControl.ascx.cs" Inherits="WebUserControl" %>

<form action="home.aspx">
	<div id="page_header">
        <div id="page_heading">
            <h1>
                <img alt="icon" src="images/company_logo.jpg" />
                <asp:Label ID="lblGreetings" Font-Bold="true" Font-Size="16px" Height="10px" runat="server" > </asp:Label>
                
               
            </h1>
            <h2>
                <asp:Label ID="lblStore" Font-Bold="true" Font-Size="12px" Height="10px" runat="server" > </asp:Label></h2>
        </div>
        <div id="page_headerlinks">
            <ul>
                <li id="register" runat="server"><a href="register.aspx">Register</a></li>
                <li id="login" runat="server"><a href="login.aspx">Login</a></li>
                 <li id="logout" runat="server"><a href="logout.aspx">Logout</a></li>
                <li id="main" runat="server"><a href="main.aspx">My Account</a></li>
                <li id="profile" runat="server" class="last"><a href="profile.aspx">Profile</a></li>
               <li class="last"><a href="search.aspx">Search</a></li>
            </ul>
            <br />
            <br />
            
            <div id="search" style="margin-left:10px;">
                Search:
                <input size="35" type="text" />
                <input type="button" value="GO" />
            </div>
           
        </div>
</div>

 </form>	

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
                <li><a href="flute.aspx">Flute</a></li>
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
            <!--
            <div id="specialoffer_text">
                <h2>
                    <span>Get Special Offer <strong>Up to 25% off</strong></span></h2>
            </div>
            <div id="specialoffer_link">
                <a href="home.aspx">...Go</a>
            </div>
            -->
            <asp:AdRotator runat="server" AdvertisementFile="Ads.xml" id="rotator" Target="_blank" />
            <div class="clearthis">
                &nbsp;</div>
        </div>

		

	</div>

	