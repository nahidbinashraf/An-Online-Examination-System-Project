<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="resetpass.aspx.cs" Inherits="admin_resetpass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" Runat="Server">
    <div class="col-md-12">
        <div class="card">
            <%--Button For select panel--%>
            <div class="btn-group bg-danger">
                <asp:Button ID="btn_panelreste" runat="server" Text="Reset Password" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#343A40" />
            </div>
            <%--Add category --%>
            <div class="card-body">
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Present Password</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_admipresentpass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_admipresentpass" runat="server" ErrorMessage="Enter admin name" ControlToValidate="txt_admipresentpass" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">New Password</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_adminewpass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_adminnewpass" runat="server" ErrorMessage="Enter new password" ControlToValidate="txt_adminewpass" ForeColor="red" Display="Dynamic" ></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Re-peat password</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_adminnewpassrpeat" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_adminpassrepeat" runat="server" ErrorMessage="Re-peat password" ControlToValidate="txt_adminnewpassrpeat" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="reqcompre_adminpassrepeat" runat="server" ErrorMessage="Password don't match" ControlToValidate="txt_adminnewpassrpeat" ControlToCompare="txt_adminewpass" ForeColor="Red" Display="Dynamic" ></asp:CompareValidator>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="offset-2">
                        <asp:Button ID="btn_resetpass" runat="server" Text="Reset Password" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btn_resetpass_Click" />
                    </div>
                    <asp:Panel ID="panel_resetpass_warning" runat="server" Visible="false">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_resetpasswarning" runat="server" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

