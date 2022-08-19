<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ElectronicsHub_FrontEnd.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="main">
        <div id="signin-modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="form-box">
                            <div class="form-tab">
                                <ul class="nav nav-pills nav-fill nav-border-anim" role="tablist">
                                    <li class="nav-item">
                                        <h2 class="title text-center mb-4" id="signin-tab" data-toggle="tab" role="tab" aria-controls="signin" aria-selected="true">Sign In</h2>
                                    </li>
                                </ul>
                                <div class="tab-content" id="tab-content-5">
                                    <div class="tab-pane fade show active" id="signin" role="tabpanel" aria-labelledby="signin-tab">
                                        <form runat="server" action="#">
                                            <div class="form-group">
                                                <label for="singin-email">Email address *</label>
                                                <asp:TextBox runat="server" type="email" class="form-control" id="signInEmail" name="signin-email" required="required"></asp:TextBox>
                                            </div><!-- End .form-group -->

                                            <div class="form-group">
                                                <label for="singin-password">Password *</label>
                                                <asp:TextBox runat="server" type="password" class="form-control" id="signInPassword" name="singin-password" required="required"></asp:TextBox>
                                            </div><!-- End .form-group -->

                                            <div class="form-footer">
                                                <asp:Button id="btnSignIn" runat="server" type="submit" class="btn btn-outline-primary-2" Text="LOG IN">
                                                  
                                                </asp:Button>

                                                <a href="Register.aspx" class="forgot-link">Or create an account</a>
                                            </div><!-- End .form-footer -->
                                        </form>
                                    
                                    </div><!-- .End .tab-pane -->
                                </div><!-- End .tab-content -->
                            </div><!-- End .form-tab -->
                        </div><!-- End .form-box -->
                    </div><!-- End .modal-body -->
                </div><!-- End .modal-content -->
            </div><!-- End .modal-dialog -->
        </div><!-- End .modal -->
    </main>
</asp:Content>
