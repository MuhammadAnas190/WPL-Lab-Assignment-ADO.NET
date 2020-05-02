<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LabADO.Default1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%: Page.Title %>- My ASP.NET Application</title>

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>

    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- Banner goes here -->
        <div class="jumbotron">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <h1>Assignment - ADO.NET</h1>
                        <p class="lead">By: Mohammad Anas Saud</p>
                        <p>15140</p>
                    </div>
                </div>
            </div>
        </div>

        <section class="container">
            <div class="row">

                <!-- Add Student -->
                <div class="col-xs-12 col-md-6">
                    <h1>Add Student</h1>
                    <div class="form-group">
                        <asp:Label ID="fnameLbl" runat="server" Text="First Name:"></asp:Label>
                        <asp:TextBox ID="fname" CssClass="form-control" runat="server" ToolTip="Enter your First Name"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lnameLbl" runat="server" Text="Last Name:"></asp:Label>
                        <asp:TextBox ID="lname" CssClass="form-control" runat="server" ToolTip="Enter your Last Name"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="addLbl" runat="server" Text="Address:"></asp:Label>
                        <asp:TextBox ID="address" CssClass="form-control" runat="server" ToolTip="Enter your Address"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="submitAdd" CssClass="btn btn-success" runat="server" Text="Confirm" OnClick="submitAdd_Click" />
                    </div>
                </div>

                <!-- Update Student -->
<!--                <div class="col-xs-12 col-md-6">
                    <h1>Update Student</h1>
                     <div class="form-group">
                        <asp:Label ID="Label5" runat="server" Text="Student Id:"></asp:Label>
                        <asp:TextBox ID="upId" CssClass="form-control" runat="server" ToolTip="Enter Student Id"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label2" runat="server" Text="First Name:"></asp:Label>
                        <asp:TextBox ID="upFname" CssClass="form-control" runat="server" ToolTip="Enter your First Name"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label3" runat="server" Text="Last Name:"></asp:Label>
                        <asp:TextBox ID="upLname" CssClass="form-control" runat="server" ToolTip="Enter your Last Name"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label4" runat="server" Text="Address:"></asp:Label>
                        <asp:TextBox ID="upAdd" CssClass="form-control" runat="server" ToolTip="Enter your Address"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="submitUpdate" CssClass="btn btn-warning" runat="server" Text="Confirm" />
                    </div>
                </div> -->

                <!-- delete Student -->
                <div class="col-xs-12 col-md-6">
                    <h1>Delete Student</h1>
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" Text="ID:"></asp:Label>
                        <asp:TextBox ID="id" CssClass="form-control" runat="server" ToolTip="Enter Student ID"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="submitDel" CssClass="btn btn-danger" runat="server" Text="Confirm" OnClick="submitDel_Click" />
                    </div>
                </div>
            </div>  
        </section>

        <!-- View Students-->
        <section class="container">
            <div class="row">
                <div class="col-xs-12">
                    <h1>Students Record</h1>
                    <asp:GridView 
                        CssClass="table table-striped" 
                        ID="viewStd" 
                        runat="server" 
                        AutoGenerateColumns="False" 
                        AutoGenerateEditButton="True"
                        DataKeyNames="reg_id"
                        DataSourceID="SqlDataSource1"
                    >
                        <Columns>
                            <asp:BoundField DataField="reg_id" HeaderText="ID No." InsertVisible="False" ReadOnly="True" SortExpression="reg_id" />
                            <asp:BoundField DataField="first_name" HeaderText="First Name" SortExpression="first_name" />
                            <asp:BoundField DataField="last_name" HeaderText="Last Name" SortExpression="last_name" />
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource 
                        ID="SqlDataSource1" 
                        runat="server"
                        ConnectionString="<%$ ConnectionStrings:School_dbConnectionString %>" 
                        SelectCommand="SELECT * FROM [StudentsTable1]"
                        UpdateCommand="Update [StudentsTable1] SET first_name=@first_name,last_name=@last_name,Address=@Address WHERE reg_id=@reg_id"
                     ></asp:SqlDataSource>

                </div>
            </div>  
        </section>
    </form>
</body>
</html>
