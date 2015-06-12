<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HeaderControl.ascx.cs" Inherits="Sportzly.Web.Controls.HeaderControl" %>




<style type="text/css">

    #divResult {
        position: absolute;
        width: 335px;
        display: none;
        margin-top: 32px;
        border: solid 1px #dedede;
        border-top: 0px;
        overflow: hidden;
        border-bottom-right-radius: 6px;
        border-bottom-left-radius: 6px;
        -moz-border-bottom-right-radius: 6px;
        -moz-border-bottom-left-radius: 6px;
        box-shadow: 0px 0px 5px #999;
        border-width: 3px 1px 1px;
        border-style: solid;
        border-color: #333 #DEDEDE #DEDEDE;
        background-color: white;
        z-index:9999;
    }

    .display_box {
        padding: 4px;
        border-top: solid 1px #dedede;
        font-size: 12px;       
        z-index:9999;
        float:left;
        width:325px;
        
    }

        .display_box:hover {
            background: #007400;
            color: #FFFFFF;
            cursor: pointer;
        }


    #cssmenu ul ul {
        -webkit-box-shadow: none;
        -moz-box-shadow: none;
        box-shadow: none;
    }

        #cssmenu ul ul a {
            line-height: 33px;
        }

        #cssmenu ul ul ul {
            left: 100%;
            top: 0;
        }

    #cssmenu li ul {
        background: white;
        border-left: 4px solid #007e00;
        border-right: 4px solid #007e00;
        border-bottom: 4px solid #007e00;
        display: none;
        height: auto;
        filter: alpha(opacity=95);
        opacity: 0.95;
        position: absolute;
        width: 152px;
        z-index: 200;
        /*top:1em;
		/*left:0;*/
    }

    #cssmenu li:hover > ul {
        display: block;
    }

    #cssmenu li li {
        display: block;
        float: none;
        padding: 0px;
        position: relative;
        width: 152px;
        background: none;
    }

    #cssmenu li ul a {
        display: block;
        font-size: 12px;
        font-style: normal;
        /*padding: 0px 10px 0px 15px;*/
        text-align: center;
    }

        #cssmenu li ul a:hover {
            opacity: 1.0;
            filter: alpha(opacity=100);
        }

    #cssmenu p {
        clear: left;
    }

    #cssmenu .active > a {
        background: #a80329;
        -webkit-box-shadow: 0 -4px 0 #a80329, 0 -5px 0 #b81c40, 0 -6px 0 #a80329;
        -moz-box-shadow: 0 -4px 0 #a80329, 0 -5px 0 #b81c40, 0 -6px 0 #a80329;
        box-shadow: 0 -4px 0 #a80329, 0 -5px 0 #b81c40, 0 -6px 0 #a80329;
        color: #ffffff;
    }

        #cssmenu .active > a:hover {
            color: white;
        }
</style>

<%--
        <nav id='cssmenu'>
            <ul>
                <li class='has-sub'><a href="teams.aspx">TEAMS</a>
                    <ul>
                        <li><a data-bind="attr: { href: 'teams.aspx?' + EmailId }">MY TEAMS</a></li>
                    </ul>
                </li> 
            </ul>
        </nav>        
        >--%>

<header>
    <div class="container userDetails">
      <div class="row">
        <div class="col-xs-4 col-sm-4 col-md-3"> 
          <!--<div class="nav-button">
            <button data-target=".navbar-collapse" data-toggle="collapse" class="navbar-toggle collapsed" type="button">Main Menu<i class="fa fa-bars"></i></button>
          </div>-->          
          <ul class="nav navbar-collapse">
            <li><a href="myupdates.aspx">STREAM</a></li>
            <!-- <li><a href="#">SOCIAL</a></li>-->
            <li><a href="teams.aspx">TEAMS</a></li>
            <li><a href="http://www.sportzlystore.com/" target="_blank">SHOP</a></li>
            <!--<li><a href="#">MARKET</a></li>-->
          </ul>                    
        </div>
        <div class="col-xs-2 col-sm-2 col-md-2 logo-sec">
          <h1 class="logo"><a href="default.aspx"><img src="images/logo.png"  alt="Sportzly"/></a></h1>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-7 pull-right search-box">
          <div class="header-right">
            <div class="search-bar">
              <input type="text" class="search" autocomplete="off" placeholder="Search for people or teams" onfocus="bindFocus(event)" onblur="bindBlur(event)" id="txtSportzlySearch" />
              <a href="#"><i class="fa fa-search"></i></a>            
              </div>
              <div id="divResult">
                </div>
            <!-- Split button -->
            <div class="btn-group user-btn">
              <button type="button" class="btn btn-default user"><img width="25" height="25" alt="" data-bind="attr: { src: ProfileFoto }"> <span data-bind="text: (DisplayName ? DisplayName : 'unknown')"></span></button>
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"> <span class="caret"></span> <span class="sr-only">Toggle Dropdown</span> </button>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#" data-bind="text: (DisplayName ? DisplayName : 'unknown')"></a></li>
                <li><a href="forgotpassword.aspx">Change Password</a></li>
                <li class="divider"></li>
                <li><a runat="server" id="logoutLink">Logout</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header>

<script type="text/javascript">
    $(function () {
        var currentRequest = null;
        $("#txtSportzlySearch").keyup(function () {        
            var inputSearch = $(this).val();          
            var dataString = "{keyword:'" + inputSearch+"'}";
            if (inputSearch != '') {
                currentRequest = $.ajax({
                    type: "POST",
                    url: "search.asmx/Search",
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    data: dataString,
                    cache: false,
                    beforeSend: function () {
                        if (currentRequest != null) {                        
                            currentRequest.abort();
                        }
                    },
                    success: function (html) {
                        $("#divResult").html('');
                        $("#divResult").html(html.d).show();
                    }
                });
            } return false;
        });

        $(document).on("click", "div.display_box", function (e) {
            var $clicked = $(e.target);                  
            var link = $clicked.find('.name').attr("link");
         
            if (link != "" && link != undefined) { window.location.href = link; }
            
        });
        $(document).on("click", "body", function (e) {
            var $clicked = $(e.target);
            if (!$clicked.hasClass("search")) {
                jQuery("#divResult").fadeOut();
            }
        });
        $('#inputSearch').click(function () {
            jQuery("#divResult").fadeIn();
        });
    });

</script>