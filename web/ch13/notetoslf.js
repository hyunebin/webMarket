window.onload = init;



function init(){
    let button = document.getElementById("add_button")
    button.onclick = createSticky; //버튼을 클릭시 해당 함수 호출

    let stickiesArray = localStorage["stickiesArray"]; //배열 불러오기

    if(!stickiesArray){ //배열이 없다면
        stickiesArray=[]; // 배열 생성
        localStorage.setItem("stickiesArray", JSON.stringify(stickiesArray)) // JSON객체를 String으로 추가
    }else{
        stickiesArray = JSON.parse(stickiesArray); // stickiesArray를 객체로 만들어 준다.
    }

    for(let i = 0; i < stickiesArray.length; i++){
        let key = stickiesArray[i];
        let value = JSON.parse(localStorage[key]);
        addStickyToDOM(key, value) // key와 value에 따라서 Sticky를 html Dom에 추가
    }
}

function getStickiesArray() {
    let stickiesArray = localStorage.getItem("stickiesArray")
    if(!stickiesArray){
        stickiesArray=[];
        localStorage.setItem("stickiesArray", JSON.stringify(stickiesArray))
    }else{
        stickiesArray = JSON.parse(stickiesArray);
    }

    return stickiesArray;
}


function createSticky() {
    var stickiesArray = getStickiesArray();
    var currentDate = new Date();
    var colorSelectObj = document.getElementById("note_color");
    var index = colorSelectObj.selectedIndex;
    var color = colorSelectObj[index].value;
    var key = "sticky_" + currentDate.getTime();
    var value = document.getElementById("note_text").value;

    var stickyObj = {
        "value": value,
        "color": color
    };

    localStorage.setItem(key, JSON.stringify(stickyObj));
    stickiesArray.push(key);
    localStorage.setItem("stickiesArray", JSON.stringify(stickiesArray));

    addStickyToDOM(key, stickyObj);
}



function addStickyToDOM(key, stickyObj) {
    let stickies = document.getElementById("stickies")
    let sticky = document.createElement("li")
    sticky.setAttribute("id", key)
    sticky.style.backgroundColor = stickyObj.color;
    let span = document.createElement("span")
    span.setAttribute("class", "sticky")

    span.innerHTML = stickyObj.value;
    sticky.appendChild(span)
    stickies.appendChild(sticky)

    sticky.onclick = deleteSticky;
}


function deleteSticky(e){

    let key = e.target.id

    if(e.target.tagName.toLowerCase() == "span"){
        key = e.target.parentNode.id;
    }
    localStorage.removeItem(key)

    let stickiesArray = getStickiesArray();
    if(stickiesArray){
        for(let i  = 0; i < stickiesArray.length; i++){
            if(key == stickiesArray[i]){
                stickiesArray.slice(i,1) //index위치 i부터 1개의 요소를 삭제
            }
        }

        localStorage.setItem("stickiesArray",JSON.stringify(stickiesArray))
        removeStickyFromDOM(key)
    }
}

function removeStickyFromDOM(key) {
    let sticky = document.getElementById(key);
    sticky.parentNode.removeChild(sticky)
}

