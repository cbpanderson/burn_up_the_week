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

// var mondayChecked = false;
// var tuesdayChecked = false;
// var wednesdayChecked = false;
// var thursdayChecked = false;
// var fridayChecked = false;
// var saturdayChecked = false;
// var sundayChecked = false;

// function calculateTotal(amt){

//     switch(day) {
//         case 'monday':
//             if(mondayChecked === false){
//                 mondayChecked = true;
//                 displayTotal(day);
//             } else{
//                 mondayChecked = false;
//                 //get workouts
//                 //subtract monday from total
//                 //display
//             }
//         case 'tuesday':
//         case 'wednesday':
//         case 'thursday':
//         case 'friday':
//         case 'saturday':
//         case 'sunday':

function submitWorkout(e){
    e.preventDefault();
    
    console.log(e);
}

//     }
//     //checked or unchecked
//     //if checked:
//     //get workouts
//     //calculate total calories
//     //display total
//     //write to db

// }

// displayTotal(day){
//     //get workouts from db
//     //for each workout if 'day' get workout id add to array of workout ids
//      //for each item in workout ids array get calries_amount and add up
//     //get total from front end
//     //display

// }