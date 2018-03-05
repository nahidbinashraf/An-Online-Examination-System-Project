<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="editquestion.aspx.cs" Inherits="admin_editquestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headplaceholder" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" Runat="Server">
    <div class="col-md-12">
        <div class="card">
            <%--Button For select add question for exam--%>
            <div class="btn-group bg-danger">
                <asp:Button ID="btn_paneleditquestion" runat="server" Text="Edit Question" CssClass="btn btn-info" BorderStyle="None" CausesValidation="False" BackColor="#343A40" />
            </div>
            <div class="card-body">
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Select Exam</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="drp_editexam" runat="server" CssClass="form-control" DataTextField="exam_name" DataValueField="exam_id">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="require_editexam" runat="server" ErrorMessage="You must select a exam" ControlToValidate="drp_editexam" ForeColor="red" InitialValue="-1" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Qusetion Name</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txt_editquestionname" runat="server" TextMode="MultiLine" CssClass="form-control" Height="150px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_editquestionname" runat="server" ErrorMessage="Enter exam name" ControlToValidate="txt_editquestionname" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Option A</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txt_editoptionone" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_editop1" runat="server" ErrorMessage="Enter option one" ControlToValidate="txt_editoptionone" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Option B</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txt_editoptiontwo" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_editop2" runat="server" ErrorMessage="Enter option two" ControlToValidate="txt_editoptiontwo" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Option C</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txt_edtoptionthree" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_editop3" runat="server" ErrorMessage="Enter option three" ControlToValidate="txt_edtoptionthree" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-md-2 col-form-label ">Option D</label>
                    <div class="col-md-9">
                        <asp:TextBox ID="txt_editoptionfour" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="require_editop4" runat="server" ErrorMessage="Enter option four" ControlToValidate="txt_editoptionfour" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                <label class="col-md-2 col-form-label text-center">Correct Answer</label>
                    <div class="col-md-4">
                        <asp:RadioButtonList ID="rdo_editcorrectanswer" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="10">
                            <asp:ListItem Text="A" Value=1></asp:ListItem>
                            <asp:ListItem Text="B" Value=2></asp:ListItem>
                            <asp:ListItem Text="C" Value=3></asp:ListItem>
                            <asp:ListItem Text="D" Value=4></asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="req_rdo_editcorrectanswer" runat="server" ErrorMessage="Select a correct answer" ControlToValidate="rdo_editcorrectanswer" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
            </div>
                <div class="card-footer">
                        <div class="offset-2">
                            <asp:Button ID="btn_editquestion" runat="server" Text="Edit Question" CssClass="btn" BackColor="#343A40" BorderStyle="None" ForeColor="White" OnClick="btn_editquestion_Click"/>
                        </div>
                        <asp:Panel ID="panel_editquestion_warning" runat="server" Visible="false">
                            <br />
                            <div class="alert alert-danger text-center">
                                <asp:Label ID="lbl_editquestionwarning" runat="server" />
                            </div>
                        </asp:Panel>
                    </div>
            </div>          
            
        </div>
    </div>
</asp:Content>

