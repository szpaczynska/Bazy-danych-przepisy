<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Znajdź przepis.aspx.cs" Inherits="Przepisy_Projekt.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p style="font-family: 'Times New Roman', Times, serif; background-color: #CCCCFF">
        &nbsp;</p>
    <p>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Wybierz typ potrawy"></asp:Label>
    </p>
    <p>
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="typPotrawy" DataValueField="typPotrawy" Width="400px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Przepisy_BazaConnectionString %>" SelectCommand="SELECT [typPotrawy] FROM [Potrawy]"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Wybierz potrawę"></asp:Label>
    </p>
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="nazwaPotrawy" DataValueField="idPotrawy" Height="18px" Width="400px">
        </asp:DropDownList>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Przepisy_BazaConnectionString %>" SelectCommand="SELECT nazwaPotrawy, idPotrawy FROM Potrawy WHERE (typPotrawy LIKE @param)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="param" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Width="400px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="Składnik" HeaderText="Składnik" SortExpression="Składnik" />
                <asp:BoundField DataField="Ilość" HeaderText="Ilość" SortExpression="Ilość" />
                <asp:BoundField DataField="Jednostka" HeaderText="Jednostka" SortExpression="Jednostka" />
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
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Przepisy_BazaConnectionString %>" SelectCommand="SELECT Skladniki.nazwaSkladnika AS Składnik, Przepisy.ilosc AS Ilość, Przepisy.jednostkaMiary AS Jednostka FROM Potrawy INNER JOIN Przepisy ON Potrawy.idPotrawy = Przepisy.idPotrawy INNER JOIN Skladniki ON Przepisy.idSkladnika = Skladniki.idSkladnika WHERE (Przepisy.idPotrawy = @param)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="param" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="399px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:BoundField DataField="Sposób przygotowania potrawy" HeaderText="Sposób przygotowania potrawy" SortExpression="Sposób przygotowania potrawy" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Przepisy_BazaConnectionString %>" SelectCommand="SELECT  sPrzygototwania AS [Sposób przygotowania potrawy] FROM Potrawy WHERE (idPotrawy = @param)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="param" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="ButtonKalorie" runat="server" OnClick="ButtonKalorie_Click" Text="Oblicz kaloryczność" Width="400px" BackColor="#CCCCFF" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelKalorie" runat="server" Text="0"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
    &nbsp;<asp:Button ID="ButtonCena" runat="server" OnClick="ButtonCena_Click" Text="Oblicz cenę składników" Width="400px" BackColor="#CCCCFF" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelCena" runat="server" Text="0"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>
