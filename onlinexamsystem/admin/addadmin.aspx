<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="addadmin.aspx.cs" Inherits="admin_addadmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="col-md-12">
        <div class="card">
            <%--Button For select panel--%>
            <div class="btn-group bg-danger">
                <asp:Button ID="btn_paneladdadmin" runat="server" Text="Add Admin" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#343A40" />
            </div>
            <%--Add category --%>
            <div class="card-body">
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Admin Name</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_adminame" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_adminnme" runat="server" ErrorMessage="Enter admin name" ControlToValidate="txt_adminame" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Admin Email</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_admiemail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_adminemail" runat="server" ErrorMessage="Enter email" ControlToValidate="txt_admiemail" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Password</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_adminpass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_adminpass" runat="server" ErrorMessage="Enter password" ControlToValidate="txt_adminpass" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Re-peat password</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="txt_adminpassrpeat" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_adminpassrepeat" runat="server" ErrorMessage="Re-peat password" ControlToValidate="txt_adminpassrpeat" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="reqcompre_adminpassrepeat" runat="server" ErrorMessage="Password don't match" ControlToValidate="txt_adminpassrpeat" ControlToCompare="txt_adminpass" ForeColor="Red" ></asp:CompareValidator>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="offset-2">
                        <asp:Button ID="btn_addadmin" runat="server" Text="Add Admin" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btn_addadmin_Click" />
                    </div>
                    <asp:Panel ID="panel_addamin_warning" runat="server" Visible="false">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_addaminwarning" runat="server" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

