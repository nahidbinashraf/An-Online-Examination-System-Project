<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="category.aspx.cs" Inherits="admin_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="col-md-12">
        <div class="card">
            <%--Button For select panel--%>
            <div class="btn-group bg-danger">
                <asp:Button ID="btn_panelcategorylist" runat="server" Text="Category List" CssClass="btn btn-info" OnClick="btn_panelcategorylist_Click" BorderStyle="None" CausesValidation="False" />
                <asp:Button ID="btn_paneladdcategory" runat="server" Text="Add Category" CssClass="btn btn-info" OnClick="btn_paneladdcategory_Click" BorderStyle="None" CausesValidation="False" />
            </div>
            <%--Add category panel--%>
            <asp:Panel ID="panel_addcategory" runat="server">
                <div class="card-body">
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Category Name</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_category" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="require_category" runat="server" ErrorMessage="Enter category" ControlToValidate="txt_category" ForeColor="red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="offset-2">
                            <asp:Button ID="btn_addcategory" runat="server" Text="Add Category" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btn_addcategory_Click" />
                        </div>
                        <asp:Panel ID="panel_addcategory_warning" runat="server" Visible="false">
                            <br />
                            <div class="alert alert-danger text-center">
                                <asp:Label ID="lbl_categoryaddwarning" runat="server" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
            <%--category list panel--%>
            <asp:Panel ID="panel_categorylist" runat="server">
                <div class="card text-center mb-3">
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="grdview_categorylist" runat="server" CssClass="table table-bordered" GridLines="None" AutoGenerateColumns="False" OnRowCommand="grdview_categorylist_RowCommand" AllowPaging="True" PageSize="5" OnPageIndexChanging="grdview_categorylist_PageIndexChanging">                              
                                 <Columns>
                                    <asp:BoundField DataField="category_name" HeaderText="Category Name" >
                                     <HeaderStyle CssClass="card-header" />
                                     </asp:BoundField>
                                    <asp:TemplateField HeaderText="Options">
                                        <HeaderStyle CssClass="card-header" />
                                        <ItemTemplate>
                                            <asp:HyperLink ID="btn_editcategoryx" runat="server" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/admin/EditCategory.aspx?cid=" + Eval("category_id")%>'>
                                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit
                                            </asp:HyperLink>
                                            <asp:LinkButton ID="btn_deletecategory" runat="server" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" CommandArgument='<%# Eval("category_id") %>' CommandName="delete_category">
                                            <i class="fa fa-trash" aria-hidden="true"></i> Delete
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    There is no category right now. Create now
                                </EmptyDataTemplate>
                                 <PagerStyle CssClass="card-footer" HorizontalAlign="Right" />
                            </asp:GridView>
                        </div>
                        <asp:Panel ID="panel_categorylist_warning" runat="server" Visible="false">
                            <div class="card-footer">
                                <br />
                                <div class="alert alert-danger text-center">
                                    <asp:Label ID="lbl_categorylistwarning" runat="server" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>

</asp:Content>

