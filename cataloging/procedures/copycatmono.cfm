<!--- Page Title = Title that appears in the html <title> tag and in the page subtitle section below the menu bar --->
<cfset pageTitle="Copy Cataloging Section">
<!--- Last Updated Date = Enter the date the page was last updated. Use the format 'mm/dd/yyyy' --->
<cfset updatedDT = "08/23/2005">
<!--- Do not alter this tag! --->
<cfinclude template="/cataloging/includes/incBegin.cfm">
<!--- ************************************
			BEGIN PAGE CONTENT
****************************************** --->
<h2>Copy Cataloging Procedures For Monographs</h2>

<h3>Background</h3>
            <p>Copy Cataloging, unlike Rapid Cataloging and Rapid Processing procedures, 
              involves complete checking of both description and subject analysis 
              (i.e., verifying subjects and classification) in bibliographic records.</p>
            <p>The default mode for the Copy Cataloging Section is Rapid Processing, 
              but copy catalogers may select items for full copy cataloging, especially 
              records that may require subjects and/or classification, and more 
              accurate description.</p>
            <h3>Cataloging Tools &amp; Documentation</h3>
            <ul>
              <li>OCLC Bibliographic Formats &amp; Standards</li>
              <li>AACR2 (especially Chapters 1 &amp; 2, and other chapters as 
                appropriate to format in hand)</li>
              <li>LCRIs</li>
              <li>MARC21 for Bibliographic and Authority Data</li>
              <li>LC Classification Schedules</li>
              <li>Subject Cataloging Manuals: Subject Headings, Free-floating 
                Subdivisions, Shelflisting</li>
              <li>Cataloging Policies &amp; Procedures</li>
            </ul>
            <h3>Selection criteria of member copy materials for copy cataloging</h3>
            <ol>
              <li>Bib ELvl: 8, K, I, M</li>
              <li>040: Contributing Libraries</li>
              <li>Call number (090) and/or subjects (6XX) present in record</li>
            </ol>
            <p>(DLC/DLC and pcc records are processed through Rapid Cataloging).</p>
            <h3>Steps in procedure for copy cataloging</h3>
            <ul>
              <li>Do not upgrade pre-ISBD or ISBD description to AACR2 description 
                (especially pre- AACR2 records)</li>
              <li>Do not upgrade punctuation to AACR2 standards in pre-ISBD and 
                pre-AACR2 records</li>
              <li>Perform accurate bibliographic search to find matching copy 
                (attention to serials vs. monographs, and monographic sets)</li>
              <li>Check both fixed and variable fields</li>
              <li>Check description and subject analysis (i.e., verify subjects 
                and classification)</li>
              <li>Perform authority work as follows: 
                <ol>
                  <li>OCLC Authority File only for personal names, corporate bodies, 
                    conferences</li>
                  <li>OCLC Authority File and Subject Cataloging Manual (as needed) 
                    for subject headings and subdivisions</li>
                  <li>ORION2 and OCLC for all series and series-like headings 
                    (attention to series analysis and classification)</li>
                </ol>
              </li>
            </ul>
            <h3>Recommended steps</h3>
            <ul>
              <li>Verify that record matches the book</li>
              <li>Check fixed and variable fields:</li>
            </ul>
            <table border="1" cellspacing="0" cellpadding="3" width="80%" align="center">
              <tr> 
                <td width="30%">008:<br />
                  Desc, ELvl, Cont, Ills, Srce, Conf, GPub,Fest, Biog, Fict, DtSt, 
                  Indx, Dates, Lang, Ctry </td>
                <td valign="top">Verify, correct, add</td>
              </tr>
              <tr> 
                <td>006 </td>
                <td>Verify, correct, add if appropriate</td>
              </tr>
              <tr> 
                <td>007</td>
                <td>Verify, correct, add if appropriate</td>
              </tr>
              <tr> 
                <td>02X</td>
                <td>Verify, correct, add</td>
              </tr>
              <tr> 
                <td>041, 043</td>
                <td>Verify, correct, add, delete (if inappropriate)</td>
              </tr>
              <tr> 
                <td>049</td>
                <td>Change 049 to appropr iate $a location code and add other 
                  subfields, as needed, especially summary holdings</td>
              </tr>
              <tr> 
                <td>090</td>
                <td>Verify, correct, add (as appropriate) [use classification 
                  schedules, or Class Web]<br />
                  Do online shelflisting in ORION2<br/>
                  Consult Library of Congress online catalog, if needed</td>
              </tr>
              <tr> 
                <td>1xx</td>
                <td>Check OCLC AF</td>
              </tr>
              <tr> 
                <td>240</td>
                <td> Verify, correct, add as appropriate<br />
                  Indicators should be 10<br />
                  (Cutter to 240 as appropriate, especially translations)</td>
              </tr>
              <tr> 
                <td>245</td>
                <td> Check filing indicators<br />
                  Verify, correct as appropriate</td>
              </tr>
              <tr> 
                <td>246</td>
                <td> Verify, correct, add as appropriate</td>
              </tr>
              <tr> 
                <td>250</td>
                <td> Verify, correct, add as appropriate</td>
              </tr>
              <tr> 
                <td>260</td>
                <td> Verify, correct, add as appropriate<br />
                  (Attention to AACR2 1.4F)</td>
              </tr>
              <tr> 
                <td>300</td>
                <td> Verify, correct, add as appropriate</td>
              </tr>
              <tr> 
                <td valign="top">4xx</td>
                <td> Verify form and tracing, analysis and classification <br />
                  Check authority records on ORION2 and OCLC<br />
                  Verify, correct, add as appropriate<br />
                  If conflict exists, consult supervisor (traced/untraced, classed 
                  together/separate, series/not a series)</td>
              </tr>
              <tr> 
                <td>5xx</td>
                <td> Verify, correct, add as appropriate</td>
              </tr>
              <tr> 
                <td>504</td>
                <td> Verify, correct, add as appropriate</td>
              </tr>
              <tr> 
                <td>505</td>
                <td> Verify, correct</td>
              </tr>
              <tr> 
                <td valign="top">6xx</td>
                <td> Check OCLC AF<br />
                  Check Subject Cataloging Manual or OCLC AF as needed for both 
                  subjects and subdivisions<br />
                  Verify, correct, add/delete as appropriate</td>
              </tr>
              <tr> 
                <td>7xx</td>
                <td> Check OCLC AF<br />
                  Verify, correct, add/delete as appropriate</td>
              </tr>
              <tr> 
                <td>8xx</td>
                <td> Same as for 4XX (above)</td>
              </tr>
              <tr> 
                <td>910</td>
                <td> Add initials and date [YYMMDD]</td>
              </tr>
            </table>
            <h3>Suggested workflow</h3>
            <ul>
              <li>Each copy cataloger should sort materials into rapid processing 
                vs. full copy cataloging.</li>
              <li>Process the books designated for regular copy cataloging together. 
                Process the books for rapid processing together.</li>
            </ul>
            <!-- #EndEditable --></td>
     </tr>
</table>

<!--end text-->





<!--- ************************************
			END PAGE CONTENT
****************************************** --->
<!--- Do not alter this tag! --->
<cfinclude template="/cataloging/includes/incEnd.cfm">