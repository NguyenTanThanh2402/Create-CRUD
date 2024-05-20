const express = require("express")
const  Task_router  = express.Router()

const TaskService = require('../services/task.services')

//http://localhost:3000/api/tasks/
Task_router.get('/', async (req, res) => {
    const tasks = await TaskService.getAllTasks()
    res.send(tasks)
})

Task_router.get('/:id', async (req, res) => {
    const task = await TaskService.getTaskById(req.params.id)
    if (task == undefined)
        res.status(404).json('no record with given id : ' + req.params.id)
    else
        res.send(task)
})

Task_router.delete('/:id', async (req, res) => {
    const affectedRowsTask = await TaskService.deleteTask(req.params.id)
    if (affectedRowsTask == 0)
        res.status(404).json('no record with given id : ' + req.params.id)
    else
        res.send('deleted successfully.')
})

Task_router.post('/', async (req, res) => {
    await TaskService.addOrEditTask(req.body)
    res.status(201).send('created successfully.')
})

Task_router.put('/:id', async (req, res) => {
    const affectedRowsTask = await TaskService.addOrEditTask(req.body, req.params.id)
    if (affectedRowsTask == 0)
        res.status(404).json('no record with given id : ' + req.params.id)
    else
        res.send('updated successfully.')
})



module.exports = Task_router;