<!--- Page Title = Title that appears in the html <title> tag and in the page subtitle section below the menu bar --->
<cfset pageTitle="Copy Cataloging Section">
<!--- Last Updated Date = Enter the date the page was last updated. Use the format 'mm/dd/yyyy' --->
<cfset updatedDT = "08/24/2005">
<!--- Do not alter this tag! --->
<cfinclude template="/cataloging/includes/incBegin.cfm">
<!--- ************************************
			BEGIN PAGE CONTENT
****************************************** --->
<h2>SEL Theses & Dissertations Minimal Cataloging</h2>
            <h3>Background</h3>
            <p>Theses and dissertations for SEL are cataloged at the minimal level. 
              No subject headings are assigned. Follow the procedures outlined 
              below to create original K-level records in OCLC. Use templates 
              created or use constant data for required descriptive elements.</p>
            <h3>Problems to be set aside</h3>
            <ul>
              <li>Name conflicts requiring NAR.</li>
              <li>Name conflicts requiring editing of existing bibliographic records.</li>
              <li>Titles with special characters requiring transcription into 
                English.</li>
            </ul>
            <h3>Recommended steps</h3>
            <ul>
              <li>Input data in the following fields:</li>
            </ul>
            <table border="1" cellspacing="0" cellpadding="3" width="80%" align="center">
              <tr> 
                <td width="20%">008:<br />
                  Dates </td>
                <td valign="top">Input DATE</td>
              </tr>
              <tr>
                <td valign="top">049</td>
                <td>Code 049 to appropriate $a location code and add other subfields, 
                  as needed, especially summary holdings:<br />
                  <ul>
                    <li>CLUE $n At bindery</li>
                    <li>CLUE $n At bindery $v v.1-2</li>
                  </ul>
                </td>
              </tr>
              <tr>
                <td valign="top">090</td>
                <td>Classify and cutter as follows:<br />
                  Thesis: <b>LD791.8.discipline cutter $b author cutter date</b><br />
                  Dissertation: <b>LD791.9.discipline cutter $b author cutter 
                  date</b><br />
                  <ul>
                    <li>Use Cutter-Sanborn table for Author Cutter 
                    <li>Do online shelflisting in ORION2 for correct alphabetic 
                      placement (keep track of cutter assigned in one day)</li>
                    <li>Search Orion2 for discipline cutter<br />
                      (subj Dissertations Academic UCLA [discipline])</li>
                  </ul>
                </td>
              </tr>
              <tr>
                <td valign="top">100</td>
                <td>Check OCLC AF<br />
                  Check Orion2 for existing bibliographic records by author (if 
                  form of name is different, route to Supervisor)<br />
                  <ul>
                    <li> If no records in OCLC AF and no Orion2 bibliographic 
                      records found, formulate name as per AACR2</li>
                    <li>Add date of birth if included in Vita (Dissertations)</li>
                  </ul>
                </td>
              </tr>
              <tr>
                <td valign="top">245</td>
                <td> Transcribe title ($a), other title information ($b, if applicable) 
                  and statement of responsibility ($c). </td>
              </tr>
              <tr>
                <td>260</td>
                <td> Input DATE only in $c. 
              <tr>
                <td valign="top">300</td>
                <td> Add as appropriate. Ex.:<br />
                  <br />
                  lxi, 124 leaves : $b ill., maps ; $c 28 cm.<br />
                  2 v. (xii, 740 leaves) : $b col. ill. ; $c 28 cm. </td>
              </tr>
              <tr>
                <td valign="top">502</td>
                <td> Input appropriate note and add DATE: <br />
                  <br/>
                  Thesis (M.S.)--UCLA, DATE.<br />
                  Thesis (Ph. D.)--UCLA, DATE<br />
                </td>
              </tr>
              <tr>
                <td valign="top">500</td>
                <td> Add if appropriate:<br />
                  Vita.</td>
              </tr>
              <tr>
                <td valign="top">504</td>
                <td> Add:<br />
                  <br />
                  Includes bibliographical references (leaves ____).</td>
              </tr>
              <tr>
                <td valign="top">690</td>
                <td> Add (input correct DEPARTMENT):<br />
                  <br />
                  Dissertations, Academic $z UCLA $x Department.<br />
                </td>
              </tr>
              <tr>
                <td>910</td>
                <td> Add initials and date [YYMMDD]</td>
              </tr>
            </table>
            <ul>
              <li>Update on OCLC</li>
              <li>Location stamp inside (p. after t.p.) and outside envelope</li>
              <li>Write call no. (inside and outside) following SEL format: place 
                double cutters on separate lines.</li>
            </ul>
            <h3>Suggested workflow</h3>
            <ul>
              <li>Each copy cataloger should catalog materials by discipline to 
                ensure correct alphabetic shelflisting of author.</li>
              <li>Place cataloged materials on Theses & Dissertation shelf for 
                Physical Processing & Marking.</li>
              <li>Route problems to Supervisor.</li>
            </ul>
           

<!--- ************************************
			END PAGE CONTENT
****************************************** --->
<!--- Do not alter this tag! --->
<cfinclude template="/cataloging/includes/incEnd.cfm">