<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dodaj swój przepis.aspx.cs" Inherits="Przepisy_Projekt.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p style="font-family: 'Times New Roman', Times, serif; background-color: #CCCCFF">
        &nbsp;</p>
    <p>
        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Italic="False" Text="Dostępne potrawy"></asp:Label>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="Potrawa" HeaderText="Potrawa" SortExpression="Potrawa" />
                <asp:BoundField DataField="Typ potrawy" HeaderText="Typ potrawy" SortExpression="Typ potrawy" />
                <asp:BoundField DataField="Sposób przygotowania" HeaderText="Sposób przygotowania" SortExpression="Sposób przygotowania" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Przepisy_BazaConnectionString %>" SelectCommand="SELECT nazwaPotrawy AS Potrawa, typPotrawy AS [Typ potrawy], sPrzygototwania AS [Sposób przygotowania] FROM Potrawy"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="Button1" runat="server" Height="26px" OnClick="Button1_Click" Text="Stwórz nowy przepis" Width="336px" BackColor="#CCCCFF" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Wprowadź dane" Visible="False"></asp:Label>
    </p>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Nazwa potrawy" Visible="False"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text="Typ" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Text="Sposób przygotowania" Visible="False"></asp:Label>
    </p>
    <p>
        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="TextBox3" runat="server" Visible="False"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Dodaj" Visible="False" BackColor="#CCCCFF" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="Wybierz składnik, który chcesz dodać" Visible="False"></asp:Label>
    </p>
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="nazwaSkladnika" DataValueField="idSkladnika" Visible="False">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button3" runat="server" Height="29px" OnClick="Button3_Click" Text="Wybierz" Visible="False" BackColor="#CCCCFF" />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Przepisy_BazaConnectionString %>" SelectCommand="SELECT [idSkladnika], [nazwaSkladnika] FROM [Skladniki]"></asp:SqlDataSource>
&nbsp;<asp:Label ID="Label6" runat="server" Visible="False"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="Label5" runat="server" Text="Podaj ilość" Visible="False" Font-Bold="True"></asp:Label>
    </p>
    <p>
        <asp:TextBox ID="TextBox4" runat="server" Visible="False"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Visible="False"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Dodaj składnik do przepisu" Visible="False" BackColor="#CCCCFF" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="Label7" runat="server" Text="Składniki, które już dodałeś" Visible="False" Font-Bold="True"></asp:Label>
    </p>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Visible="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
        <AlternatingRowStyle BackColor="#F7F7F7" />
        <Columns>
            <asp:BoundField DataField="nazwaSkladnika" HeaderText="nazwaSkladnika" SortExpression="nazwaSkladnika" />
            <asp:BoundField DataField="ilosc" HeaderText="ilosc" SortExpression="ilosc" />
            <asp:BoundField DataField="jednostkaMiary" HeaderText="jednostkaMiary" SortExpression="jednostkaMiary" />
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
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Przepisy_BazaConnectionString %>" SelectCommand="SELECT Skladniki.nazwaSkladnika, Przepisy.ilosc, Przepisy.jednostkaMiary FROM Potrawy INNER JOIN Przepisy ON Potrawy.idPotrawy = Przepisy.idPotrawy INNER JOIN Skladniki ON Przepisy.idSkladnika = Skladniki.idSkladnika WHERE (Potrawy.idPotrawy = @p)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label6" Name="p" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <p>
    </p>
</asp:Content>
