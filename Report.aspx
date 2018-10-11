<%@ Page Title="Report" Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true"
    CodeBehind="Report.aspx.cs" Inherits="Solution.Report" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="Scripts/js/Imagedownload.js"></script>

    <script type="text/javascript">
        function report() {
            var frame1 = dvReport.getElementsByTagName("iframe")[0];
            var framid = frame1.id;
            var iframe = document.getElementById(framid);
            var elmnt = iframe.contentWindow.document.getElementsByTagName("div")[1];
            console.log(reportname);
            html2canvas(elmnt).then(function (canvas) {

                console.log(canvas);
                saveAs(canvas.toDataURL("image/jpeg"), "FileName" );
              
               
            });
        }


        function saveAs(uri, filename) {

            var link = document.createElement('a');

            if (typeof link.download === 'string') {

                link.href = uri;
                link.download = filename;

                //Firefox requires the link to be in the body
                document.body.appendChild(link);

                //simulate click
                link.click();

                //remove the link when done
                document.body.removeChild(link);

            } else {

                window.open(uri);

            }
        }



    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
                    <asp:Panel ID="pnl_Report_Controls" runat="server">
                      <asp:Button runat="server" ID="download" OnClientClick="report();" Text="Save Image"/>
                </asp:Panel>
      
            <div id="dvReport" class="ReportDV">
                <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"
                    OnLoad="CrystalReportViewer1_Load" OnUnload="CrystalReportViewer1_UnLoad" DisplayToolbar="True"
                    HasToggleParameterPanelButton="False" ToolPanelView="None" HasCrystalLogo="False" />
            </div>
        </ContentTemplate>
     </asp:UpdatePanel>
</asp:Content>
