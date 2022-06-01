<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Jadłospis dnia.aspx.cs" Inherits="Przepisy_Projekt.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p style="background-color: #CCCCFF; font-family: 'Times New Roman', Times, serif; position: static">
        <br />
    </p>
    <p>
        <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Naciśnij przycisk, aby wylosować jadłospis"></asp:Label>
    </p>
    <p>
        &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Losuj jadłospis na dziś" ForeColor="Black" BackColor="#CCCCFF" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="Label2" runat="server" Text="ŚNIADANIE" BorderColor="White" Font-Italic="True" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></asp:Label>
    </p>
    <p>
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="Label3" runat="server" Text="OBIAD" Font-Italic="True"></asp:Label>
    </p>
    <p>
        <asp:Label ID="Label4" runat="server"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="Label5" runat="server" Text="KOLACJA" Font-Italic="True"></asp:Label>
    </p>
    <p>
        <asp:Label ID="Label6" runat="server"></asp:Label>
    </p>
    <p>
    </p>
    <p>
    </p>
    </asp:Content>
