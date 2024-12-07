// noinspection JSUnresolvedReference,JSUnusedLocalSymbols

$(document).ready(function() {
    console.log("Page is ready!");
    registrationFormValidation();
    editProfile();
    addPostForm();
    let allPostsRef = $('.c-link')[0];
    loadPosts(0,allPostsRef);
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

function loadPosts(categoryId,reference){
    $("#loaderPosts").show();
    $(".c-link").removeClass('active');
    $.ajax({
        url: contextPath + "/templates/loadPosts.jsp",
        data: {categoryId:categoryId},
        success: function (data,textStatus,jqXHR){
            console.log("Success");
            $("#loaderPosts").hide();
            $("#postsContainer").html(data);
            $(reference).addClass('active');
        },
        error:function (data,textStatus,jqXHR) {
            console.log("Error");
        }
    })
}

function deletePost(postId) {
    let f = new FormData();
    f.append("postId", postId);
    console.log("FormData: ", f);

    $.ajax({
        data: f,
        type: "POST",
        url: contextPath + "/deletePostServlet",
        processData: false,
        contentType: false,
        success: function (data, textStatus, jqXHR) {
            console.log("Success deleted post");
            if (data.redirect) {
                console.log("Redirecting to: " + data.redirect);
                window.location.href = data.redirect;
            }
        },
        error: function (data, textStatus, jqXHR) {
            console.log("Error occurred while deleting post");
        }
    });
}


function doLike(postId, userId) {
    console.log("Liking post: " + postId);
    const data = { userId: userId, postId: postId, operation: 'like' };

    $.ajax({
        type: "POST",
        url: contextPath + "/likeServlet",
        data: data,
        success: function(response) {
            if (response.trim() === "true") {
                let $likeButton = $("#like-btn-" + postId);
                $likeButton
                    .removeClass("btn-outline-light")
                    .addClass("btn-success")
                    .attr("onclick", `doDislike(${postId}, ${userId})`)
                    .find("i")
                    .removeClass("fa-thumbs-o-up")
                    .addClass("fa-thumbs-up");

                // Optionally update like counter
                let $likeCounter = $("#like-counter-" + postId);
                $likeCounter.text(parseInt($likeCounter.text()) + 1);
            }
        },
        error: function() {
            console.log("Error liking the post.");
        },
    });
    location.reload();
}

function doDislike(postId, userId) {
    console.log("Disliking post: " + postId);
    const data = { userId: userId, postId: postId, operation: 'dislike' };

    $.ajax({
        type: "POST",
        url: contextPath + "/likeServlet",
        data: data,
        success: function(response) {
            if (response.trim() === "true") {
                let $likeButton = $("#like-btn-" + postId);
                $likeButton
                    .removeClass("btn-success")
                    .addClass("btn-outline-light")
                    .attr("onclick", `doLike(${postId}, ${userId})`)
                    .find("i")
                    .removeClass("fa-thumbs-up")
                    .addClass("fa-thumbs-o-up");

                // Optionally update like counter
                let $likeCounter = $("#like-counter-" + postId);
                $likeCounter.text(parseInt($likeCounter.text()) - 1);
            }
        },
        error: function() {
            console.log("Error disliking the post.");
        },
    });
    location.reload();
}
