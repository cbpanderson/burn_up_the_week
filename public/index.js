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



function calculateTotal(weekBoxId){
    //checked or unchecked
    //if checked:
    //get workouts
    //calculate total calories
    //display total
    //write to db

    //if unchecked:
    //get workouts 
    //remove from total
    //display total
    //remove from db
}