
// Load images.
if (document.images) {        // Active Images
        imagespacer = new Image();
        imagespacer.src = "../../images/spacer.gif";
        ucla = new Image();
        ucla.src = "../../images/caption_ucla.gif";
        biomed = new Image();
        biomed.src = "../../images/caption_biomed.gif";
        library = new Image();
        library.src = "../../images/caption_library.gif";
        find = new Image();
        find.src = "../../images/caption_find.gif";
        read = new Image();
        read.src = "../../images/caption_read.gif";
        view = new Image();
        view.src = "../../images/caption_view.gif";
        learn = new Image();
        learn.src = "../../images/caption_learn.gif";
        refresources = new Image();
        refresources.src = "../../images/caption_refresources.gif";		
        reserves = new Image();
        reserves.src = "../../images/caption_reserves.gif";		
        request = new Image();
        request.src = "../../images/caption_request.gif";
        visit = new Image();
        visit.src = "../../images/caption_visit.gif";
        contact = new Image();
        contact.src = "../../images/caption_contact.gif";
        faq = new Image();
        faq.src = "../../images/caption_faq.gif";		
        ask = new Image();
        ask.src = "../../images/caption_ask.gif";
        o2 = new Image();
        o2.src = "../../images/caption_orion2.gif";
        melvyl = new Image();
        melvyl.src = "../../images/caption_pubmed.gif";
        pubmed = new Image();
        pubmed.src = "../../images/caption_pubmed.gif";		
        cdl = new Image();
        cdl.src = "../../images/caption_cdl.gif";
        caption = new Image();
        caption.src = "../../images/caption_blank.gif";
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
    function go_quicklink(){
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
    function go_subject(){
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

// Function check ejournal form

function checkForm(form){
                                var keyString=trim(document.forms[1].keyword.value);
                                if(keyString.length<3){
                alert("Your keyword must be at least three letters.");
                return false
                }
        return true
        }

                function trim(st) {
                        var len = st.length
                        var begin = 0, end = len - 1;
                        while (st.charAt(begin) == " " && begin < len) {
                                begin++;
                        }
                        while (st.charAt(end) == " " && begin < end) {
                                end--;
                        }
                return st.substring(begin, end+1);
                }
        	
