<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ElectonicsHub.Register" %>
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
                                        <h2 class="title text-center mb-4" id="register-tab" data-toggle="tab" role="tab" aria-controls="register" aria-selected="true">Create account</h2>                                        
                                    </li>
                                </ul>
                                <div class="tab-content" id="tab-content-5">
                                    <div class="tab-pane fade show active" id="register" role="tabpanel" aria-labelledby="register-tab">
                                        <form runat="server" action="#">
                                            <div class="form-group">
                                                <label for="firstname">First Name *</label>
                                                <asp:TextBox runat="server" type="text" class="form-control" id="firstname" maxlength="255" 
                                                    pattern="[A-Za-z]+" title="Text only, numeric and special characters not allowed" 
                                                    required="required">
                                                </asp:TextBox>
                                            </div><!-- End .form-group -->

                                            <div class="form-group">
                                                <label for="surname">Last Name *</label>
                                                <asp:TextBox runat="server" type="text" class="form-control" id="surname" maxlength="255" 
                                                    pattern="[A-Za-z]+" title="Text only, numeric and special characters not allowed" required="required">
                                                </asp:TextBox>
                                            </div><!-- End .form-group -->

                                            <div class="form-group">
                                                <label for="email">Email *</label>
                                                <asp:TextBox runat="server" type="email" class="form-control" id="email" maxlength="255" required="required">
                                                </asp:TextBox>
                                            </div><!-- End .form-group -->

                                            <div class="form-group">
                                                <label for="phone">Phone *</label>
                                                <asp:TextBox runat="server" type="tel" maxlength="10" class="form-control" id="phone"
                                                    title="10 digit phone number" pattern="[0-9]{10}" required="required">
                                                </asp:TextBox>
                                            </div><!-- End .form-group -->

                                            <div class="form-group">
                                                <label for="password">Password *</label>
                                                <asp:TextBox runat="server" type="password" maxlenght="100" class="form-control" id="password"                                                    
                                                    pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,255}$" 
                                                    title="Password must be at least 8 characters long and contain at least 1 uppercase, 1 lowercase, and 1 special character" 
                                                    required="required">
                                                </asp:TextBox>
                                            </div><!-- End .form-group -->

                                            <div class="form-group">
                                                <label for="password2">Confirm password *</label>
                                                <asp:TextBox runat="server" type="password" maxlength="100" class="form-control" id="password2" required="required">
                                                </asp:TextBox>
                                            </div><!-- End .form-group -->

                                            <span runat="server" id="pswdMismatchError" visible="false">Passwords don't match</span>

                                            <div class="form-footer">
                                                <asp:button runat="server" type="submit" class="btn btn-outline-primary-2" id="registerButton" Text="Register">
                                                </asp:button>

                                                <a href="Login.aspx" class="forgot-link">Or sign in</a>
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
