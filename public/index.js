const draggables = document.querySelectorAll('.draggable');
const containers = document.querySelectorAll('.container');


draggables.forEach(draggable =>{
    draggable.addEventListener('dragstart',()=>{
        draggable.classList.add('dragging')

    })
    draggable.addEventListener('dragend',()=>{
        draggable.classList.remove('dragging')
    })

})

containers.forEach(container=>{
    container.addEventListener('dragover',e=>{
        e.preventDefault()
        const draggable = document.querySelector('.dragging')
        container.appendChild(draggable)
    })
})

var mondayChecked = false;
var tuesdayChecked = false;
var wednesdayChecked = false;
var thursdayChecked = false;
var fridayChecked = false;
var saturdayChecked = false;
var sundayChecked = false;

function calculateTotal(day){
    switch(day) {
        case 'monday':
            if(mondayChecked === false){
                mondayChecked = true;
                //get workouts from db
                //add
                //display
            } else{
                mondayChecked = false;
                //get workouts
                //subtract monday from total
                //display
            }
        case 'tuesday':
        case 'wednesday':
        case 'thursday':
        case 'friday':
        case 'saturday':
        case 'sunday':

    }
    //checked or unchecked
    //if checked:
    //get workouts
    //calculate total calories
    //display total
    //write to db

}