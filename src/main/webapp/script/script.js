// noinspection JSUnresolvedReference,JSUnusedLocalSymbols

$(document).ready(function() {
    console.log("Page is ready!");
    registrationFormValidation();
    editProfile();
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