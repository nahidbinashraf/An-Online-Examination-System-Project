<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.master" AutoEventWireup="true" CodeFile="subjectexam.aspx.cs" Inherits="subjectexam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="heardcontentplaceholder" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontentplaceholder" runat="Server">
    <h2 class="m-4">All
        <asp:Label ID="lbl_subjectexam" runat="server"></asp:Label>
        Subject Exams</h2>
    <hr />
    <div class="row">
        <asp:Repeater ID="gridview_sujectexam" runat="server">
            <ItemTemplate>
                <div class="col-lg-4 mb-4">
                    <div class="card h-100">
                        <h3 class="card-header">Exam name: <%# Eval("exam_name") %></h3>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Exam discription: <%# Eval("exam_description") %></li>
                            <li class="list-group-item">Pass Marks: <%# Eval("exampass_marks") %></li>
                            <li class="list-group-item">Total Marks: <%# Eval("exam_marks") %></li>
                            <li class="list-group-item">
                                <asp:HyperLink ID="hlink_gotexam" runat="server" CssClass="btn btn-primary" ForeColor="White" NavigateUrl='<%# "~/question.aspx?eid=" + Eval("exam_id")%>'>Take exam</asp:HyperLink>
                            </li>
                        </ul>
                    </div>
                </div>
            </ItemTemplate>

        </asp:Repeater>
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <asp:Panel ID="panel_examshow_warning" runat="server" Visible="false">
                        <br />
                        <div class="alert alert-danger text-center">
                            <asp:Label ID="lbl_examshowwarning" runat="server" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

