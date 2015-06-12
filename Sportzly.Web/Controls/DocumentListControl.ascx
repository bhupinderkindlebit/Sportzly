<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DocumentListControl.ascx.cs" Inherits="Sportzly.Web.Controls.DocumentListControl" %>

<script>
    function toggleAndChangeText(a) {        
        jQuery(a).next().toggle();
        if (jQuery(a).next().css('display') == 'none') {
            jQuery(a).next().removeClass('active');
            jQuery(a).parent().removeClass('active');
        }
        else {

            jQuery(a).parent().addClass('active');
        }
    }


    var mobile = (/iphone|ipad|ipod|android|blackberry|mini|windows\sce|palm/i.test(navigator.userAgent.toLowerCase()));

    if (mobile) {

        jQuery('#inline4').css("width", "100% !important");
        jQuery('#inline4').addClass('mobile');
    }

</script>

<div class="resp-tabs-container noborder-bottom">
    <div class="tab1 col-xs-12">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <div class="documents-sec membersList">
                <div class="section-title">
                    <h2>Documents <strong>(<span data-bind="text: ResultCount"></span>)</strong></h2>
                </div>
                <div class="search-sec">
                    <div class="documentssearch">
                        <input class="input search-fans" type="text" placeholder="Search for Documents" onblur="bindBlur(event)" onfocus="bindFocus(event)" />
                        <a href="#"><i class="fa fa-fw"></i></a>
                    </div>
                    <div class="documentsbtn"><a style="cursor:pointer;" class="view-all right" onclick="showDocument()"><i class="fa fa-fw" style="position: relative; top: 2px; left: 0px; color: #fff"></i> Add Document</a> </div>
                </div>
                <div class="documents-listing">
                    <ul data-bind="foreach: { data: Result()}" class="freindsListUL1">
                        <li class='doctitle1'><span data-bind="text: postdate()"></span><a class="aTag" onclick="toggleAndChangeText(this)" href="javascript:void(0);" data-bind="html: title() + '<i class=&#34;fa fa-fw&#34;></i>'"></a>
                            <div style="display: none;" class="divToToggle2">
                                <ul class="listpdf" data-bind="foreach: Files()">
                                    <li><a data-bind="attr: { href: 'filedownload.ashx?filename=' + filepath() + '&name=' + filename() + '' }, text: filename()"></a> </li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>


