//SNIFFING FOR STYLE SHEET TYPE
var whatbrowse;
if (navigator.userAgent.indexOf('Macintosh') != -1) {
	whatbrowse = "mac";
	}
else if (navigator.appVersion.indexOf("MSIE") == -1)  {
	whatbrowse = "test1";
	}
else if (navigator.appName.indexOf("Netscape") == -1) {
	whatbrowse = "test1";
	}
var stylelink = "<LINK REL=stylesheet HREF=\"css/biomed_" + whatbrowse + ".css\" TYPE=\"text/css\">";
document.write(stylelink);

// Load images.
if (document.images) {        // Active Images
        imagespacer = new Image();
        imagespacer.src = "images/spacer.gif";
        ucla = new Image();
        ucla.src = "images/caption_ucla.gif";
        biomed = new Image();
        biomed.src = "images/caption_biomed.gif";
        library = new Image();
        library.src = "images/caption_library.gif";
        find = new Image();
        find.src = "images/caption_find.gif";
        read = new Image();
        read.src = "images/caption_read.gif";
        view = new Image();
        view.src = "images/caption_view.gif";
        learn = new Image();
        learn.src = "images/caption_learn.gif";
        request = new Image();
        request.src = "images/caption_request.gif";
        visit = new Image();
        visit.src = "images/caption_visit.gif";
        contact = new Image();
        contact.src = "images/caption_contact.gif";
        faq = new Image();
        faq.src = "images/caption_faq.gif";
        o2 = new Image();
        o2.src = "images/caption_orion2.gif";
        melvyl = new Image();
        melvyl.src = "images/caption_melvyl.gif";
        cdl = new Image();
        cdl.src = "images/caption_cdl.gif";
        searchlight = new Image();
        searchlight.src = "images/caption_searchlight.gif";
        caption = new Image();
        caption.src = "images/caption_blank.gif";
    }

// Function to 'activate' images.
        function load(imgName) {
        if (document.images) {
            document.floatimg.src = eval(imgName + ".src");
        }
    }

// Function to 'deactivate' images.
    function unload() {
        if (document.images) {
        document.floatimg.src = eval("caption.src");
        }
    }

// Function for pulldown menu quick link.
    function go_quicklink1(){
    var resultPage=document.sitebar1.siteChoice1;
    for (var i = 0; i < document.sitebar1.siteChoice1.length; i++)
        {
        if (resultPage.options[i].selected == true)
        if (resultPage.options[i].value != "")
        parent.location.href=resultPage.options[i].value;
        }
    }
    var flag=0;
    function changeFlag(){
    flag=1
        }

// Function for pulldown menu subject link.
    function go_quicklink2(){
    var resultPage=document.sitebar2.siteChoice2;
    for (var i = 0; i < document.sitebar2.siteChoice2.length; i++)
        {
        if (resultPage.options[i].selected == true)
        if (resultPage.options[i].value != "")
        parent.location.href=resultPage.options[i].value;
        }
    }
    var flag=0;
    function changeFlag(){
    flag=1
        }

// Function for select search.
function go_search1() {
        if (document.materialsearch1.database.options[document.materialsearch1.database.selectedIndex].value == "") {
        alert("Please select a search type from the Quick Search menu.")
        }
        else        {
        if (document.materialsearch1.query.value == "") {
        alert("Please enter keywords to search.")
        }
        else {
        location = document.materialsearch1.database.options[document.materialsearch1.database.selectedIndex].value + escape(document.materialsearch1.query.value)
        }
    }
}

// Function for select search.
function go_search2() {
        if (document.materialsearch2.database.options[document.materialsearch2.database.selectedIndex].value == "") {
        alert("Please select a search type from the Quick Search menu.")
        }
        else        {
        if (document.materialsearch2.query.value == "") {
        alert("Please enter keywords to search.")
        }
        else {
        location = document.materialsearch2.database.options[document.materialsearch2.database.selectedIndex].value + escape(document.materialsearch2.query.value)
        }
    }
}


// Function for tips popups.
function popups1(name) {
        _loc = 'tipspopups/' + name + '.html';
        popupsWin =                window.open(_loc,"PSpopups","toolbar=no,width=500,height=400,scrollbars=yes,resizable=yes");
        if (popupsWin.opener == null) { popupsWin.opener = self }
    } 

// Function to display day and date.
function display_todays_date()
    {
        var today = new Date();
        var numerical_day=today.getDay();
        var numerical_month=today.getMonth();
        var date=today.getDate();
        var year=2000;
        var weekday_array = new
        Array('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday');
        var day_of_the_week = weekday_array[numerical_day];
        var month_array = new
             Array('January','February','March','April','May','June','July','August','September','October','November','December');
         var month_name = month_array[numerical_month];
         var date_string=day_of_the_week+', '+month_name+' '+date+', '+year;
         document.write(date_string)
     }

