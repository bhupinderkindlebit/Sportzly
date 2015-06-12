<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BlankMaster.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Sportzly.Web.ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="wrapper" class="form profile">
 
      
   <div runat="server" id="forgotPasswordTable">
           <nav class="head_profile">
        <h1>Forgot Password</h1>
    </nav>
        <h3 class="title">&nbsp;</h3>
         <div class="contact">
            
  
        <ul class="ulform">
            <li style="width:725px;">
                <label style="text-align: center; width: 600px;">
  <asp:Label runat="server" ID="Label1"></asp:Label>
                </label>
                
            </li>
            <li>
                <label for="fisrtname">
                  Registered EmailId
                    </label>
                 <asp:TextBox ID="TextBox1" runat="server" CssClass="input" onfocus="bindFocus()" onblur="bindBlur()">Enter email Id</asp:TextBox>
                </li>
              <li style="width:725px;">
                   <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Send" CssClass="btTxt submit" />
                  </li>
            </ul>
             </div>
       
    </div>

    <div runat="server" id="changePasswordTable">
          <nav class="head_profile">
        <h1>Change Password</h1>
    </nav>
        <div class="contact">
            
    
        <ul class="ulform">
             <li style="width:725px;">
                <label style="text-align: center; width: 600px;">
  <asp:Label runat="server" ID="errorLbl"></asp:Label>
                </label>
                
            </li>
            <li>
                <label for="fisrtname">
                   Old Password
                    </label>
                 <asp:TextBox ID="TextBox2" CssClass="input" runat="server" onfocus="bindFocus()" onblur="bindBlur()" TextMode="Password">Enter email Id</asp:TextBox>
                </li>

              <li>
                <label for="fisrtname">
                   New Password
                    </label>
                   <asp:TextBox ID="TextBox3" runat="server" CssClass="input" onfocus="bindFocus()" onblur="bindBlur()" TextMode="Password">Enter email Id</asp:TextBox>
                  </li>

               <li>
                <label for="fisrtname">
                   Confirm Password
                    </label>
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="input" onfocus="bindFocus()" onblur="bindBlur()" TextMode="Password">Enter email Id</asp:TextBox>
                   </li>

              <li style="width:725px;">
                   <asp:Button ID="Button2" runat="server" CssClass="btTxt submit" Text="Save" OnClick="Button2_Click" />
                  </li>
            </ul>
            </div>
        </div>
        </section>
</asp:Content>
