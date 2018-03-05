<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="exam.aspx.cs" Inherits="admin_exam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="Server">
    <div class="col-md-12">
        <div class="card">
            <%--Button For select panel--%>
            <div class="btn-group bg-danger">
                <asp:Button ID="btn_panelexamlist" runat="server" Text="Exam List" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" OnClick="btn_panelexamlist_Click" />
                <asp:Button ID="btn_paneladdexam" runat="server" Text="Add Exam" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" OnClick="btn_paneladdexam_Click" />
            </div>
            <%--Add exam panel--%>
            <asp:Panel ID="panel_addexam" runat="server">
                <div class="card-body">
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Select Category</label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="drp_categoryexam" runat="server" CssClass="form-control" DataTextField="category_name" DataValueField="category_id">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="require_drpcategory" runat="server" ErrorMessage="You must select a category" ControlToValidate="drp_categoryexam" ForeColor="red" InitialValue="-1"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Select Subject</label>
                        <div class="col-md-4">
                            <asp:DropDownList ID="drp_subjectexam" runat="server" CssClass="form-control" DataTextField="subject_name" DataValueField="subject_id">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="require_subjecexam" runat="server" ErrorMessage="You must select a subject" ControlToValidate="drp_subjectexam" ForeColor="red" InitialValue="-1"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Exam Name</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_examname" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="require_examname" runat="server" ErrorMessage="Enter exam name" ControlToValidate="txt_examname" ForeColor="red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Exam Discription</label>
                        <div class="col-md-9">
                            <asp:TextBox ID="txt_examdis" runat="server" TextMode="MultiLine" CssClass="form-control" Height="150px"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Exam Date</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_examdate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="require_examdate" runat="server" ErrorMessage="Enter exam date" ControlToValidate="txt_examdate" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Exam Duration(Minute)</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_examduration" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="require_examduration" runat="server" ErrorMessage="Enter exam duration" ControlToValidate="txt_examduration" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="requireregular_examduration" runat="server" ErrorMessage="Enter a valid time" ControlToValidate="txt_examduration" ForeColor="red" ValidationExpression="^\d{1,45}$" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Exam Pass Marks</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_exampassmarks" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="require_exampassmark" runat="server" ErrorMessage="Enter exam pass marks" ControlToValidate="txt_exampassmarks" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="requireregular_exampassmark" runat="server" ErrorMessage="Enter a valid marks" ControlToValidate="txt_exampassmarks" ForeColor="red" ValidationExpression="^\d{1,45}$" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-md-2 col-form-label ">Exam Total Marks</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txt_exammatotalmarks" runat="server" CssClass="form-control" TextMode="SingleLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="require_exammatotal" runat="server" ErrorMessage="Enter total marks" ControlToValidate="txt_exammatotalmarks" ForeColor="red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rege_exammatotal" runat="server" ErrorMessage="Enter a valid total marks" ControlToValidate="txt_exammatotalmarks" ForeColor="red" ValidationExpression="^\d{1,45}$" Display="Dynamic"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="offset-2">
                            <asp:Button ID="btn_addexam" runat="server" Text="Add Exam" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btn_addexam_Click" />
                        </div>
                        <asp:Panel ID="panel_addexam_warning" runat="server" Visible="false">
                            <br />
                            <div class="alert alert-danger text-center">
                                <asp:Label ID="lbl_examaddwarning" runat="server" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
            <%--exam list panel--%>
            <asp:Panel ID="panel_examlist" runat="server">
                <div class="card text-center mb-3">
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="grdview_examlist" runat="server" GridLines="None" CssClass="table table-bordered" AutoGenerateColumns="False" OnRowCommand="grdview_examlist_RowCommand" AllowPaging="True" OnPageIndexChanging="grdview_examlist_PageIndexChanging" PageSize="5">

                                <Columns>
                                    <asp:BoundField DataField="category_name" HeaderText="Category Name" />
                                    <asp:BoundField DataField="subject_name" HeaderText="Subject Name" />
                                    <asp:BoundField DataField="exam_name" HeaderText="Exam Name" />
                                    <asp:BoundField DataField="exam_date" HeaderText="Exam Date" DataFormatString="{0:d}" />
                                    <asp:TemplateField HeaderText="Options">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="btn_detailsexam" runat="server" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/admin/examdetails.aspx?eid=" + Eval("exam_id") %>'>
                                            <i class="fa fa-info-circle" aria-hidden="true"></i> Details
                                            </asp:HyperLink>
                                            <asp:HyperLink ID="btn_editexam" runat="server" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/admin/editexam.aspx?eid=" + Eval("exam_id") %>'>
                                            <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit
                                            </asp:HyperLink>
                                            <asp:LinkButton ID="btn_deleteexam" runat="server" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" CommandArgument='<%# Eval("exam_id") %>' CommandName="deleteexam">
                                            <i class="fa fa-trash" aria-hidden="true"></i> Delete
                                            </asp:LinkButton>
                                            <asp:HyperLink ID="btn_addquestion" runat="server" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/admin/addquestion.aspx?eid=" + Eval("exam_id") %>'>
                                            <i class="fa fa-plus" aria-hidden="true"></i> Add Question
                                            </asp:HyperLink>
                                            <asp:HyperLink ID="btn_viewquestion" runat="server" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" NavigateUrl='<%# "~/admin/examquestion.aspx?eid=" + Eval("exam_id") %>'>
                                            <i class="fa fa-info-circle" aria-hidden="true"></i> View Question
                                            </asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    There is no exam added now. Add exam
                                </EmptyDataTemplate>
                                <PagerStyle CssClass="card-footer" HorizontalAlign="Right" />
                            </asp:GridView>

                        </div>
                        <asp:Panel ID="panel_examlist_warning" runat="server" Visible="false">
                            <div class="card-footer">
                                <br />
                                <div class="alert alert-danger text-center">
                                    <asp:Label ID="lbl_examlistwarning" runat="server" />
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

