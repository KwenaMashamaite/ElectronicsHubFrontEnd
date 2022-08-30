<%@ Page Title="" Language="C#" MasterPageFile="~/TopNav.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ElectronicsHub_FrontEnd.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="main">
        <div class="login-page bg-image pt-8 pb-8 pt-md-12 pb-md-12 pt-lg-17 pb-lg-17" style="background-image: url('/assets/images/backgrounds/login-bg.jpg')">
            <div id="signin-modal" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="form-box">
                                <div class="form-tab">
                                    <ul class="nav nav-pills nav-fill nav-border-anim" role="tablist">
                                        <li class="nav-item">
                                            <label runat="server" id="Error" style="color: red;"></label>
                                            <h2 class="title text-center mb-4" id="signin-tab" data-toggle="tab" role="tab" aria-controls="signin" aria-selected="true">Sign In</h2>
                                        </li>
                                    </ul>
                                    <div class="tab-content" id="tab-content-5">
                                        <div class="tab-pane fade show active" id="signin" role="tabpanel" aria-labelledby="signin-tab">
                                            <div class="form-group">
                                                <label for="Email">Email address *</label>
                                                <asp:TextBox runat="server" type="email" class="form-control" ID="Email" required="required"></asp:TextBox>
                                            </div><!-- End .form-group -->

                                            <div class="form-group">
                                                <label for="password">Password *</label>
                                                <asp:TextBox runat="server" type="password" class="form-control" id="Password" required="required"></asp:TextBox>
                                            </div><!-- End .form-group -->

                                            <div class="form-footer">
                                                <asp:Button ID="LoginButton" runat="server" type="submit" class="btn btn-outline-primary-2" Text="LOG IN" OnClick="LoginButton_Click">
                                                  
                                                </asp:Button>

                                                <a runat="server" href="~/Register.aspx" class="forgot-link">Or create an account</a>
                                            </div><!-- End .form-footer -->
                                        </div><!-- .End .tab-pane -->
                                    </div><!-- End .tab-content -->
                                </div><!-- End .form-tab -->
                            </div><!-- End .form-box -->
                        </div><!-- End .modal-body -->
                    </div><!-- End .modal-content -->
                </div><!-- End .modal-dialog -->
            </div><!-- End .modal -->
        </div>
    </main>
</asp:Content>
