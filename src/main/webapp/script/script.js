// noinspection JSUnresolvedReference,JSUnusedLocalSymbols

$(document).ready(function() {
    console.log("Page is ready!");
    registrationFormValidation();
    editProfile();
    addPostForm();
    loadPosts();
});

function editProfile(){
    let editStatus=false;
    $("#edit-profile-btn").click(function(){

        if(editStatus===false){
            $("#profile-details").hide();
            $("#profile-edit").show();
            editStatus=true;
            $(this).text("back");
        }else{
            $("#profile-details").show();
            $("#profile-edit").hide();
            editStatus=false;
            $(this).text("edit");
        }
    });
}

function registrationFormValidation(){
    $("#registrationForm").on("submit", function(event) {
        event.preventDefault();
        let f = new FormData(this);
        console.log(f);

        $("#submit-btn").hide();
        $("#loader").show();

        $.ajax({
            url: contextPath + "/registerServlet",
            data: f,
            type: "POST",
            success: function (data,textStatus,jqXHR){
                console.log(data);
                console.log("Inside success function");
                $("#loader").hide();
                $("#submit-btn").show();
                if(data.trim()==="success"){
                    swal("Click on either the button or outside the modal.")
                        .then((value) => {
                            swal(`Successfully registered`);
                        });
                }else{
                    swal(`Failure`);
                }
            },
            error:function (data,textStatus,jqXHR) {
                console.log(jqXHR);
                console.log("error");
                $("#loader").hide();
                $("#submit-btn").show();
            },
            processData: false,
            contentType: false
        });
    });
}


function addPostForm(){
    $("#addPostForm").on("submit", function(event) {
        event.preventDefault();
        let formData = new FormData(this);
        console.log(formData);

        $.ajax({
            url: contextPath + "/addPostServlet",
            data: formData,
            type: "POST",
            success: function (data,textStatus,jqXHR){
                console.log("Success");
                console.log(data);
                if(data.trim()==="Done"){
                    swal({text: "Post added successfully",icon: "success",});
                }else{
                    swal(`Failure`);
                }
            },
            error:function (data,textStatus,jqXHR) {
                console.log("Inside error function");
                swal(`Fatal failure`);
            },
            processData: false,
            contentType: false
        })
    });
}

function loadPosts(){
    $.ajax({
        url: contextPath + "/templates/loadPosts.jsp",
        success: function (data,textStatus,jqXHR){
            console.log("Success");
            $("#loaderPosts").hide();
            $("#postsContainer").html(data);
        },
        error:function (data,textStatus,jqXHR) {
            console.log("Error")
        }
    })
}