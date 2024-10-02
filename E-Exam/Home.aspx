<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="E_Exam.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
           .container-fluid{
        width:auto;
        height:auto;
        margin-top:42px;
           
    }
    .navbar{
        /*text-align :justify*/
        display:flex;
        box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.3);
    }

    hr{
        background-color: black;
        height:2px;
    }
    .navbar-user{
        text-align: end;
        color: snow;
        font-size: 18px;
        padding-right: 10px;

    }
    .card{
        padding-top:20px;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-fixed-top navbar-expand-lg navbar-dark bg-dark">  
            <div class="col-3 brand"> 
                <a class="navbar-brand" href="#">ระบบบันทึกผลการปฎิบัติงานประจำวัน</a>
            </div>
            <div class="col-9 navbar-user"> 
                <i class="glyphicon glyphicon-user"></i>
                <span class="username" id="username"></span> 
                 <a class="sign-out" href="https://localhost:44314/Login"><i class="fa fa-sign-out" title="Log out"></i></a>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="row row-container">
                <div id="form-type">
                    <div class="card">
                        <div class="card-header">
                            <h5>รายการการปฎิบัติงานประจำวัน</h5>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <asp:Label ID="Label1" runat="server" Text="ประเภทงาน (Development / Test / Document) :"></asp:Label>     
                                <asp:TextBox ID="workType" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label2" runat="server" Text="ชื่องานที่ดำเนินการ :"></asp:Label>     
                                <asp:TextBox ID="workName" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label3" runat="server" Text="เวลาที่เริ่มดำเนินการ :"></asp:Label>     
                                <asp:TextBox ID="startDate" runat="server" type="date"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label4" runat="server" Text="เวลาที่เสร็จสิ้น :"></asp:Label>     
                                <asp:TextBox ID="endDate" runat="server" type="date"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label5" runat="server" Text="สถานะ (ดำเนินการ / เสร็จสิ้น / ยกเลิก) :"></asp:Label>     
                                <asp:TextBox ID="status" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="Label6" runat="server" Text="วันเวลาที่บันทึกข้อมูล :"></asp:Label>     
                                <asp:TextBox ID="saveDate" runat="server" type="date"></asp:TextBox>
                            </div>
                            <asp:Button ID="ButtonSubmit" runat="server" Text="บันทึก" OnClick="BtnSave_Click" CssClass="btn btn-primary"/>
                            <asp:Button ID="Button1" runat="server" Text="แสดงข้อมูล" OnClick="BtnShow_Click" CssClass="btn btn-primary"/>
                        </div>
                    </div>
                    <div>

                        <asp:GridView ID="GridView" runat="server" CssClass="table table-striped" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField DataField="type" HeaderText="ประเภทงาน" />
                                <asp:BoundField DataField="name" HeaderText="ชื่องานที่ดำเนินการ" />
                                <asp:BoundField DataField="startDate" HeaderText="เวลาที่เริ่มดำเนินการ" DataFormatString="{0:yyyy-MM-dd}" />
                                <asp:BoundField DataField="endDate" HeaderText="เวลาที่เสร็จสิ้น" DataFormatString="{0:yyyy-MM-dd}" />
                                <asp:BoundField DataField="status" HeaderText="สถานะ" />
                                <asp:BoundField DataField="saveDate" HeaderText="วันเวลาที่บันทึกข้อมูล" DataFormatString="{0:yyyy-MM-dd}" />
                                <asp:BoundField DataField="updateDate" HeaderText="วันเวลาที่บันทึกข้อมูล" DataFormatString="{0:yyyy-MM-dd}" />
                                <asp:TemplateField HeaderText="Tools">
                                <ItemTemplate>
                                    <asp:LinkButton ID="EditButton" runat="server" Text="Edit" CommandName="Edit"/>
                                    <asp:LinkButton ID="DeleteButton" runat="server" Text="Delete" CommandName="Delete"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
        
    </form>
</body>
</html>
