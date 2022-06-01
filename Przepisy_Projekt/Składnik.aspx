<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Składnik.aspx.cs" Inherits="Przepisy_Projekt.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p style="font-family: 'Times New Roman', Times, serif; background-color: #CCCCFF">
        <br />
    </p>
        <asp:Label ID="Label1" runat="server" Text="Wprowadź nazwę składnika, aby dowiedzieć się co możesz przygotować z jego użyciem" Font-Bold="True"></asp:Label>
    <p>
        &nbsp;<asp:TextBox ID="TextBoxSkladnik" runat="server" MaxLength="500" Rows="1" Width="492px"></asp:TextBox>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="498px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="Potrawy" HeaderText="Potrawy" SortExpression="Potrawy" />
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Przepisy_BazaConnectionString %>" SelectCommand="SELECT Potrawy.nazwaPotrawy as Potrawy FROM Potrawy INNER JOIN Przepisy ON Potrawy.idPotrawy = Przepisy.idPotrawy INNER JOIN Skladniki ON Przepisy.idSkladnika = Skladniki.idSkladnika WHERE (Skladniki.nazwaSkladnika LIKE @param)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBoxSkladnik" Name="param" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    </asp:Content>
