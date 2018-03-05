<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="subject.aspx.cs" Inherits="admin_subject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="col-md-12">
        <div class="card">
            <%--Button For select panel--%>
            <div class="btn-group bg-danger">
                <asp:Button ID="btn_panelsubjectlist" runat="server" Text="Subject List" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" OnClick="btn_panelsubjectlist_Click" />
                <asp:Button ID="btn_paneladdSubject" runat="server" Text="Add Subject" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" OnClick="btn_paneladdSubject_Click" />
            </div>
            <%--Add subject panel--%>
            <asp:Panel ID="panel_addsubject" runat="server">
                <div class="card-body">
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Select Category</label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="drp_category" runat="server" CssClass="form-control" DataTextField="category_name" DataValueField="category_id">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="require_drpcategory" runat="server" ErrorMessage="You must select a category" ControlToValidate="drp_category" ForeColor="red" InitialValue="-1"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Subject Name</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_subject" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="require_subject" runat="server" ErrorMessage="Enter subject" ControlToValidate="txt_subject" ForeColor="red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="offset-2">
                            <asp:Button ID="btn_addsubject" runat="server" Text="Add Subject" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btn_addsubject_Click" />
                        </div>
                        <asp:Panel ID="panel_addsubject_warning" runat="server" Visible="false">
                            <br />
                            <div class="alert alert-danger text-center">
                                <asp:Label ID="lbl_addsubject_warning" runat="server" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
            <%--category list panel--%>
            <asp:Panel ID="panel_subjectlist" runat="server">
                <div class="card text-center mb-3">
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="grdview_subjectlist" runat="server" GridLines="None" AutoGenerateColumns="False" CssClass="table table-bordered" OnRowCommand="grdview_subjectlist_RowCommand" AllowPaging="True" OnPageIndexChanging="grdview_subjectlist_PageIndexChanging" PageSize="5">
                                <Columns>
                                    <asp:BoundField DataField="subject_name" HeaderText="Subject Name" />
                                    <asp:BoundField DataField="category_name" HeaderText="Category Name" NullDisplayText="The subject is under no category" />
                                    <asp:TemplateField HeaderText="Options">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="btn_editsubject" runat="server" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/admin/editsubject.aspx?sid=" + Eval("subject_id") %>'>
                                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit
                                            </asp:HyperLink>
                                            <asp:LinkButton ID="btn_deletesubject" runat="server" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" CommandArgument='<%# Eval("subject_id") %>' CommandName="DeleteRow">
                                            <i class="fa fa-trash" aria-hidden="true"></i> Delete
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    There is no subject added now. Add subject
                                </EmptyDataTemplate>
                                <PagerStyle CssClass="card-footer" HorizontalAlign="Right" />
                            </asp:GridView>
                        </div>

                        <asp:Panel ID="panel_subjectlist_warning" runat="server" Visible="false">
                            <div class="card-footer">
                                <br />
                                <div class="alert alert-danger text-center">
                                    <asp:Label ID="lbl_subjectlistwarning" runat="server" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

