<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>DIGITAL AUDIO HELP</title>
</head>

<LINK href="audio.css" rel="stylesheet" type="text/css">

<body>

<h3>Digital Audio Reserves: Policies and Procedures</h3>

<ol type="I">
<li><a href="#p" class="go2">Principles</a></li>
<li><a href="#r" class="go2">Ripping tracks from CDs</a></li>
<li><a href="#d" class="go2">Digitizing LPs and other analog recordings</a></li>
<li><a href="#f" class="go2">Filenames</a></li>
<li><a href="#s" class="go2">SMIL files</a></li>
<li><a href="#e" class="go2">Data entry using MS Access and the Web</a></li>
</ol>

<hr color="Teal" noshade>

<a name="p" class="head"><h4>PRINCIPLES</h4></a>

<ol>
<li>Audio files for UCLA-owned materials (mostly Music Library and Ethnomusicology Archive recordings) are kept from quarter to quarter.</li>
<li>All other commercial recordings are deleted at the end of the quarter and the database updated to reflect this.</li>
<li>Private recordings (e.g. field recordings) may be retained with the agreement of the </li>
<li>As far as possible information about recordings should be copied from the OPAC (ORION2).</li>
<li>Commercial recordings provided by faculty are not normally acceptable. If we use a commercial recording provided by a faculty member it is our policy to buy a copy for the Library or the Archive. An order can be submitted automatically using the Web application.</li>
<li>For classical recordings you will normally create a new record for each works (e.g. symphony, opera, quartet, etc.). Where this is unclear (e.g. is the work an individual song, or a song cycle?) check with a supervisor (Douglas, Bridget, David).</li>
<li>For popular recordings, jazz and world music, the "work" may either be an individual song or the entire CD depending on the nature of the recording. Be guided by the way the work has been cataloged in ORION2</li>
<li>Each record MUST contain at least the following information:
<ul>
<li>Title.</li>
<li>Label and number.</li>
<li>UCLA recordings must include the call number.</li>
<li>Non-UCLA recordings must include source information.</li>
<li>Status.</li>
</ul>
</li>
<li>Composer information should be entered for all concert/classical music recordings. For popular music and jazz recordings it is often appropriate to enter the artist as the composer (as the "creator" of the work).</li>
<li>Use the "Class info." field to enter any information specific to a class for which listening is assigned. Do not enter class-specific information in the main part of the description (composer, title, etc.).</li>
</ol>

<hr color="Teal" noshade>

<a name="r" class="head"><h4>RIPPING TRACKS FROM CDs</h4></a>

<ol>
<li>Use CDCopy to rip tracks from CDs.</li>
<li>We normally create a single file for each track. However, it will sometimes be necessary to combine tracks when the tracking on the CD does not make sense. Use SoundForge to combine tracks.</li>
<li>More rarely you will want to split tracks into smaller pieces. This can also be done in SoundForge. SoundForge can also be used to edit problematic beginnings and endings.</li>
<li>Tracks ripped from CDs are temporarily saved as WAV files on J: These large files may be kept for the duration of the quarter in case there are problems that need fixing, however they should be deleted at the end of the quarter to save space. RealAudio files should also be deleted at the end of each quarter as they duplicate files on the RealMedia server.</li>
</ol>

<hr color="Teal" noshade>

<a name="d" class="head"><h4>DIGITIZING LPs AND OTHER ANALOG RECORDINGS</h4></a>

<ol>
<li>LPs and Cassettes can be digitized either using equipment in 1118, or by asking Tim Edwards to do it using equipment in Music Library Special Collections. MLSC can also digitize reel-to-reel tapes.</li>
<li>When analog recordings are digitized we should KEEP THE WAV FILES. There is a directory for these on the Digital Audio drive.</li>
</ol>

<hr color="Teal" noshade>

<a name="f" class="head"><h4>FILENAMES</h4></a>

<ol>
<li>For UCLA Library and Ethno Archive records the base of the filename should be the CATALOG CALL NUMBER. e.g. cda1212</li>
<li>For other commercial recordings, use the label and number as the base. e.g. dg123456</li>
<li>For faculty field recordings and other private recordings, use the owner's name and a number. e.g. rees1</li>
<li>To designate individual parts of recordings be sure to enter VOLUME, SIDE and DISC numbers. The system will turn this into a filename for you. This will ensure that there are no duplications in recordings with multiple discs, records, and volumes.</li>
</ol>

<hr color="Teal" noshade>

<a name="s" class="head"><h4>SMIL FILES</h4></a>

<ol>
<li>SMIL = &quot;Synchronized Multimedia Integration Language.&quot;</li>
<li>SMIL are XML files that instruct the audio streaming software. They include the address of the server, information about the recording (metadata), and the order in which to play the tracks if there is more than one.</li>
<li>SMIL files are FTPed to the audio server along with the RM files. Both the SMIL files and RM files need to be present for the audio file to stream to a listener.</li>
<li>SMIL files generated by the MS Access application are created in the Digital Audio folder (<strong>lis2kserv03\digital audio\__SMIL FILES__</strong>). SMIL files generated by the Web application are created in the CF audio application folder (<strong>lis51\music\audio2003\ml\smil</strong>).</li>
</ol>

<hr color="Teal" noshade>

<a name="e" class="head"><h4>DATA ENTRY USING MS ACCESS AND THE WEB</h4></a>

<ol>
<li>The metadata for online sound recordings are stored in an SQLServer database that is maintained by Library Information Systems. We do not have access to this database directly. However, there are two applications that we use to update the data: MS Access, and the ColdFusion web application (<strong>unitproj/music/audio2003/ml</strong>).</li>
<li>This listening lists that the students use draw data directly from this database, so all updates are are available to students immediately.</li>
<li>It does not matter which system you use to enter data. However, the web application does not yet have all the functionality of the Access system. For instance, setting the current term must be done using Access. It is also possible to host documents, provide access to scores and other images, and link to other webpages using the Access application. This functionality will be added to the Web system in the future.</li>
</ol>

<hr color="Teal" noshade>

</body>
</html>
