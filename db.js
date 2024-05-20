const mysql = require("mysql2/promise")
const connection = mysql.createPool({
    'host': 'localhost',
    'user': 'root',
    'password': 'quenhbupbe240201',
    'database': 'task_manager',
})

module.exports = connection