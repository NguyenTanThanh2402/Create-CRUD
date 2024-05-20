const db_task = require("../db.js")

module.exports.getAllTasks = async () => {
    const [records_task] = await db_task.query("SELECT * FROM task")
    return records_task;
}

module.exports.getTaskById = async (id) => {
    const [[record_task]] = await db_task.query("SELECT * FROM task WHERE id = ?", [id])
    return record_task;
}

module.exports.deleteTask = async (id) => {
    const [{ affectedRowsTask }] = await db_task.query("DELETE FROM task WHERE id = ?", [id])
    return affectedRowsTask;
}

module.exports.addOrEditTask = async (obj, id = 0) => {
    const [{ affectedRowsTask }]= await db_task.query("CALL usp_task_add_or_edit(?,?,?)",
        [id, obj.Task_Name, obj.Completed])
    return affectedRowsTask;
}