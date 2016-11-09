<!--- Page Title = Title that appears in the html <title> tag and in the page subtitle section below the menu bar --->
<cfset pageTitle="Put title here">
<!--- Last Updated Date = Enter the date the page was last updated. Use the format 'mm/dd/yyyy' --->
<cfset updatedDT = "05/11/2006">
<!--- Do not alter this tag! --->
<cfinclude template="../includes/incBegin.cfm">
<!--- ************************************
			BEGIN PAGE CONTENT
****************************************** --->
<h2>Heading</h2>

<p>Paragraph of text.</p>

<p>Link to document:</p>

<a href="CatDesktopWebScript0508.pdf">Cataloger's Desktop 
                  on the Web script/outline</a> (Aug. 2005)
				  
<p>Open document in separate window:</p>

<a href="List%20of%20classes05June.pdf"onClick="OpenWin1=open('List%20of%20classes05June.pdf','CtrlWindow','toolbar=1,location=1,status=1,width=800,height=600,screenY=20,screenX=20,top=20,left=20,scrollbars=1,resizable=1');OpenWin1.focus();return false;"onMouseOver="window.status='Open document in new window';return true" TITLE="Open this pdf file in a new window">List of Classes Offered</a>(June 2005)











<!--- ************************************
			END PAGE CONTENT
****************************************** --->
<!--- Do not alter this tag! --->
<cfinclude template="../includes/incEnd.cfm">